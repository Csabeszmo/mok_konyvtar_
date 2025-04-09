<?php

// Include environment
require_once("../../common/php/environment.php");

// Connect to MySQL server
$db = new Database();

// Set SQL command
$query= "SELECT `books`.`book_id`,
                `books`.`title`, 
                `authors`.`first_name`,
                `authors`.`last_name`,
                `books`.`cover_image_url`
           FROM `books`
     INNER JOIN `authors` 
             ON `books`.`author_id` = `authors`.`author_id`";

// Execute SQL command
$result = $db->execute($query);

// Close connection
$db = null;

// Set response
Util::setResponse($result);