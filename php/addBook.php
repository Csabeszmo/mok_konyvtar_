<?php

require_once('../../common/php/environment.php');

$args = Util::getArgs();

$db = new Database();

$query = "INSERT INTO `cart`
                     (`user_id`) 
              VALUES (?)";

$result = $db->execute($query, $args["user_id"]);
$cartId = $result['lastInsertId'];
if (!$cartId){
      Util::setError("Nem sikerült!");
}


$query = "INSERT INTO `cart_items_books`
                     (`cart_id`, 
                      `book_id`,
                      `db`) 
             VALUES  (?, ?, ?)";

$result = $db->execute($query, [$cartId, $args['book_id'], $args['db']]);

if (!$result['lastInsertId']){
      Util::setError("Nem sikerült!");
}
$db = null;

Util::setResponse("Sikerült!");