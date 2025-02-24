<?php

require_once('../../common/php/environment.php');

$db = new Database();

$query = "SELECT `first_name`, 
                 `middle_name`, 
                 `last_name`, 
                 `registration_date`, 
                 `phone`, 
                 `city`, 
                 `postalcode`, 
                 `address`, 
                 `email`, 
                 `password`, 
                 `is_active` 
            FROM `users` ";

$result = $db->execute($query);

$db = null;

Util::setResponse($result);