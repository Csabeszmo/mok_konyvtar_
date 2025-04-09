<?php

// Include environment
require_once("../../common/php/environment.php");

// Connect to MySQL server
$db = new Database();

// Set SQL command
$query= "SELECT `id`,
                `name`, 
                `short_description`, 
                `image_url`, 
                `img_top`, 
                `conclusion`,
                `conclusion_description`
           FROM `blog`
       ORDER BY `id`;";

// Execute SQL command
$result['blog'] = $db->execute($query);

// Set SQL command
$query= "SELECT `id`,
                `blog_id`,
                `heading`, 
                `description`, 
                `img`, 
                `img_align_end` 
           FROM `blog_descriptions`
       ORDER BY `blog_id`, `id`;";

// Execute SQL command
$result['blog_descriptions'] = $db->execute($query);

// Close connection
$db = null;

// Set response
Util::setResponse($result);