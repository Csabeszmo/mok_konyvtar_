<?php

require_once("../../common/php/environment.php");

$args = Util::getArgs();

$db = new Database();

$query = "SELECT `books`.`title` AS `Könyv címe`, 
                 `cart_items_books`.`start_date` AS `Kölcsönzés kezdete`, 
                 `cart_items_books`.`return_date` AS `Visszahozás határideje`, 
                 `cart_items_books`.`db` AS `Mennyiség`
            FROM `cart_items_books` 
      INNER JOIN `books`
              ON `books`.`book_id` = `cart_items_books`.`book_id`
           WHERE `cart_items_books`.`user_id` = :user_id";

$result = $db->execute($query, $args);

$db = null;

Util::setResponse($result);