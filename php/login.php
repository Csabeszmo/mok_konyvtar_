<?php

declare(strict_types=1);

// Környezet meghívása
require_once("./environment.php");

// Argumentum megszerzése
$args = Util::getArgs();

// MySQL szerverhez való kapcsolódás
$db = new Database();

// SQL parancs beállítása
$query = "SELECT `email`,`password` 
		  FROM `users` 
		  WHERE `email` = :email
		  AND `password` = :password 
          AND `is_active` = 1
		  LIMIT 1";

// SQL parancs végrehajtása
$result = $db->execute($query, $args);

// Kapcsolat lekapcsolása
$db = null;

// Válasz megadása
Util::setResponse($result);