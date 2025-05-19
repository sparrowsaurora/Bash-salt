<?php
// connect to small database for feedback

require "hidden.php";

//create connection
$conn = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);

// check connection
if($conn->connect_error) {
    die('Connection failed' . $conn->connect_error);
}