<?php

require_once('../../common/php/environment.php');

$args = Util::getArgs();

$db = new Database();

$query = "";

$result = $db->execute();

$db = null;

Util::setResponse($result);