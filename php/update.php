<?php

// Include environment
require_once('../../common/php/environment.php');

// Get arguments
$args = Util::getArgs();

// Connect to MySQL server
$db = new Database(); 

// Set SQL command
$query = "UPDATE `users` SET   
                 `last_name`= :last_name,
                 `first_name`= :first_name, 
                 `middle_name`= :middle_name, 
                 `phone`= :phone, 
                 `city`= :city, 
                 `postalcode`= :postalcode, 
                 `address`= :address 
           WHERE `user_id` = :user_id
           LIMIT 1";

// Execute SQL command
$result = $db->execute($query, $args);

// Close connection
$db = null;

// Set response
Util::setResponse($result);