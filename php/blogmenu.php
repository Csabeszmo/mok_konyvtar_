<?php

require_once("../../common/php/environment.php");

$db = new Database();

$query= "SELECT `id`,
                `name`, 
                `short_description`, 
                `image_url`, 
                `img_top`, 
                `conclusion`,
                `conclusion_description`
           FROM `blog`
       ORDER BY `id`;";

$result['blog'] = $db->execute($query);

$query= "SELECT `id`,
                `blog_id`,
                `heading`, 
                `description`, 
                `img`, 
                `img_align_end` 
           FROM `blog_descriptions`
       ORDER BY `blog_id`, `id`;";

$result['blog_descriptions'] = $db->execute($query);

$db = null;

Util::setResponse($result);