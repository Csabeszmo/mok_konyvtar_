<?php

require_once("../../common/php/environment.php");

$db = new Database;

$query= "SELECT `name`, 
                `short_description`, 
                `long_description`, 
                `image_url` 
           FROM `blog`";

$result = $db->execute($query);

$db = null;

Util::setResponse($result);