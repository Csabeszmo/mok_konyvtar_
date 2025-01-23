<?php

declare(strict_types=1);

//Környezet meghívása
require_once('./environment.php');

// MySQL szerverhez való kapcsolódás
$db = new Database();

// SQL parancs beállítása
$query = "SELECT `users`.`first_name`,`users`.`last_name`,
                 `books`.`title`,`rating`,`reviews`.`review_text`, 
                 `reviews`.`review_date` 
          FROM `reviews` 
          INNER JOIN `users` 
          ON `reviews`.`user_id` = `users`.`user_id` 
          INNER JOIN `books` 
          ON `reviews`.`book_id` = `books`.`book_id` 
          WHERE `reviews`.`book_id` = ':review_id'";

// SQL parancs beállítása
$result = $db->execute($query);

// Kapcsolat megszakítása
$db = null;

// Válasz megadása
Util::setResponse($result);