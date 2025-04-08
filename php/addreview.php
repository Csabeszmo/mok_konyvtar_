<?php

declare(strict_types=1);

require_once('../../common/php/environment.php');

$args = Util::getArgs();

$db = new Database();

$query= "SELECT `user_id`, `book_id` 
           FROM `reviews` 
          WHERE `user_id` = :user_id 
            AND `book_id` = :book_id
          LIMIT 1";

$result = $db->execute($query, ['user_id' => $args['user_id'], 'book_id' => $args['book_id']]);

if (!is_null($result)) {
    $db = null;
    Util::setError('A felhasználó már értékelte a könyvet!');
}

$query= "INSERT INTO `reviews` 
                    (`user_id`,
                     `book_id`, 
                     `rating`) 
         VALUES (?,?,?)";
$result = $db->execute($query, array_values($args));

$db = null;

if(!$result['affectedRows']){
    Util::setError("Nem működik az értékelés");
}

Util::setResponse($result);