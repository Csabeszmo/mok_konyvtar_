<?php
declare(strict_types=1);

require_once("../../common/php/environment.php");

$args = Util::getArgs();

$db = new Database();

$query =  "SELECT `user_id`, 
				  `first_name`, 
				  `middle_name`, 
				  `last_name`,
				  `password`
		     FROM `users`  
		    WHERE `email` = ? AND    
		   		  `is_active` = 1 LIMIT 1;";

$result = $db->execute($query, array($args['email']));

$db = null;

if (is_null($result)) {
	Util::setError('Nincs ilyen felhasználó!');
}

$result = $result[0];

if ($result['password'] !== $args['password']) {
	Util::setError('Hibás jelszó!');
}

unset($result['password']);

Util::setResponse($result);