<?php

require_once("../../common/php/environment.php");

$args = Util::getArgs();

$db = new Database();

$query = "INSERT INTO `event_items`(`user_id`, 
                                    `event_id`) 
                            VALUES (:user_id, :event_id)";

$result = $db->execute($query, $args);

$db = null;

Util::setResponse($result);