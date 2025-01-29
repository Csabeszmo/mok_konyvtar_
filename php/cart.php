<?php

declare(strict_types=1);

require_once("./environment.php");

$db = new Database();

$query = "SELECT `books`.`title`, 
                 `cart`.`loan_start_date`, 
                 `cart`.`return_date`, 
                 `cart`.`return_status`, 
                 `cart_items_books`.`db` 
          FROM `cart` 
          INNER JOIN `cart_items_books` 
          ON `cart`.`cart_id` = `cart_items_books`.`cart_id` 
          INNER JOIN `books` 
          ON `cart`.`book_id` = `books`.`book_id` 
          WHERE `cart`.`return_status` = 1";

$result = $db->execute($query);

$db = null;

echo json_encode($result);