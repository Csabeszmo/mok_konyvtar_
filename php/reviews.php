<?php

declare(strict_types=1);

require_once('./environment.php');

$db = new Database();

$query= "SELECT `users`.`first_name`,
                `users`.`last_name`,
                `books`.`title`,
                `rating`,
                `reviews`.`review_text`, 
                `reviews`.`review_date` 
           FROM `reviews` 
     INNER JOIN `users` 
             ON `reviews`.`user_id` = `users`.`user_id` 
     INNER JOIN `books` 
             ON `reviews`.`book_id` = `books`.`book_id` 
          WHERE `reviews`.`book_id` = ':review_id'";

$result = $db->execute($query);

$db = null;

Util::setResponse($result);