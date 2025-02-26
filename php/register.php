<?php

declare(strict_types=1);

require_once('../../common/php/environment.php');

$args = Util::getArgs();

$db = new Database();

$query= "INSERT INTO `users` 
                    (`first_name`,
                     `last_name`, 
                     `email`,
                     `password`) 
             VALUES (:first_name, :last_name, :email, :password)";

$result = $db->execute($query, array_values($args));

$db = null;

Util::setResponse($result);