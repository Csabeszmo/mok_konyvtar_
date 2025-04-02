<?php

declare(strict_types=1);

require_once("../../common/php/environment.php");

$db = new Database();

$query = "SELECT `id`, 
                 `question`, 
                 `answer` 
            FROM `faq`";

$result = $db->execute($query);

$db = null;

Util::setResponse($result);