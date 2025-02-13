<?php

require_once("../../common/php/environment.php");

$db = new Database;

$query= "SELECT `blog`.`name`, 
                `blog`.`short_description`, 
                `blog`.`image_url`, 
                `blog`.`img_top`, 
                `blog`.`conclusion`, 
                `blog`.`conclusion_description`, 
                `blog_descriptions`.`heading`, 
                `blog_descriptions`.`description`, 
                `blog_descriptions`.`img`, 
                `blog_descriptions`.`img_align_end` 
           FROM `blog` 
     INNER JOIN `blog_descriptions` 
             ON `blog_descriptions`.`blog_id` = `blog`.`id`";

$result = $db->execute($query);

$db = null;

Util::setResponse($result);