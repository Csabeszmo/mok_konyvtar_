<?php

require_once("../../common/php/environment.php");

$args = Util::getArgs();

$db = new Database();

$query = "SELECT `users`.`last_name`, 
                 `users`.`first_name`, 
                 `users`.`email`, 
                 `books`.`title`, 
                 `cart_items_books`.`db`, 
                 `cart_items_books`.`start_date`, 
                 `cart_items_books`.`return_date` 
            FROM `cart_items_books` 
      INNER JOIN `users` 
              ON `users`.`user_id` = `cart_items_books`.`user_id` 
      INNER JOIN `books` 
              ON `books`.`book_id` = `cart_items_books`.`book_id` 
           WHERE `users`.`user_id` = :user_id; ";

$result = $db->execute($query, $args);

$db = null;

Util::setResponse($result);