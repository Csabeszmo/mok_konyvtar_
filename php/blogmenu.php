<?php

require_once("../../common/php/environment.php");

$db = new Database;

$query= "SELECT `name`, 
                `short_description`, 
                `image_url`, 
                `carousel`, 
                `heading1`, 
                `description1`, 
                `heading2`, 
                `description2`, 
                `heading3`, 
                `description3`, 
                `heading4`, 
                `description4`, 
                `heading5`, 
                `description5`, 
                `heading6`, 
                `description6`, 
                `heading7`, 
                `description7`,  
                `img3`, 
                `img6` 
           FROM `blog`";

$result = $db->execute($query);

$db = null;

Util::setResponse($result);