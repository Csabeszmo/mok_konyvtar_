<?php

require_once('../../common/php/environment.php');

$args = Util::getArgs();

$db = new Database();

$query = "INSERT INTO `cart`
                     (`user_id`, 
                      `book_id`,
                      `return_status`) 
              VALUES (:user_id, :book_id, 1)";

$result = $db->execute($query, $args);

$db = null;

Util::setResponse($result);