<?php

require_once("../../common/php/environment.php");

$args = Util::getArgs();

$db = new Database();

$query = "SELECT `books`.`title` AS `Címe`,
                 `books`.`cover_image_url` AS `Könyv`, 
                 `cart`.`start_date` AS `Kölcsönzés kezdete`, 
                 `cart`.`return_date` AS `Visszahozás határideje`, 
                 `cart_items_books`.`db` AS `Mennyiség`
            FROM `cart_items_books` 
      INNER JOIN `books`
              ON `books`.`book_id` = `cart_items_books`.`book_id`
      INNER JOIN `cart`
              ON `cart`.`id` = `cart_items_books`.`cart_id`
           WHERE `cart`.`user_id` = :user_id";

$result = $db->execute($query, $args);

$db = null;

Util::setResponse($result);