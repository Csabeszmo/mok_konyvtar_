<?php

// Include environment
require_once("../../common/php/environment.php");

// Get arguments
$args = Util::getArgs();

// Connect to MySQL server
$db = new Database();

// Set SQL command
$query= "INSERT INTO `reviews` 
                    (`user_id`, 
                     `book_id`, 
                     `rating`) 
             VALUES (?,?,?)";

// Execute SQL command
$result = $db->execute($query, array_values($args));

// Close connection
$db = null;

// Set response
Util::setResponse($result);