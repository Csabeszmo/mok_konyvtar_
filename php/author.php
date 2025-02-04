<?php

declare(strict_types=1);

require_once('./environment.php');

$db = new Database();

$query= "SELECT `first_name`,
                `last_name`, 
                `biography`, 
                `author_image_url`,
                `birth_date`, 
                `death_date` 
          FROM  `authors` 
          ORDER BY `first_name`";

$result = $db->execute($query);

$db = null;

Util::setResponse($result);