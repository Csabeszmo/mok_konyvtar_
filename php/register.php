<?php

// Include environment
require_once('../../common/php/environment.php');

// Get arguments
$args = Util::getArgs();

// Connect to MySQL server
$db = new Database();

// Set SQL command
$query= "SELECT `user_id` 
           FROM `users` 
          WHERE `email` = ?
          LIMIT 1;";

// Execute SQL command
$result = $db->execute($query, $args['email']);

// Check if email exists
if (!is_null($result)) {
    $db = null;
    Util::setError('A felhasználó ezen az email címen már létezik!');
}

// Set SQL command
$query= "INSERT INTO `users` 
                    (`last_name`,
                     `first_name`, 
                     `email`,
                     `password`, 
                     `is_active`) 
             VALUES (:first_name, :last_name, :email, :password, 1)";

// Execute SQL command
$result = $db->execute($query, array_values($args));

// Close connection
$db = null;

// Check if there are affected rows
if(!$result['affectedRows']){
    Util::setError("Nem működik a regisztráció!");
}

// Set response
Util::setResponse($result);