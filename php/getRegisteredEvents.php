<?php

require_once("../../common/php/environment.php");

$args = Util::getArgs();

$db = new Database();

// Lekérjük az összes regisztrált eseményt az event_items táblából
$query = "SELECT event_id 
          FROM event_items 
          WHERE user_id = :user_id";

$result = $db->execute($query, $args);

// Az execute visszaadja az adatokat tömbben, tehát nincs szükség külön PDO fetch-re.
Util::setResponse($result);
