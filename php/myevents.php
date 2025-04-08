<?php

require_once("../../common/php/environment.php");

$args = Util::getArgs();

$db = new Database;

$query= "SELECT `events`.`name` AS `Az esemény neme`,
                `events`.`date` AS `Az esemény időpontja` 
           FROM `event_items` 
     INNER JOIN `events` 
             ON `events`.`id` = `event_items`.`event_id`
          WHERE `event_items`.`user_id` = :user_id;";

$result = $db->execute($query, $args);

$db = null;

Util::setResponse($result);