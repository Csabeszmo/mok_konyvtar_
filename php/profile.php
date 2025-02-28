<?php

require_once('../../common/php/environment.php');

$args = Util::getArgs();

$db = new Database();

$query = "SELECT `phone`, 
                 `city`, 
                 `postalcode`, 
                 `address`
            FROM `users` 
           WHERE `user_id` = :user_id
           LIMIT 1;";

$result = $db->execute($query, $args);

$db = null;

if (!is_null($result))
  $result = $result[0];

Util::setResponse($result);