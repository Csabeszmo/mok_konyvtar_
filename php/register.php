<?php

declare(strict_types=1);

require_once('../../common/php/environment.php');

$args = Util::getArgs();

$db = new Database();

/*
$query= "SELECT `id` FROM `users` WHERE `email` = ?";

$result = $db->execute($query, [$args['email']]);

if ($result) {
    Util::setError('A felhasználó ezen az email címen már létezik!');
}

*/

$query= "INSERT INTO `users` 
                    (`last_name`,
                     `first_name`, 
                     `email`,
                     `password`, 
                     `is_active`) 
             VALUES (:first_name, :last_name, :email, :password, 1)";

$result = $db->execute($query, array_values($args));

$db = null;

Util::setResponse($result);