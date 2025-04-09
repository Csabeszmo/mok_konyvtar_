<?php

// Include environment
require_once("../../common/php/environment.php");

// Get arguments
$args = Util::getArgs();

// Connect to MySQL server
$db = new Database();

// Set SQL command
$query =  "SELECT `user_id`, 
				  `first_name`, 
				  `middle_name`, 
				  `last_name`,
				  `password`
		     FROM `users`  
		    WHERE `email` = ? 
			AND   `is_active` = 1 
		    LIMIT 1;";

// Execute SQL command
$result = $db->execute($query, array($args['email']));

// Close connection
$db = null;

// Check if email exists
if (is_null($result)) {
	Util::setError('Nincs ilyen felhasználó!');
}

// Simplifying the result
$result = $result[0];

// Check password
if ($result['password'] !== $args['password']) {
	Util::setError('Hibás jelszó!');
}

// Remove password property
unset($result['password']);

// Set response
Util::setResponse($result);