<?php

declare(strict_types=1);

//Környezet meghívása
require_once('./environment.php');

// Argumentum megszerzése
$args = Util::getArgs();

// MySQL szerverhez való kapcsolódás
$db = new Database();

// SQL parancs beállítása
$query= "INSERT INTO `users` 
                    (`first_name`,
                     `last_name`, 
                     `email`,
                     `password`) 
         VALUES (:first_name,
                 :last_name,
                 :email,
                 BINARY :password)";

// SQL parancs végrehajtása
$result = $db->execute($query, $args);

// Kapcsolat megszakítása
$db = null;

// Válasz megadása
Util::setResponse($result);