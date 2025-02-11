<?php

require_once("../../common/php/environment.php");

$db = new Database;

$query= "SELECT `id`, 
                `name`, 
                `date`, 
                `description`, 
                `img` 
                FROM `events`";

$result = $db->execute($query);

$db = null;

Util::setResponse($result);