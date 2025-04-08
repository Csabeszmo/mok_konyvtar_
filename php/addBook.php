<?php

require_once('../../common/php/environment.php');

$args = Util::getArgs();

$db = new Database();

$query = "INSERT INTO `myrents`
                     (`user_id`, 
                      `book_id`,
                      `db`,
                      `return_date`) 
             VALUES  (:user_id, :book_id, :db, :return_date)";

$result = $db->execute($query, [$args['user_id'], $args['book_id'], $args['db'], $args['return_date']]);

if (!$result['lastInsertId']){
      Util::setError("Nem sikerült a könyv kosárba helyezése!");
}
$db = null;

Util::setResponse("A könyv kosárba helyezése sikerült!");