<?php
/*
 *
 */

class Category {

    //
    private $conn;
    public $tree = array();
    const USERNAME = 'tree';
    const PASSWORD = 'tree';
    const HOST = 'localhost';
    const DB = 'tree';


    // Database Connection
    public function __construct(){

        $username = self::USERNAME;
        $password = self::PASSWORD;
        $host = self::HOST;
        $db = self::DB;
        $this->conn = new PDO("mysql:dbname=$db;host=$host", $username, $password);
    }

    // Creating tree
    public function createTree(&$list, $parent){

        $tree = array();
        $child = array();
        foreach ($parent as $listI){
            $child[$listI['id']] = $listI['parent_id'];

            if(isset($list[$listI['id']])){
                $listI['child'] = $this->createTree($list, $list[$listI['id']]);
            }
            $tree[] = $listI;
        }
        return $tree;
    }

    // Getting all data results
    public function getTree(){

        $sql = "SELECT * FROM categories";

        $sth = $this->conn->prepare($sql);
        $sth->execute();


        $new = array();
        $result = $sth->fetchAll(PDO::FETCH_ASSOC);

        // Checking if category has more that one article
        $parents = array();
        $newRes = array();
        foreach ($result as $res){
            if ($res['is_article'] == 1){
                if (!in_array($res['parent_id'], $parents)){
                    array_push($newRes, $res);
                }
                array_push($parents, $res['parent_id']);
            } else {
                array_push($newRes, $res);
            }
        }

        foreach ($newRes as $arr){
            $new[$arr['parent_id']][] = $arr;
        }

        $tree = $this->createTree($new, array($result[0]));

        return json_encode($tree);
    }

}

// API URL parsing
if ($_SERVER['REQUEST_METHOD'] == 'GET'){

    // Check if API Controller exist
    if (class_exists($_GET['module'])){
        $obj = new $_GET['module']();

        // Check if API Controller method exist
        if (method_exists($obj, $_GET['action'])){
            echo $obj->{$_GET['action']}();
        } else {
            echo json_encode(
                [
                    "error code" => 400,
                    "message" => "Action not found"
                ]);
        }

    } else {
        echo json_encode(
            [
                "error code" => 400,
                "message" => "Module not found"
            ]);
    }
}