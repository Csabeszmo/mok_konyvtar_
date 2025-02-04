<?php

declare(strict_types=1);

require_once("./environment.php");

$args = Util::getArgs();

$db = new Database();

$query =  "SELECT `user_id`, 
				  `first_name`, 
				  `middle_name`, 
				  `last_name`
		   FROM   `users`  
		   WHERE `email` = :email 
		   AND   `password` = :password 
		   AND   `is_active` = 1
		   LIMIT 1;";

$result = $db->execute($query, $args);

$db = null;

if (is_null($result)) {
	Util::setError('Nincs ilyen felhasználó!');
}

$result = $result[0];

Util::setResponse($result);