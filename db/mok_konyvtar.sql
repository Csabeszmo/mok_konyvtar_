-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Feb 25. 19:49
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `mok_konyvtar`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `faq`
--

CREATE TABLE `faq` (
  `id` int(11) NOT NULL,
  `kerdes` varchar(300) NOT NULL,
  `valasz` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `faq`
--

INSERT INTO `faq` (`id`, `kerdes`, `valasz`) VALUES
(1, 'Mi a MOK Könyvtár?', 'A MOK Könyvtár egy nyilvános könyvtár, amely széles könyvkínálattal, kutatási lehetőségekkel és közösségi programokkal várja az olvasókat.'),
(2, 'Hol található a MOK Könyvtár?', 'A pontos címünk: Makó, Kossuth u. 33, 6900. Könnyen megközelíthető tömegközlekedéssel és autóval is.'),
(3, 'Hogyan lehet beiratkozni a MOK Könyvtárba?', 'A könyvtárban a pultos kollégák segítségével vagy a weboldalon lehet regisztrálni.'),
(4, 'Milyen szolgáltatásokat nyújt a MOK Könyvtár?', 'Kölcsönzés akár otthonról, helyben olvasás, internet-hozzáférés, nyomtatás, kutatási segítség, rendezvények és könyvklubok.'),
(5, 'Van-e online katalógusa a MOK Könyvtárnak?', 'Igen, online kereshető adatbázisunkban könnyedén megtalálhatók a könyveink.'),
(6, 'Mennyi időre lehet könyvet kölcsönözni a MOK Könyvtárból?', 'Általában 2-4 hétre, de a pontos kölcsönzési idő a könyvtár szabályzatától függ.'),
(7, 'Lehet-e hosszabbítani a kikölcsönzött könyveket?', 'Igen, ha nincs rá előjegyzés, akkor online, telefonon vagy személyesen lehet hosszabbítani.'),
(8, 'Mit tegyek, ha elveszítettem egy könyvet?', 'Jelezni kell a könyvtárnak, és vagy pótolni kell a könyvet, vagy megtéríteni az árát.'),
(9, 'Van-e ingyenes Wi-Fi a könyvtárban?', 'Igen, a könyvtár területén ingyenes Wi-Fi áll a látogatók rendelkezésére.'),
(10, ' Milyen eseményeket szervez a MOK Könyvtár?', 'Rendszeresen tartunk könyvbemutatókat, író-olvasó találkozókat, gyermekfoglalkozásokat és tanfolyamokat.'),
(11, 'Hogyan lehet előjegyezni egy könyvet?', 'Online katalógusunkban, személyesen vagy telefonon lehet előjegyzést kérni a kölcsönzés alatt lévő könyvekre.');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
