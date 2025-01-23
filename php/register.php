<?php

declare(strict_types=1);

//Környezet meghívása
require_once('./environment.php');

// Argumentum megszerzése
$args = Util::getArgs();

// MySQL szerverhez való kapcsolódás
$db = new Database();

// SQL parancs beállítása
$query = "INSERT INTO `users` (`first_name`, `middle_name`, `last_name`, 
                      `registration_date`, `phone`, `city`, `postalcode`, `address`, 
                      `email`, `password`, `is_active`) 
          VALUES (':first_name',':middle_name',':last_name',':registration',':phone',
                  ':city',':postalcode',':address',':email',':password',':valid')";

// SQL parancs végrehajtása
$result = $db->execute($query, $args);

// Kapcsolat megszakítása
$db = null;

// Válasz megadása
Util::setResponse($result);