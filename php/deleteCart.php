<?php

require_once('../../common/php/environment.php');

$args = Util::getArgs();

$db = new Database();

$query = "DELETE FROM `cart_items_books` 
                WHERE `user_id` = :user_id;";

$result = $db->execute($query, $args);

$db = null;

Util::setResponse($result);