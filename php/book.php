<?php

// Include environment
require_once("../../common/php/environment.php");

// Get arguments
$args = Util::getArgs();

// Connect to MySQL server
$db = new Database();

// Set SQL command
$query = "SELECT `books`.`title`, 
                 `authors`.`first_name`,
                 `authors`.`last_name`,
                 `authors`.`biography`,
                 `authors`.`author_image_url`,
                 `authors`.`birth_date`,
                 `authors`.`death_date`,
                 `books`.`translator`,
                 `books`.`publisher`,
                 `books`.`series`,
                 `books`.`pages`,
                 `books`.`publication_year`,
                 `books`.`binding_type`,
                 `books`.`isbn`,
                 `books`.`description`,
                 `books`.`detailed_description`,
                 `books`.`cover_image_url`,
                 `categories`.`categories_name`
            FROM `books`
      INNER JOIN `authors`
              ON `books`.`author_id` = `authors`.`author_id`
      INNER JOIN `categories`
              ON `books`.`categories_id` = `categories`.`categories_id`
           WHERE `books`.`book_id` = :book_id
           LIMIT 1;";

// Execute SQL command
$result = $db->execute($query, $args);

// Set SQL command
$db = null;

// Check result
if (!is_null($result)) {
    $result = $result[0];
}

// Set response
Util::setResponse($result);