<?php

// Include environment
require_once('../../common/php/environment.php');

// Get arguments
$args = Util::getArgs();

// Connect to MySQL server
$db = new Database();

// Set SQL command
$query = "SELECT `phone`, 
                 `city`, 
                 `postalcode`, 
                 `address`,
                 `email`
            FROM `users` 
           WHERE `user_id` = :user_id
           LIMIT 1;";

// Execute SQL command
$result = $db->execute($query, $args);

// Close connection
$db = null;

// Check result
if (!is_null($result))
  $result = $result[0];

// Set response
Util::setResponse($result);