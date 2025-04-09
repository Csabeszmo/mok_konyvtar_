<?php

// Include environment
require_once("../../common/php/environment.php");

// Connect to MySQL server
$db = new Database;

// Set SQL command
$query= "SELECT `id`, 
                `name`, 
                `date`, 
                `description`, 
                `img` 
                FROM `events`";

// Execute SQL command
$result = $db->execute($query);

// Close connection
$db = null;

// Set response
Util::setResponse($result);