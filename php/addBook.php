<?php

// Include environment
require_once('../../common/php/environment.php');

// Get arguments
$args = Util::getArgs();

// Connect to MySQL server
$db = new Database();

// Set SQL command
$query = "INSERT INTO `myrents`
                     (`user_id`, 
                      `book_id`,
                      `db`,
                      `return_date`) 
             VALUES  (:user_id, :book_id, :db, :return_date)";

// Execute SQL command
$result = $db->execute($query, [$args['user_id'], $args['book_id'], $args['db'], $args['return_date']]);

// Check result's last insert id
if (!$result['lastInsertId']){
      Util::setError("Nem sikerült a könyv kosárba helyezése!");
}

// Close connection
$db = null;

// Set response
Util::setResponse("A könyv kosárba helyezése sikerült!");