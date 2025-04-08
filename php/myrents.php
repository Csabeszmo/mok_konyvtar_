<?php

require_once("../../common/php/environment.php");

$args = Util::getArgs();

$db = new Database();

$query = "SELECT `books`.`title` AS `Könyv címe`, 
                 `myrents`.`start_date` AS `Kölcsönzés kezdete`, 
                 `myrents`.`return_date` AS `Visszahozás határideje`, 
                 `myrents`.`db` AS `Mennyiség`
            FROM `myrents` 
      INNER JOIN `books`
              ON `books`.`book_id` = `myrents`.`book_id`
           WHERE `myrents`.`user_id` = :user_id";

$result = $db->execute($query, $args);

$db = null;

Util::setResponse($result);