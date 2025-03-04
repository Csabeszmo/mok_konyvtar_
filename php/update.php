<?php

require_once('../../common/php/environment.php');

$args = Util::getArgs();

$db = new Database(); 

$query = "UPDATE `users` SET   
                 `last_name`= :last_name,
                 `first_name`= :first_name, 
                 `middle_name`= :middle_name, 
                 `phone`= :phone, 
                 `city`= :city, 
                 `postalcode`= :postalcode, 
                 `address`= :address 
           WHERE `user_id` = :user_id
           LIMIT 1";

$result = $db->execute($query, $args);

$db = null;

Util::setResponse($result);