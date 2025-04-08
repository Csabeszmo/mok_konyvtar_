<?php

declare(strict_types=1);

require_once('../../common/php/environment.php');

$args = Util::getArgs();

$db = new Database();

$query= "SELECT `user_id` 
           FROM `users` 
          WHERE `email` = ?
          LIMIT 1;";

$result = $db->execute($query, $args['email']);

if (!is_null($result)) {
    $db = null;
    Util::setError('A felhasználó ezen az email címen már létezik!');
}

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
$result = $db->execute($query, array_values($args));

$db = null;

if(!$result['affectedRows']){
    Util::setError("Nem működik a regisztráció!");
}

Util::setResponse($result);