<?php

declare(strict_types=1);

require_once("../../common/php/environment.php");

$args = Util::setArgs();

$db = new Database();

$query= "INSERT INTO `reviews` 
                    (`user_id`, 
                     `book_id`, 
                     `rating`) 
             VALUES (?,?,?)";

$result = $db->execute($query, array_values($args));

$db = null;

Util::setResponse($result);