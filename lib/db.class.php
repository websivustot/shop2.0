<?php
class db
{
    private static $_instance = null;

    private $db; // Ресурс работы с БД

    /*
     * Получаем объект для работы с БД
     */
    public static function getInstance()
    {
        if (self::$_instance == null) {
            self::$_instance = new db();
        }
        return self::$_instance;
    }

    /*
     * Запрещаем копировать объект
     */

    private function __construct(){
    		//setlocale(LC_ALL, 'ru_RU.UTF8');
        // устанавливаем соединение с базой при создании объекта
    		$this->db = new PDO('mysql:host=' .MYSQL_SERVER . ';dbname='.MYSQL_DB, MYSQL_USER, MYSQL_PASSWORD);
    		$this->db->exec('SET NAMES UTF8');
    		$this->db->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
    }

    private function __sleep() {}
    private function __wakeup() {}
    private function __clone() {}

    /*
     * Выполняем соединение с базой данных // старый вариант
     */
    /*
    public function Connect($user, $password, $base, $host = 'localhost', $port = 3306)
    {
        // Формируем строку соединения с сервером
        $connectString = 'mysql:host=' . $host . ';dbname=' . $base . ';charset=UTF8;';
        $this->db = new PDO($connectString, $user, $password,
            [
                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC, // возвращать ассоциативные массивы
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION // возвращать Exception в случае ошибки
            ]
        );


    }
    */
    /*
     * Выполнить запрос к БД
     */
    //  public function Query($query, $params = array())
    //  {
//  $res = $this->db->prepare($query);
    //      $res->execute($params);
  //        return $res;
    //  }

    /*
     * Выполнить запрос с выборкой данных
     */
    // public function Select($query, $params = array())
    // {
    //     $result = $this->Query($query, $params);
    //     if ($result) {
    //         return $result->fetchAll();
    //     }
    // }

    // новые методы для работы с базой
    public function Select($query,$arr){ // поправил, добавил передачу массива псевдопеременных
  		$q = $this->db->prepare($query);
      $q->execute($arr);

  		if($q->errorCode() != PDO::ERR_NONE){
  			$info = $q->errorInfo();
  			die($info[2]);
  		}

  		return $q->fetchAll();
  	}


  	public function Insert($table , $object){
  		$columns = array();

  		foreach($object as $key => $value){

  			$columns[] = $key;
  			$masks[] = ":$key";

  			if($value === null){
  				$object[$key] = 'NULL';
  			}
  		}

  		$columns_s = implode(',', $columns);
  		$masks_s = implode(',', $masks);

  		$query = "INSERT INTO $table ($columns_s) VALUES ($masks_s)";

  		$q = $this->db->prepare($query);
  		$q->execute($object);

  		if($q->errorCode() != PDO::ERR_NONE){
  			$info = $q->errorInfo();
  			die($info[2]);
  		}

  		return $this->db->lastInsertId();
  	}

  	public function Update($table,$object,$where){
  		$sets = array();

  		foreach($object as $key => $value){

  			$sets[] = "$key=:$key";

  			if($value === NULL){
  				$object[$key]='NULL';
  			}
  		 }

  		$sets_s = implode(',',$sets);
  		$query = "UPDATE $table SET $sets_s WHERE $where";

  		$q = $this->db->prepare($query);
  		$q->execute($object);

  		if($q->errorCode() != PDO::ERR_NONE){
  			$info = $q->errorInfo();
  			die($info[2]);
  		}

  		return $q->rowCount();
  	}


  	public function Delete($table, $where){
  		$query = "DELETE FROM $table WHERE $where";
  		$q = $this->db->prepare($query);
  		$q->execute();

  		if($q->errorCode() != PDO::ERR_NONE){
  			$info = $q->errorInfo();
  			die($info[2]);
  		}

  		return $q->rowCount();
  	}

}
?>
