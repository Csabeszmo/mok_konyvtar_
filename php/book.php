<?php

declare(strict_types=1);

// Környezet meghívása
require_once('./environment.php');

// Az URL-ből érkezett `book_id` paraméter lekérdezése
$bookId = $_GET['book_id'] ?? null;

// SQL parancs, ahol a book_id alapján szűrjük az adatokat
$query = "SELECT `books`.`title`, 
                 `authors`.`first_name`,
                 `authors`.`last_name`,
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

// Adatbázis kapcsolat létrehozása
$db = new Database();

// Az adatbázis lekérdezés végrehajtása
$result = $db->execute($query, ['book_id' => $bookId]);

// Kapcsolat lezárása
$db = null;

// Az eredmény visszaküldése JSON formátumban
echo json_encode($result);