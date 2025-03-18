<?php

require_once('../../common/php/environment.php');

$args = Util::getArgs();

if (empty($args['user_id'])) {
    Util::setResponse(['error' => 'User ID missing.'], 400);
    exit();
}

$db = new Database();

$query = "DELETE FROM `users` WHERE `user_id` = :user_id";

$result = $db->execute($query, $args);

$db = null;

if ($result) {
    Util::setResponse(['success' => true]);
} else {
    Util::setResponse(['success' => false, 'error' => 'Törlés sikertelen.'], 500);
}