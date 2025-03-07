<?php

declare(strict_types=1);

require_once("../../common/php/environment.php");

$args = Util::getArgs();

$db = new Database();

$query = "SELECT `books`.`title`, 
                 `books`.`cover_image_url`, 
                 `cart`.`start_date`, 
                 `cart`.`return_date`, 
                 `cart_items_books`.`db`, 
                 `cart_items_books`.`return_status` 
            FROM `cart_items_books` 
      INNER JOIN `books`
              ON `books`.`book_id` = `cart_items_books`.`book_id`
      INNER JOIN `cart`
              ON `cart`.`id` = `cart_items_books`.`cart_id`
           WHERE `cart`.`user_id` = :user_id";

$result = $db->execute($query, $args);

$db = null;

Util::setResponse($result);