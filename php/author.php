<?php

declare(strict_types=1);

//Környezet meghívása
require_once('./environment.php');

// MySQL szerverhez való kapcsolódás
$db = new Database();

// SQL parancs beállítása
$query= "SELECT `first_name`,
                `last_name`, 
                `biography`, 
                `author_image_url`,
                `birth_date`, `death_date` 
          FROM  `authors` 
          ORDER BY `first_name`";

// SQL parancs beállítása
$result = $db->execute($query);

// Kapcsolat megszakítása
$db = null;

// Válasz megadása
Util::setResponse($result);