<?php

//Include environment
require_once("../../common/php/environment.php");

// Get arguments
$args = Util::getArgs();

// Connect to MySQL server
$db = new Database();

// Set SQL command
$query = "SELECT event_id 
          FROM event_items 
          WHERE user_id = :user_id";

// Execute SQL command
$result = $db->execute($query, $args);

// Close connection
$db = null;

// Set response
Util::setResponse($result);
