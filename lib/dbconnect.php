<?php
$host='localhost';
$db = 'schema';
require_once "config_local.php";

$user="root";
$pass="12345678";


if(gethostname()=='users.iee.ihu.gr') {
	$mysqli = new mysqli($host, $user, $pass, $db,null,'/home/student/it/2012/it123909/mysql/run/mysql.sock');
} else {
        $mysqli = new mysqli($host, $user, $pass, $db);
}

if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . 
    $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

?>
