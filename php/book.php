<?php

declare(strict_types=1);

//Környezet meghívása
require_once('./environment.php');

// MySQL szerverhez való kapcsolódás
$db = new Database();

// SQL parancs beállítása
$query= "SELECT `books`.`title`, 
                `authors`.`first_name`,
                `authors`.`last_name` ,
                `books`.`translator`,
                `books`.`publisher`,
                `books`.`series`,
                `books`.`pages`,
                `books`.`publication_year`,
                `books`.`binding_type`,
                `books`.`isbn`,
                `books`.`description`,
                `books`.`detailed_description`,
                `books`.`cover_image_url`,
                `categories`.`categories_name` 
          FROM `books`
          INNER JOIN `authors`
          ON `books`.`author_id` = `authors`.`author_id` 
          INNER JOIN `categories` 
          ON `books`.`categories_id` = `categories`.`categories_id`
          WHERE `books`.`book_id` = :book_id";

// SQL parancs beállítása
$result = $db->execute($query);

// Kapcsolat megszakítása
$db = null;

// Válasz megadása
Util::setResponse($result);