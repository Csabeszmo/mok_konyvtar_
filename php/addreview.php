<?php
declare(strict_types=1);


//Környezet meghívása
require_once('./environment.php');

// Argumentum megszerzése
$args = Util::getArgs();

// MySQL szerverhez való kapcsolódás
$db = new Database();

// SQL parancs beállítása
$query= "INSERT INTO `reviews` 
                    (`user_id`,
                     `book_id`, 
                     `rating`,
                     `review_text`,
                     `review_date`) 
          VALUES (:user_id,
                  :book_id,
                  :rating,
                  :review_text,
                  :review_date)";

// SQL parancs beállítása
$result = $db->execute($query, $args);

// Kapcsolat megszakítása
$db = null;

// Válasz megadása
Util::setResponse($result);