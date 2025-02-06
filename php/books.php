<?php
declare(strict_types=1);

require_once("../../common/php/environment.php");

$query= "SELECT `books`.`book_id`,
                `books`.`title`, 
                `authors`.`first_name`,
                `authors`.`last_name`,
                `books`.`cover_image_url`
           FROM `books`
     INNER JOIN `authors` 
             ON `books`.`author_id` = `authors`.`author_id`";

$db = new Database();

$result = $db->execute($query);

$db = null;

Util::setResponse($result);