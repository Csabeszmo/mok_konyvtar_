<?php

require_once('../../common/php/environment.php');

$args = Util::getArgs();

$db = new Database();

$query = "INSERT INTO `cart`
                     (`user_id`) 
              VALUES (:user_id)";

$result['cart'] = $db->execute($query, $args);

$query = "INSERT INTO `cart_items_books`
                     (`cart_id`, 
                      `book_id`) 
             VALUES  (:cart_id, :book_id)";

$result['cart_items_books'] = $db->execute($query, $args);

$query = "UPDATE `cart_items_books` SET 
                 `db`=`db`+1
           WHERE `user_id` = :user_id;";

$result = $db->execute($query, $args);

$db = null;

Util::setResponse($result);