<?php

require_once('../../common/php/environment.php');

$args = Util::getArgs();

$db = new Database();

$query = "INSERT INTO `cart_items_books`
                     (`user_id`, 
                      `book_id`,
                      `db`,
                      `return_date`) 
             VALUES  (:user_id, :book_id, :db, :return_date)";

$result = $db->execute($query, [$args['user_id'], $args['book_id'], $args['db'], $args['return_date']]);

/*
$today = strtotime(getdate());
$final = date("Y-m-d", strtotime("+1 month", $today));

$query = "INSERT INTO `cart_items_books`
                     (`return_date`) 
             VALUES  ($final)";

$result = $db->execute($query, $args['return_date']);
*/

if (!$result['lastInsertId']){
      Util::setError("Nem sikerült a könyv kosárba helyezése!");
}
$db = null;

Util::setResponse("A könyv kosárba helyezése sikerült!");