<?php

require_once('../../common/php/environment.php');

$args = Util::getArgs();

if (empty($args['user_id'])) {
    Util::setError('User ID missing.');
    exit();
}

$db = new Database();

$query = "DELETE FROM `users` WHERE `user_id` = :user_id";

$result = $db->execute($query, $args);

$db = null;

if ($result) {
    Util::setResponse('Törlés sikeres.');
} else {
    Util::setResponse('Törlés sikertelen.');
}