<?php

declare(strict_types=1); // Szigorú típusellenőrzés bekapcsolása a PHP fájlban

// Az environment.php fájl betöltése
require_once("./environment.php");

// Az SQL lekérdezés, amely a könyvek és azok szerzőinek adatait, 
// illetve a könyvek borítójának képét kérdezi le az adatbázisból
$query= "SELECT `books`.title, 
                `authors`.`first_name`,
                `authors`.`last_name`,
                `books`.`cover_image_url`
         FROM `books`
         INNER JOIN `authors` 
         ON `books`.`author_id` = `authors`.`author_id`";

// Adatbázis objektum létrehozása
$db = new Database();

// A lekérdezés végrehajtása, az eredményeket a $result változóban tároljuk
$result = $db->execute($query);

// Az adatbázis kapcsolat lezárása, hogy felszabadítsuk az erőforrásokat
$db = null;

echo json_encode($result);