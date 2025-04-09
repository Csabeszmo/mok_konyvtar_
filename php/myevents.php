<?php

// Include environment
require_once("../../common/php/environment.php");

// Get arguments
$args = Util::getArgs();

// Connect to MySQL server
$db = new Database;

// Set SQL command
$query= "SELECT `events`.`name` AS `Az esemény neme`,
                `events`.`date` AS `Az esemény időpontja` 
           FROM `event_items` 
     INNER JOIN `events` 
             ON `events`.`id` = `event_items`.`event_id`
          WHERE `event_items`.`user_id` = :user_id;";

// Execute SQL command
$result = $db->execute($query, $args);

// Close connection
$db = null;

// Set response
Util::setResponse($result);