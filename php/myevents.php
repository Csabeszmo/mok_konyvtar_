<?php

require_once("../../common/php/environment.php");

$args = Util::getArgs();

$db = new Database;

$query= "SELECT `event_items`.`user_id`, 
                `event_items`.`event_id`, 
                `events`.`name`, 
                `events`.`date` 
           FROM `event_items` 
     INNER JOIN `events` 
             ON `events`.`id` = `event_items`.`event_id`
          WHERE `event_items`.`user_id` = :user_id;";

$result = $db->execute($query);

$db = null;

Util::setResponse($result);