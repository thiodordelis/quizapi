<?php

/** 
* Main class for mAPI
* @author thiodor@gmail.com
*/

include realpath(dirname(__FILE__)) . '/mDB.class.php';
include realpath(dirname(__FILE__)) . '/helper.class.php';

class mAPI {
  public $db;
  public $dbh;
  public $pagination;
  private $paths = array();
  public $helperClass;
  public $uid;

  function __construct($options) {
    //Seed random
    mt_srand((double)microtime()*1000000);
    //DB class loading
    $this->db = new Database($options);
    $this->dbh=$this->db->getDb();
    //Helper function loading
    $this->helperClass = new Helper();
    $this->uid = $this->helperClass->generateStrongPassword();
  }

  public function request() {
    $uri = $_SERVER['REQUEST_URI'];
    $method = $_SERVER['REQUEST_METHOD'];
   
    $paths = explode('/', $this->paths($uri));
    array_shift($paths); // Hack; get rid of initials empty string
    
    $this->paths = $paths;
    array_shift( $this->paths );
		
    $resource = array_shift($paths);

    //We only accept call under /api endpoint
		if ($resource == 'api') {
      $this->handle_name($method, $this->paths);
		} else {
			// We only handle resources under 'api'
			header('HTTP/1.1 404 Not Found');
		}

  }

  private function handle_name($method, $name) {
    switch ($method) {
      case 'GET':
        switch ($this->paths[0]) {

          /*  
          * Create new questions collection
          * /api/new/[category]
          */
          case 'new':
            if(is_numeric($this->paths[1])) {
              $category = intval($this->paths[1]); 
            } else {
              $category = 0;
            }
            echo $this->create_collection($category);
            break;

          /*
          * Get a question from collection
          * /api/questions/[collection_id]/[category]
          */
          case 'questions':
            // If collection id is not alphanumeric, exit...
            if(!ctype_alnum($this->paths[1])){
              die(json_encode(array('code'=>400,'info'=>"Bad request")));
            }

            // Category is always integer
            if(is_numeric($this->paths[2])&& isset($this->paths[2])) {
              $category = intval($this->paths[2]); 
            } else {
              $category = 0;
            }

            if($this->db->tableExists($this->paths[1])) {
              echo $this->get_questions($this->paths[1], $category);
            } else {
              echo json_encode(array('code'=>401,'info'=>"Collection doesn't exist")); 
              http_response_code(401);
            }
          break;

          default:
            echo "Usage: <br>/api/new/[category] - Create a new collection of questions with optional [category] <br> /api/questions/[collection_id]/[category] - Get a question from [collection_id] from optional [category] <br> Categories: 1 Geography, 2 History";
            break;
        }
      break;

      case 'POST':

      break;
    }    
  }

  private function paths($url) {
		$uri = parse_url($url);
		return $uri['path'];
	}

  /*
  * Create a new collection of questions.
  * @param $category int - create a collection with questions of the specified category
  * @return string JSON encoded collection id  {"collection_id":id}
  * @author thiodor@gmail.com
  */
  private function create_collection(int $category = 0):string {
    $category = ($category>0 ? ' WHERE category = '.$category : '');
    $this->dbh->beginTransaction();
    $this->dbh->exec("CREATE TABLE ".$this->uid." LIKE questions");
    $this->dbh->exec("INSERT INTO ".$this->uid."(question,a,b,c,d,answer,category) SELECT question,a,b,c,d,answer,category FROM questions".$category);
    $this->dbh->commit();
    $arr = array('collection_id' =>$this->uid);
    return json_encode($arr);
  }

  private function get_questions(string $table, int $category = 0) {
    $pdo_parameters = array();
    $category = '';

    if($category>0) {
      array_push($pdo_parameters,array(':category'=>$category));
      $category = ' WHERE category = :category';
    } 

    $this->dbh->beginTransaction();
    $question_data = $this->dbh->prepare("SELECT id,question,a,b,c,d,answer,category  FROM ".$table." ".$category." ORDER BY RAND() LIMIT 1");
    $question_data->execute($pdo_parameters);

    if($question_data->rowCount()>0) {
      $results=$question_data->fetchAll(PDO::FETCH_ASSOC);
      $json=json_encode(array('code'=>200,"question"=>$results[0]["question"],"a"=>$results[0]["a"],"b"=>$results[0]["b"],"c"=>$results[0]["c"],"d"=>$results[0]["d"],"correct"=>$results[0]["answer"],"category"=>$results[0]["category"]));
      $delete_query=$this->dbh->prepare("DELETE FROM ".$table." WHERE id = ".$results[0]["id"]);
      $delete_query->execute();
      $this->dbh->commit();
      echo $json;
    } else {
      echo json_encode(array('code'=>204,'info'=>'Collection is empty')); 
    }

  }
  
}

$options = array(
      'database' => '',
      'username' => '',
      'password' => ''
      );

$myApi = new mAPI($options);
$myApi->request();