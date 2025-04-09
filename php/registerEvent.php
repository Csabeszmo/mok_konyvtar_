<?php

// Include environment
require_once("../../common/php/environment.php");

// Get arguments
$args = Util::getArgs();

// Connect to MySQL server
$db = new Database();

// Set SQL command
$query = "INSERT INTO `event_items` (`user_id`, 
                                    `event_id`) 
                            VALUES (:user_id, :event_id)";

// Execute SQL command
$result = $db->execute($query, $args);

// Close connection
$db = null;

// Set response
Util::setResponse($result);