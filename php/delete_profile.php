<?php

// Include environment
require_once('../../common/php/environment.php');

// Get arguments
$args = Util::getArgs();

// if user_id is empty
if (empty($args['user_id'])) {
    Util::setError('User ID missing.');
    exit();
}

// Connect to MySQL server
$db = new Database();

// Set SQL command
$query = "DELETE FROM `users` WHERE `user_id` = :user_id";

// Execute SQL command
$result = $db->execute($query, $args);

// Close connection
$db = null;

// Check result
if ($result) {
    Util::setResponse('Törlés sikeres.');
} else {
    Util::setResponse('Törlés sikertelen.');
}