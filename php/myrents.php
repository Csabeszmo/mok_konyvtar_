<?php

// Include environment
require_once("../../common/php/environment.php");

// Get arguments
$args = Util::getArgs();

// Connect to MySQL server
$db = new Database();

// Set SQL command
$query = "SELECT `books`.`title` AS `Könyv címe`, 
                 `myrents`.`start_date` AS `Kölcsönzés kezdete`, 
                 `myrents`.`return_date` AS `Visszahozás határideje`, 
                 `myrents`.`db` AS `Mennyiség`
            FROM `myrents` 
      INNER JOIN `books`
              ON `books`.`book_id` = `myrents`.`book_id`
           WHERE `myrents`.`user_id` = :user_id";

// Execute SQL command
$result = $db->execute($query, $args);

// Close connection
$db = null;

// Set response
Util::setResponse($result);