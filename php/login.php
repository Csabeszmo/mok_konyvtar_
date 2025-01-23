<?php

declare(strict_types=1);

// Környezet meghívása
require_once("./environment.php");

// Argumentum megszerzése
$args = Util::getArgs();
//unset($args['showPassword']);

// MySQL szerverhez való kapcsolódás
$db = new Database();

// SQL parancs beállítása
$query =  "SELECT `user_id`, 
									`first_name`, 
									`middle_name`, 
									`last_name`
						 FROM `users`  
		     		WHERE `email` = :email AND 
									`password` = :password AND 
									`is_active` = 1
		     		LIMIT 1;";

// SQL parancs végrehajtása
$result = $db->execute($query, $args);

// Kapcsolat lekapcsolása
$db = null;

if (is_null($result)) {
	Util::setError('Nincs ilyen felhasználó!');
}

$result = $result[0];

// Válasz megadása
Util::setResponse($result);