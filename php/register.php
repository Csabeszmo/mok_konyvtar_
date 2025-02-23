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
             VALUES (?,?,?,?)";

$result = $db->execute($query, array($args));

$db = null;

Util::setResponse($result);