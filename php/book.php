<?php

declare(strict_types=1);

require_once('./environment.php');

$bookId = $_GET['book_id'] ?? null;

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

$db = new Database();

$result = $db->execute($query, ['book_id' => $bookId]);

$db = null;

echo json_encode($result);