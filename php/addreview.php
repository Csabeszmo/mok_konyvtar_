<?php
declare(strict_types=1);

require_once('./environment.php');

$args = Util::getArgs();

$db = new Database();

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

$result = $db->execute($query, $args);

$db = null;

Util::setResponse($result);