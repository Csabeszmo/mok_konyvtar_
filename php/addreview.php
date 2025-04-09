<?php

// Include environment
require_once('../../common/php/environment.php');

// Get arguments
$args = Util::getArgs();

// Connect to MySQL server
$db = new Database();

// Set SQL command
$query= "SELECT `user_id`, `book_id` 
           FROM `reviews` 
          WHERE `user_id` = :user_id 
            AND `book_id` = :book_id
          LIMIT 1";

// Execute SQL command
$result = $db->execute($query, ['user_id' => $args['user_id'], 'book_id' => $args['book_id']]);

// Check result
if (!is_null($result)) {
    $db = null;
    Util::setError('A felhasználó már értékelte a könyvet!');
}

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

// Check if there are affected rows
if(!$result['affectedRows']){
    Util::setError("Nem működik az értékelés");
}

// Set response
Util::setResponse($result);