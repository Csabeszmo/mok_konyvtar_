-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Feb 28. 12:10
-- Kiszolgáló verziója: 10.4.28-MariaDB
-- PHP verzió: 8.1.17

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
-- Tábla szerkezet ehhez a táblához `authors`
--

CREATE TABLE `authors` (
  `author_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `biography` text NOT NULL,
  `author_image_url` varchar(100) NOT NULL,
  `birth_date` date NOT NULL,
  `death_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `authors`
--

INSERT INTO `authors` (`author_id`, `first_name`, `last_name`, `biography`, `author_image_url`, `birth_date`, `death_date`) VALUES
(1, 'Joanne Kathleen', 'Rowling ', 'J.K. Rowling (teljes nevén Joanne Rowling) brit írónő, a Harry Potter-sorozat megalkotója, 1965-ben született az angliai Yate városában. Már fiatalon érdeklődött az írás iránt, és történeteket talált ki. Az egyetemet az Exeteri Egyetemen végezte, ahol francia nyelvet és irodalmat tanult.\r\n\r\nA Harry Potter történetének alapötlete 1990-ben született meg, miközben vonaton utazott. Az írás folyamata azonban hosszú ideig tartott, és közben nehéz időszakokat élt át: édesanyja halála, válása és anyagi problémái ellenére kitartott, és befejezte az első regényt.\r\n\r\nAz első kötet, Harry Potter és a bölcsek köve, 1997-ben jelent meg, és azonnal hatalmas sikert aratott. A sorozat további kötetei globális jelenséggé váltak, és Rowlingot a világ egyik legismertebb és leggazdagabb írójává tették.\r\n\r\nRowling filantróp, számos jótékonysági projektet támogat, például a Lumos Alapítványt, amely a gyermekek jólétét segíti világszerte. Írói karrierje a Harry Potter után is folytatódott: más műfajokban is alkotott, például a Robert Galbraith álnéven írt krimisorozatával.', 'rowling.jpg', '1965-07-31', NULL),
(2, 'John Ronald Reuel', 'Tolkien', 'J.R.R. Tolkien (teljes nevén John Ronald Reuel Tolkien) angol író, filológus és egyetemi tanár, a fantasy irodalom egyik legnagyobb alakja. Legismertebb művei a A Hobbit (1937) és A Gyűrűk Ura (1954–1955) trilógia, amelyek Középfölde mesés világában játszódnak, és alapvetően meghatározták a modern fantasy műfaját. Tolkien az Oxfordi Egyetemen dolgozott, ahol angol nyelvet és irodalmat tanított, valamint jelentős munkát végzett a nyelvek és kultúrák terén, különösen az óangol és germán nyelvekben.\r\n\r\nMunkássága és életműve a nyelvek iránti szenvedélyéből fakadt, és ő hozta létre a teljesen új nyelveket, mint a quenya és sindarin, amelyeket a híres elfek beszélnek A Gyűrűk Ura világában. Tolkien művei világszerte elismerést nyertek, és hatalmas hatással voltak az irodalomra, valamint a popkultúrára is.', 'tolkien.jpg', '1892-01-03', '1972-09-02'),
(3, 'Frances', 'Mayes', 'Frances Mayes 1940-ben született az amerikai Georgia államban, és az irodalom iránti szenvedélye már fiatal korában megmutatkozott. Gyermekkora a déliek életének gazdag kultúrájával és hagyományaival telt, ami később is inspirálta írásait. Felsőfokú tanulmányait a Randolph-Macon College-ban végezte, majd az University of Florida-n szerzett diplomát angol irodalomból. Karrierje során kreatív írást tanított a San Francisco State University-n, ahol több évtizedig oktatott, miközben költőként, irodalmi kritikusként és szerkesztőként is dolgozott.\r\nFrances Mayes az 1990-es években vált világszerte ismertté, amikor megjelentette a \"Napsütötte Toszkána\" (Under the Tuscan Sun) című memoárját, amelyben egy toszkán villába való beköltözéséről, annak felújításáról és az olasz vidéki élet szépségeiről számolt be.\r\nA Napsütötte Toszkána sikere után Frances több további könyvet írt Toszkánáról és utazásairól, köztük a \"Bella Tuscany: The Sweet Life in Italy\" (Bella Toszkána: Az édes élet Itáliában) és az \"Every Day in Tuscany: Seasons of an Italian Life\" (Minden nap Toszkánában: Egy olasz élet évszakai) című köteteket.\r\nMagánéletében Frances Mayes megosztja idejét az Egyesült Államok és Toszkána között. Olaszországban a Bramasole nevű villában él, amely a könyveiben is központi szerepet játszik. Férjével, Ed Kleinnal együtt gyakran foglalkoznak borászkodással és olívaolaj-készítéssel, miközben továbbra is az írásnak szenteli életét.', 'mayes.jpg', '1940-03-23', NULL),
(4, 'Cecelia', 'Ahern', 'Cecelia Ahern írónő 1981-ben született Dublinban, Írországban. Az írónő legismertebb művei a romantikus regények, különösen a P.S. I Love You (Ui.: Szeretlek!) című debütáló könyve, amely 2004-ben jelent meg, és hatalmas nemzetközi sikert aratott. A könyvet később filmadaptáció is követte, Hilary Swank és Gerard Butler főszereplésével.\r\nAhern fiatalon kezdte pályafutását, és már 21 évesen megjelent első regénye. Azóta számos bestsellert írt, amelyek között olyan kötetek találhatók, mint a Where Rainbows End (Ahol a szivárvány véget ér), The Book of Tomorrow, és The Time of My Life. A műveit több mint 40 nyelvre fordították le, és több könyvét is filmre vitték.\r\nCecelia Ahern a műveiben gyakran ötvözi a romantikát, a drámát és a varázslatos realizmust. Emellett tévésorozatok és filmek írásában is részt vett. Az írónő írta a Samantha Who? című tévésorozatot, ami szintén nagy népszerűségnek örvendett.\r\nMa is Dublinban él, és továbbra is aktívan ír, valamint kreatív projekteken dolgozik. Munkássága az érzelmek mélyreható ábrázolásáról, valamint a remény és a második esélyek témájáról ismert.', 'ahern.jpg', '1981-09-30', NULL),
(5, 'Herman', 'Melville', 'Herman Melville amerikai író, költő és esszéista, az amerikai irodalom egyik kiemelkedő alakja. Legismertebb műve, a Moby Dick (1851), a világirodalom egyik klasszikusa, amely azonban életében nem aratott sikert.\r\n\r\nMelville New Yorkban született egy kereskedőcsaládban, és apja korai halála után fiatalon kellett munkát vállalnia. Élete nagy részében tengeri utazások inspirálták írásait; tengerészként bejárta a világot, és tapasztalatai jelentős hatással voltak korai regényeire, mint a Typee és az Omoo.\r\n\r\nMelville első néhány könyve sikeres volt, de igazi áttörést a Moby Dick (1851) hozott, amelyet először nem értékeltek kellőképpen. A regényben a főszereplő, Ahab kapitány megszállott vadászatát követhetjük egy hatalmas fehér bálnára, Moby Dickre, miközben a könyv számos filozófiai, vallási és társadalmi kérdést érint. A Moby Dick rendkívül komplex mű, amely gazdag szimbolikával, bibliai utalásokkal és tudományos leírásokkal van tele, így az olvasók és kritikusok számára is kihívást jelentett.\r\n\r\nA Moby Dick után Melville számos más művet is írt, például a Pierre (1852) és a Israel Potter (1855), de ezek már nem arattak akkora sikert, és a kritikusok is kevésbé kedvelték őket. Az 1850-es évek közepétől kezdve Melville visszahúzódott a közélettől, és inkább költészettel foglalkozott, de ekkor már nem volt nagy közönsége.\r\n\r\nAz 1850-es évek után Melville költészetre váltott, de művei nem hoztak széles körű elismerést életében. Halála után fedezték fel újra munkásságát, és mára az amerikai romantika egyik legfontosabb képviselőjeként tartják számon.', 'melville.jpg', '1819-08-01', '1891-09-28'),
(6, 'Agatha', 'Christie', 'Agatha Christie brit írónő, akit a krimi irodalom koronázatlan királynőjeként tartanak számon. Leginkább Hercule Poirot és Miss Marple nyomozók történeteiről ismert, amelyek világszerte számos olvasó kedvenceivé váltak.\r\n\r\nAgatha Christie Torquay-ban, Angliában született, és a családja középosztálybeli hátteret biztosított neki. Gyermekkora során magántanuló volt, és szülei nagy hangsúlyt fektettek az irodalmi érdeklődésére. Az írás iránti vonzalmát fiatal korában fedezte fel, de kezdetben nem volt könnyű élete, mivel első két regénye, The Mysterious Affair at Styles (1920) és The Secret Adversary (1922) nem arattak nagy sikert.\r\n\r\nAgatha Christie 1920-ban robbant be a köztudatba az első Hercule Poirot-regényével, A titokzatos eseménnyel, amely sikeres fogadtatásra talált, és elindította Poirot karakterének legendás pályafutását. Az első regényben a belga detektívet, Hercule Poirot-t, aki a későbbiekben Christie egyik legismertebb nyomozója lett, egy gyilkosság megoldásában segíti. Poirot és más híres karakterei, például Miss Marple, aki egy idős, brit vidéki hölgy, aki rendkívüli megfigyelőképességgel oldja meg a bűnügyeket, sokszor központi szereplői voltak az írónő műveinek.\r\n\r\nA Christie-regények egyik legjellemzőbb vonása a bonyolult cselekmények, az egyes szereplők motivációinak aprólékos elemzése és az olvasó által nehezen előrejelezhető, ám mégis logikus befejezések. Christie hatalmas népszerűségre tett szert olyan regényekkel, mint a Gyilkosság az Orient expresszen (1934), a Tíz kicsi néger (ma És már senki sem volt, 1939), és az A Nílus gyöngye (1937). Az utóbbi két mű különösen híressé vált, és az írónőt világszerte elismertté tette.\r\n\r\nMűvei különlegesek voltak a váratlan fordulatokkal és a bonyolult, ám logikus megoldásokkal. Christie munkásságát a rejtélyek és a pszichológiai elemzések iránti mély érdeklődés jellemezte. Élete során több mint 2 milliárd példányban kelt el, és könyvei több tucatnyi film- és televíziós adaptációt ihlettek.\r\n\r\nAgatha Christie életének utolsó évtizedeiben is aktívan írt, de már egyre inkább háttérbe szorult a közéletből. Mégis, művei mindig is a közönség érdeklődésének középpontjában maradtak, és a legnagyobb sikerüket halála után érték el. 1976-ban, 85 éves korában hunyt el.', 'christie.jpg', '1890-09-15', '1976-01-12'),
(7, 'Ferenc', 'Molnár', 'Molnár Ferenc magyar író, dramaturg és újságíró, aki a 20. századi magyar irodalom egyik meghatározó alakja. Legismertebb műve a Pál utcai fiúk, amely a magyar irodalom egyik klasszikusa, és a világ számos nyelvére lefordították.\r\n\r\nMolnár 1878-ban született Budapesten. Eredetileg jogi pályára készült, de hamarosan a színház és az irodalom világában találta meg igazi hivatását. Pályafutása során számos színdarabot írt, és sikeres újságíró is volt. Művei jellemzően társadalmi és emberi problémákat boncolgattak, gyakran a humor és az irónia eszközeivel.\r\n\r\nA Pál utcai fiúk 1906-ban jelent meg először, és azóta is a magyar irodalom egyik legismertebb ifjúsági regénye. Az író ezen kívül számos drámát is alkotott, amelyek közül a Liliom (1909) talán a legismertebb, amelyet később Broadway-n is bemutattak.\r\n\r\nMolnár Ferenc a két világháború közötti évtizedekben nagy népszerűségnek örvendett, de a második világháború után, amikor Magyarországon politikai és társadalmi változások zajlottak, ő is külföldre emigrált. Az Egyesült Államokban élt, és ott is dolgozott, de az otthoni irodalmi életbe már nem tudott teljes mértékben visszatérni.\r\n\r\nMolnár Ferenc 1952. április 1-jén hunyt el. Művei, különösen a Pál utcai fiúk, továbbra is meghatározó részét képezik a magyar irodalmi örökségnek.', 'molnar.jpg', '1878-01-12', '1952-04-01'),
(8, 'George', 'Orwell', 'George Orwell (eredeti nevén Eric Arthur Blair) 1903-ban született Indiában. Brit író, újságíró és esszéista, aki legismertebb műveivel, a 1984-tel és az Állatfarm-mal vált világhírűvé. Munkásságában az egyéni szabadság, a társadalmi igazságtalanságok és a totalitárius rendszerek kritikája voltak a központi témák.\r\n\r\nOrwell középosztálybeli családból származott, és Oxfordban tanult. Fiatal korában Indiában szolgált a brit birodalmi rendőrségnél, majd hazatérve különböző munkák mellett kezdett írni. Életét a politikai elkötelezettség jellemezte, és sok művében az ideológiai küzdelmeket és a hatalommal való visszaélést vizsgálta. A spanyol polgárháború alatt antifasiszta milíciákban harcolt, tapasztalatai mély hatással voltak későbbi írásaira.\r\n\r\nOrwell pályafutását főként újságíróként kezdte, és jelentős cikkeket írt a politikai és társadalmi kérdésekről. Azonban az írás mellett Orwell egyre inkább elkötelezte magát a politikai szatíra és a disztópikus regények iránt. Első nagy sikerét 1933-ban érte el a Down and Out in Paris and London című könyvével, amely saját szegénységi tapasztalatait dokumentálta. Ebben az időszakban Orwell munkái egyre inkább a szociális kérdésekre és a hatalom működésére összpontosítottak.\r\nOrwell élete végére súlyos betegségekkel küzdött. 1947-ben tüdőbetegséget diagnosztizáltak nála, és állapota fokozatosan romlott. Ennek ellenére továbbra is aktívan írt és dolgozott. 1949-ben, az 1984 megjelenése után röviddel, Orwell súlyos állapotba került, és 1950 januárjában elhunyt.', 'orwell.jpg', '1903-06-25', '1950-01-25'),
(9, 'Géza', 'Gárdonyi', 'Gárdonyi Géza 1863-ban született a Fejér vármegyei Agárdpusztán, egy szegény család gyermekeként. Magyar író, költő és újságíró, a 19–20. századi magyar irodalom egyik kiemelkedő alakja. Eredeti neve Ziegler Géza volt, de később a Gárdonyi írói nevet választotta szülőhelye, Gárdony tiszteletére.\r\n\r\nÍrói pályája kezdetén főként újságíróként és tanítóként dolgozott, majd az irodalom felé fordult. Művei között megtalálhatók versek, novellák, színdarabok, de legismertebbé regényei tették. Legnagyobb sikerét az Egri csillagok című történelmi regénnyel érte el, amely ma is a magyar irodalom egyik alapműve.\r\n\r\n1897-ben Gárdonyi Egerbe költözött, ahol visszavonultan élt haláláig. Csendes életmódja ellenére rendkívül termékeny író volt, aki mélyen belemerült a történelmi kutatásokba és az alkotói munkába. Egri otthonát „remetelaknak” nevezte, ahol elmélyült spirituális és szellemi tanulmányokat végzett. Az otthonában ma emlékmúzeum működik.\r\n\r\nÉletében visszahúzódó és csendes emberként ismerték, aki nagy figyelmet fordított az alkotásra és az önképzésre. Élete utolsó éveit Egerben töltötte, ahol ma emlékház őrzi emlékét. Legfontosabb témái a történelem, az emberi lélek és a hazaszeretet voltak, amelyeket műveiben mélyen és érzelmesen ábrázolt.\r\n\r\n1922. október 30-án hunyt el Egerben. A helyi temetőben nyugszik, sírkövére saját kívánságára az alábbi felirat került: „Csak a teste.”, utalva halhatatlan szellemi örökségére.', 'gardonyi.jpg', '1863-08-03', '1922-10-30'),
(10, 'Stephen', 'King', 'Stephen King 1947-ben született Portlandban, Maine államban. Az egyik legismertebb és legtermékenyebb kortárs amerikai író, aki elsősorban horror, thriller, fantasy és sci-fi műfajban alkotott regényeiről híres. Írói karrierje több mint öt évtizedet ölel fel, és több mint 60 regénye, valamint számos novelláskötete jelent meg, amelyeket világszerte több mint 350 millió példányban adtak el.\r\n\r\nKing gyermekkora nem volt könnyű: apja elhagyta a családot, amikor ő kétéves volt, és édesanyja egyedül nevelte fel. Az íráshoz már fiatalon vonzódott, és első rövid történeteit tinédzserként kezdte publikálni. Az áttörést az 1974-ben megjelent Carrie című regény hozta meg számára, amely azonnal bestseller lett, és több filmadaptáció is készült belőle.\r\n\r\nKarrierje során olyan világhírű műveket írt, mint A ragyogás, Az, A remény rabjai, Tortúra és A setét torony sorozat. Írásait gyakran jellemzik erős karakterábrázolások, hétköznapi helyzetekből fakadó borzalmak és mély emberi érzelmek.\r\n\r\nKing számos díjat nyert, többek között Bram Stoker-díjakat, World Fantasy-díjat és National Book Award életműdíjat is kapott. Bár főleg a horror műfajához kötődik, munkái gyakran túllépnek ezen, és az emberi természet, a trauma és a társadalmi kérdések mélyebb vizsgálatával foglalkoznak.\r\n\r\nFeleségével, Tabitha Kinggel él, aki szintén író. Három gyermekük van, közülük két fia, Owen és Joe Hill, szintén íróként dolgozik. Stephen King továbbra is aktív az írásban, és művei máig óriási hatással vannak az irodalomra és a popkultúrára.', 'king.jpg', '1947-09-21', NULL),
(11, 'Alexandre', 'Dumas', 'Alexandre Dumas (idősebb) francia író, a világirodalom egyik legismertebb alakja, aki főként történelmi kalandregényeiről vált híressé. Olyan klasszikus művek szerzője, mint A három testőr, Húsz év múlva, A vasálarcos, valamint A Monte Cristo grófja. Munkái az izgalmas cselekmények, a romantikus kalandok és a színes karakterek révén váltak halhatatlanná.\r\n\r\nDumas édesapja, Thomas-Alexandre Dumas, a Napóleoni hadsereg tábornoka volt, aki afro-karibi származása miatt jelentős társadalmi és kulturális hatásokkal szembesült. Ez a háttér inspirálta Dumas-t, aki élete során az igazságtalanság és a társadalmi különbségek témáját is gyakran érintette műveiben.\r\n\r\nFiatalon kezdte irodalmi pályáját, először drámákat írt, majd később regényekre váltott, amelyek hatalmas sikereket hoztak számára. Gyakran együttműködött társszerzőkkel, hogy gazdag, szövevényes történeteket alkothasson. Írásai sokszor valódi történelmi eseményeken alapulnak, de mindig kalandos és romantikus elemekkel színesítette őket.\r\n\r\nDumas élete során hatalmas vagyont keresett, de extravagáns életmódja miatt pénzügyi problémái is akadtak.\r\nDumas 1870-ben hunyt el Puys faluban, anyagi nehézségekkel küszködve. Halála után hírnevét tovább növelte, hogy műveit több tucat nyelvre lefordították, és számos adaptáció készült belőlük színházban, filmen és televízióban. \r\n2002-ben, születésének 200. évfordulóján, Dumas földi maradványait a párizsi Panthéonba helyezték, a francia irodalom legnagyobb alakjai közé.', 'dumas.jpg', '1802-07-24', '1870-12-05'),
(12, 'Arthur', 'Golden', 'Arthur Golden (1956. december 6.) amerikai író, legismertebb műve az 1997-ben megjelent Egy gésa emlékiratai. Golden az Egyesült Államokban, Tennessee állam fővárosában, Nashville-ben született. Egyetemi tanulmányait a Harvardon végezte, ahol művészettörténet szakon szerzett diplomát, különös figyelmet szentelve a japán művészetnek. Később a Columbia Egyetemen tanult, ahol kelet-ázsiai tanulmányokra és japán történelemre specializálódott.\r\n\r\nGolden hosszabb időt töltött Japánban, ahol mélyebb betekintést nyert az ország kultúrájába és történelmébe, ami meghatározó inspirációként szolgált legismertebb regényéhez. Az Egy gésa emlékiratai alapos kutatáson alapul, amely során valódi gésákkal is interjút készített. A könyv megjelenése után nemzetközi sikert aratott, számos nyelvre lefordították, és 2005-ben film is készült belőle.\r\n\r\nGolden visszafogottan éli életét, és az Egy gésa emlékiratai az eddigi egyetlen megjelent regénye.', 'golden.jpg', '1956-12-06', NULL),
(13, 'Arthur Charles', 'Clarke', 'Arthur C. Clarke brit sci-fi író, futurista és tudományos gondolkodó, aki jelentős hatást gyakorolt az irodalomra és a tudományra egyaránt. Az angliai Mineheadben született egy gazdálkodó családban, és már fiatalon szenvedélyesen érdeklődött a csillagászat, az űrkutatás és a technológia iránt.\r\n\r\nClarke a második világháború idején a Brit Királyi Légierő radar-irányítással foglalkozó részlegén dolgozott. Itt szerzett tapasztalatai nagyban befolyásolták későbbi érdeklődését a technológia és az űrkutatás iránt. A háború után Clarke a londoni Kings College-ban tanult, ahol fizikából és matematikából diplomázott.\r\n\r\n1945-ben jelent meg híres cikke a geostacionárius műholdakról, amelyben előrevetítette a mai műholdas kommunikáció alapját. Bár közvetlenül nem váltotta pénzre az ötletet, jelentős mértékben hozzájárult a modern technológiai fejlődéshez. A geostacionárius pályát ma \"Clarke-pályának\" is nevezik tiszteletére.\r\n\r\nClarke írói pályafutását a rövid sci-fi novellák indították el az 1930-as és 1940-es években. Az első jelentős sikert az 1953-ban megjelent A gyermekkor vége című regénye hozta, amely az emberiség és egy fejlettebb idegen civilizáció kapcsolatát boncolgatja. Ezután számos más művel gazdagította a tudományos-fantasztikus irodalmat, amelyek közül a legismertebb a 2001: Űrodüsszeia. A regényt és a hozzá kapcsolódó forgatókönyvet Stanley Kubrickkal közösen készítette el, és mindkettő korszakalkotó lett. Clarke munkáiban gyakran ötvözte a tudományos hitelességet a filozófiai mélységgel, és központi kérdésként kezelte az emberiség helyét az univerzumban.\r\n\r\nClarke az 1950-es évek végén Sri Lankára (akkori nevén Ceylon) költözött, ahol élete hátralévő részét töltötte. Ott nemcsak íróként, hanem a búvárkodás iránti szenvedélyével is ismertté vált. Részt vett több tenger alatti felfedezésben, és népszerűsítette a tengeri régészetet.\r\n\r\nSri Lankán Clarke életét nyugodtan, de termékenyen élte, folyamatosan írt, és foglalkozott a technológiai újítások és az űrkutatás előmozdításával. Baráti kapcsolatot ápolt tudósokkal és írókkal világszerte, és aktívan részt vett az emberiség jövőjéről szóló diskurzusokban.', 'clarke.jpg', '1917-12-16', '2008-03-19');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `blog`
--

CREATE TABLE `blog` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `short_description` text NOT NULL,
  `image_url` varchar(50) NOT NULL,
  `img_top` varchar(50) NOT NULL,
  `conclusion` varchar(50) NOT NULL,
  `conclusion_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `blog`
--

INSERT INTO `blog` (`id`, `name`, `short_description`, `image_url`, `img_top`, `conclusion`, `conclusion_description`) VALUES
(1, 'A jövő könyvtára: több mint könyvek tárháza', 'A könyvtárak a tudás és közösség központjai, de a technológia és digitalizáció folyamatosan alakítja őket. Ahhoz, hogy relevánsak maradjanak, alkalmazkodniuk kell az új trendekhez és igényekhez. Nézzük, milyen változások várhatóak a következő években!', 'futurelibrary.jpg', 'futurelibrarycarousel.jpg', 'Összegzés', 'A könyvtárak folyamatosan fejlődnek és alkalmazkodnak a modern kor kihívásaihoz. A digitalizáció, az automatizáció és a közösségi térként való működés mind hozzájárulnak ahhoz, hogy a könyvtárak ne csak fennmaradjanak, hanem egyre nagyobb szerepet töltsenek be a tudásmegosztásban és a közösségépítésben. Bár a könyvek és az olvasás mindig központi szerepet játszanak, a könyvtárak jövője egy sokkal szélesebb, innovatívabb és interaktívabb élményt kínál majd az olvasóknak.'),
(2, 'Különleges könyvtári gyűjtemények és ritkaságok', 'A könyvtárak nem csupán hétköznapi könyvek tárolására szolgálnak. Számos intézmény őriz olyan különleges gyűjteményeket és ritkaságokat, amelyek művészeti, tudományos vagy történelmi szempontból kiemelkedő jelentőségűek. Nézzünk néhány lenyűgöző példát!', 'libraryofcongress.jpg', 'vaticancarousel.jpg', 'Összegzés', 'A könyvtárak nem csupán könyvek raktárai, hanem a kultúra és a tudomány kincsesbányái is. Az általuk őrzött különleges gyűjtemények révén betekintést nyerhetünk a múltba, a művészetekbe és a tudomány fejlődésébe. Ha legközelebb könyvtárba látogatunk, érdemes utánanézni, milyen ritkaságokat találhatunk ott!'),
(3, 'Könyves kihívások és olvasási projektek', 'Az olvasás nemcsak kikapcsolódás, hanem egyfajta kaland is lehet, különösen, ha egy jól megtervezett könyves kihívás vagy olvasási projekt keretében zajlik. Ezek a kezdeményezések motiválhatnak minket arra, hogy kilépjünk a komfortzónánkból, új műfajokat fedezzünk fel, vagy egyszerűen csak többet olvassunk. Nézzünk néhány népszerű olvasási kihívást és projektet!', 'readchallenges.jpg', 'challengecarousel.jpg', 'Összegzés', 'Az olvasás nemcsak tudást és élményeket nyújt, hanem hozzájárul a mentális egészség megőrzéséhez és javításához is. Legyen szó regényekről, önfejlesztő könyvekről vagy tudományos írásokról, az olvasás egy hatékony eszköz lehet a belső egyensúly és a lelki harmónia megteremtésében. Érdemes időt szánni rá, hogy élvezhessük annak jótékony hatásait!'),
(4, 'Olvasás és mentális egészség: Hogyan segíthet a könyvek világa?', 'A könyvek nem csupán szórakoztatásra szolgálnak, hanem fontos szerepet játszhatnak a mentális egészség megőrzésében és fejlesztésében is. Az olvasás lehetőséget ad a kikapcsolódásra, a stressz csökkentésére és az önismeret mélyítésére. Nézzük meg, hogyan befolyásolhatja pozitívan az olvasás a lelki jóllétünket!', 'readhealth.jpg', 'readingcarousel.jpg', 'Összegzés', 'Az olvasás nemcsak tudást és élményeket nyújt, hanem hozzájárul a mentális egészség megőrzéséhez és javításához is. Legyen szó regényekről, önfejlesztő könyvekről vagy tudományos írásokról, az olvasás egy hatékony eszköz lehet a belső egyensúly és a lelki harmónia megteremtésében. Érdemes időt szánni rá, hogy élvezhessük annak jótékony hatásait!');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `blog_descriptions`
--

CREATE TABLE `blog_descriptions` (
  `id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `heading` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `img` varchar(50) DEFAULT NULL,
  `img_align_end` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `blog_descriptions`
--

INSERT INTO `blog_descriptions` (`id`, `blog_id`, `heading`, `description`, `img`, `img_align_end`) VALUES
(1, 1, 'Digitalizáció és online hozzáférés', 'A digitális könyvek, hangoskönyvek és adatbázisok egyre szélesebb körben elérhetők. A mesterséges intelligencia segítségével a keresőrendszerek intelligensebbé válnak, így az olvasók gyorsabban és pontosabban találhatják meg a számukra releváns tartalmakat. A jövőben a könyvtárak nagyobb hangsúlyt fektetnek a távoli elérés biztosítására, így az olvasók bárhonnan hozzáférhetnek a tudáshoz.', NULL, 0),
(2, 1, 'Automatizáció és okos rendszerek', 'A könyvtári folyamatok egyre inkább automatizáltak lesznek. Az RFID-technológia és az önkiszolgáló kölcsönzőpultok már ma is segítik a látogatókat, de a jövőben a robotizált rendszerek még gyorsabbá és hatékonyabbá teszik a könyvtári működést. A mesterséges intelligencia pedig segíthet a katalógusok kezelésében és az olvasói igények kiszolgálásában is.', NULL, 0),
(3, 1, 'Közösségi és élménytér', 'A könyvtárak már nem csupán a csendes olvasás helyei, hanem élményközpontokká alakulnak. Az új generációk igényeinek megfelelően egyre több könyvtár kínál coworking helyszíneket, interaktív kiállításokat, multimédiás laborokat és innovációs műhelyeket. Ezek a terek lehetőséget biztosítanak a tanulásra, kutatásra, alkotásra és közösségi programokra is.', 'futurelibrary3.jpg', 1),
(4, 1, 'VR és AR technológiák', 'A virtuális (VR) és kiterjesztett valóság (AR) technológiák izgalmas lehetőségeket kínálnak a könyvtárak számára. Egy történelemkönyv például életre kelhet egy VR-szemüvegen keresztül, vagy egy természettudományi tankönyvben szereplő kísérleteket egy virtuális laborban is elvégezhetjük. Ezek az innovációk élményalapú tanulást tesznek lehetővé.', NULL, 0),
(5, 1, 'Fenntarthatóság és zöld könyvtárak', 'A környezettudatosság egyre nagyobb szerepet kap a könyvtárakban. Az energiatakarékos épületek, a megújuló energiaforrások használata és a digitális dokumentumok térnyerése mind hozzájárulnak a fenntartható működéshez. Emellett a könyvtárak aktívan részt vehetnek a közösségi újrahasznosításban és könyvcserék szervezésében.', NULL, 0),
(6, 1, 'Személyre szabott élmények', 'A mesterséges intelligencia alapú rendszerek egyre jobban megismerik az olvasók szokásait és érdeklődési köreit, így személyre szabott ajánlásokat tudnak adni. Egy jövőbeli könyvtárban az olvasók egyedi igényeiknek megfelelően kaphatnak könyvajánlásokat, értesítéseket új tartalmakról vagy akár tematikus olvasási kihívásokat is.', 'futurelibrary2.jpg', 0),
(7, 2, 'Kéziratok és ősi kódexek', 'A világ számos nagy könyvtára rendelkezik középkori kéziratokkal, díszesen megmunkált kódexekkel és egyedi pergamenekkel. Az egyik legismertebb gyűjtemény a Vatikáni Könyvtárban található, amely több ezer ritka dokumentumot őriz, köztük 4. századi Bibliákat és tudományos feljegyzéseket.', NULL, 0),
(8, 2, 'Első kiadások és aláírt példányok', 'A könyvtárak gyakran gyűjtik híres szerzők első kiadásait és dedikált példányait. A British Library például őrzi Shakespeare első fólióját, amely az egyik legértékesebb könyv a világon. Az ilyen könyvek nem csupán irodalmi, hanem történelmi értéket is képviselnek.', NULL, 0),
(9, 2, 'Térképek és földrajzi ritkaságok', 'A térképek gyűjtése egyes könyvtáraknál külön ágazat. A Library of Congress térképgyűjteménye több millió példányt tartalmaz, köztük az egyik legkorábbi Amerikát ábrázoló térképet. Ezek a dokumentumok bepillantást engednek a földrajzi felfedezések történetébe.', 'libraryofcongress2.jpg', 1),
(10, 2, 'Zenei és hangarchívumok', 'Egyes könyvtárak kottákat, hangfelvételeket és zenei kéziratokat is őriznek. A berlini Staatsbibliothek például Beethoven eredeti kottáit is megőrizte, amelyeken láthatók a zeneszerző saját jegyzetei és javításai.', NULL, 0),
(11, 2, 'Tudományos ritkaságok és egyedi dokumentumok', 'A könyvtárakban számos tudományos felfedezés eredeti dokumentációja megtalálható. A Harvard Egyetem Könyvtára olyan dokumentumokat őriz, amelyekben Einstein saját kézzel írt jegyzetei is megtalálhatók. Az ilyen gyűjtemények segítenek megérteni a tudomány fejlődését és a nagy gondolkodók munkáját.', NULL, 0),
(12, 2, 'Különleges tematikus gyűjtemények', 'Néhány könyvtár egy-egy specifikus témára fókuszál. Például a New York-i Morgan Library and Museum egyedülálló gyűjteményt kínál irodalmi és képzőművészeti ritkaságokból. Más könyvtárak akár egy-egy korszakra vagy műfajra specializálódhatnak, például sci-fi vagy bűnügyi regények gyűjtésével.', 'morganlibrary.jpg', 0),
(13, 3, 'Éves olvasási kihívások', 'Az egyik legnépszerűbb könyves kihívás az éves olvasási célkitűzés. Az olvasók meghatározhatnak egy adott számú könyvet, amelyet egy év alatt szeretnének elolvasni. A Goodreads Reading Challenge például világszerte több millió embert ösztönöz arra, hogy nyomon kövesse olvasmányait és elérje kitűzött céljait.', NULL, 0),
(14, 3, 'Tematikus kihívások', 'Ezek a kihívások egy-egy témára, műfajra vagy szerzőre koncentrálnak. Például:\r\n\r\nKlasszikusok kihívás – Egy év alatt meghatározott számú klasszikus mű elolvasása.\r\n\r\nNői szerzők kihívása – Olyan könyvek olvasása, amelyeket női írók írtak.\r\n\r\nVilágkörüli olvasás – Minden hónapban egy másik ország írójának könyvével ismerkedhetünk meg.', NULL, 0),
(15, 3, 'Olvasási bingó', 'A könyves bingó szórakoztató és kreatív módja az olvasás ösztönzésének. Egy táblázatba különféle olvasási kategóriákat helyezünk el (pl. „egy könyv, amelyet filmre adaptáltak”, „egy könyv, amelynek címe egy szót tartalmaz”), és a cél az, hogy minél több kategóriát kipipáljunk az év során. Ez különösen jó módja annak, hogy változatosabbá tegyük olvasási szokásainkat, hiszen játékosan ösztönöz minket új műfajok és szerzők felfedezésére.A könyves bingót egyedül is lehet játszani, de még izgalmasabb lehet barátokkal vagy egy olvasókörben, ahol egymást motiválhatjátok és megoszthatjátok az élményeiteket. Sokan szeretik kreatívan megközelíteni a bingót, például matricákkal vagy jegyzetekkel díszíteni a táblát.\r\n', 'bingo.jpg', 1),
(16, 3, '24 órás olvasási maratonok', 'Az olvasási maratonok rövid, de intenzív kihívások, amelyek során egy adott időkereten belül – például 24 óra alatt – minél több könyvet vagy oldalt próbálunk elolvasni. Ezek a maratonok gyakran közösségi eseményekként is működnek, ahol a résztvevők megosztják egymással élményeiket.', NULL, 0),
(17, 3, 'Könyvklubok és közösségi projektek', 'Az olvasási kihívások gyakran könyvklubok vagy online közösségek formájában is megjelennek, ahol a résztvevők közösen olvasnak el egy-egy könyvet, majd megosztják egymással gondolataikat. Ez nemcsak az olvasás élményét gazdagítja, hanem új nézőpontokat is adhat egy-egy mű értelmezéséhez.', NULL, 0),
(18, 3, 'Saját olvasási kihívás létrehozása', 'Ha egyik sem illik teljesen hozzánk, akár saját olvasási kihívást is kialakíthatunk! Meghatározhatunk személyes célokat, például több verseskötetet olvasni, egy adott korszak irodalmát felfedezni vagy minden hónapban egy új műfajt kipróbálni.\r\nNéhány ötlet saját olvasási kihíváshoz:\r\nKedvenc műfaj mélyebb felfedezése,\r\negy adott szerző összes művét végigolvasni, egy adott korszakban játszódó könyveket olvasni, vagy egy adott évben legalább egy könyvet idegen nyelven elolvasni. A saját olvasási kihívás előnye, hogy teljes mértékben az egyéni preferenciákhoz igazítható, és nincs rajtunk külső nyomás. Akár egy jegyzetfüzetben is vezethetjük a haladásunkat, vagy online olvasási naplót is készíthetünk.', 'ownchallenge.jpg', 0),
(19, 4, 'Az olvasás stresszcsökkentő hatása', 'Tudományos kutatások igazolják, hogy már napi néhány percnyi olvasás is csökkentheti a stressz szintjét. Az elmélyült figyelem, amelyet egy történet vagy egy tanulságos könyv igényel, segít kiszakadni a mindennapi gondokból és ellazítani az elmét.', NULL, 0),
(20, 4, 'Az empátia fejlesztése', 'Az irodalom révén különböző nézőpontokat és élettapasztalatokat ismerhetünk meg. Az elbeszélésekben való elmélyülés növeli az érzelmi intelligenciánkat és az empátiát, ami hozzájárulhat ahhoz, hogy jobban megértsük mások érzéseit és helyzeteit.', NULL, 0),
(21, 4, 'Önismeret és személyes fejlődés', 'Az önsegítő és pszichológiai könyvek segíthetnek jobban megérteni saját érzéseinket, viselkedésünket és gondolkodásmódunkat. Az ilyen típusú olvasmányok segítenek a mentális egészség fenntartásában és az önfejlesztésben.', 'selfknowledge.jpg', 1),
(22, 4, 'Az olvasás, mint menekülési lehetőség', 'Néha mindenkinek szüksége van egy kis menekülésre a valóság elől. Egy jó könyv lehetővé teszi, hogy egy másik világba lépjünk, elfelejtsük a hétköznapi problémákat, és felfedezzünk új gondolatokat és kalandokat.', NULL, 0),
(23, 4, 'Jobb alvás és nyugodtabb elme', 'Az esti olvasás segíthet az elalvásban és a nyugodtabb alvásban. A nyomtatott könyvek vagy e-könyvek olvasása lefekvés előtt csökkentheti a képernyők által okozott kognitív túlterhelést és segíthet a testnek és az elmének a pihenésben.', NULL, 0),
(24, 4, 'Közösségi élmény és társas kapcsolatok', 'Az olvasás nem csupán magányos tevékenység lehet. A könyvklubokban és online olvasói közösségekben való részvétel lehetőséget biztosít az eszmecserére, amely hozzájárul a társas támogatás érzéséhez és a közösségi kapcsolatok erősítéséhez.', 'groupreading.jpg', 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `books`
--

CREATE TABLE `books` (
  `book_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `translator` varchar(100) NOT NULL,
  `publisher` varchar(50) NOT NULL,
  `series` varchar(50) NOT NULL,
  `pages` int(4) NOT NULL,
  `publication_year` int(4) NOT NULL,
  `binding_type` varchar(30) NOT NULL,
  `isbn` varchar(30) NOT NULL,
  `description` text NOT NULL,
  `detailed_description` text NOT NULL,
  `cover_image_url` varchar(100) NOT NULL,
  `categories_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `books`
--

INSERT INTO `books` (`book_id`, `author_id`, `title`, `translator`, `publisher`, `series`, `pages`, `publication_year`, `binding_type`, `isbn`, `description`, `detailed_description`, `cover_image_url`, `categories_id`) VALUES
(1, 1, 'Harry Potter és a Bölcsek Köve', 'Tóth Tamás Boldizsár', 'Animus Könyvek', 'Harry Potter', 286, 1999, 'Keménytáblás', '9789633243015', 'A Harry Potter és a bölcsek köve J.K. Rowling világhírű, hétkötetes könyvsorozatának első része, amely 1997-ben jelent meg. A történet középpontjában Harry Potter, egy fiatal fiú áll, aki tizenegyedik születésnapján megtudja, hogy varázsló, és felvételt nyer a Roxfort Boszorkány- és Varázslóképző Szakiskolába.', 'Harry Potter, egy hétköznapinak tűnő, elárvult kisfiú, a mostohaszülőivel, a Dursley családdal él London külvárosában. Élete nyomorúságos: a családja rosszul bánik vele, és minden különös dolgot szigorúan büntetnek. Harry azonban a 11. születésnapján levelet kap a Roxfort Boszorkány- és Varázslóképző Szakiskolából, amelyben közlik vele, hogy varázsló, és meghívást kapott a híres iskolába.\r\n\r\nA történet központi témái a barátság, a bátorság és a jó és rossz közötti harc. Harry, Hermione és Ron kapcsolatán keresztül Rowling bemutatja, hogy az együttműködés és a különböző erősségek összhangja kulcsfontosságú a sikerhez. \r\n\r\nA Harry Potter és a bölcsek köve nemcsak egy szórakoztató történet, hanem a Harry Potter-univerzum alapköve, amely generációkat kapcsolt össze, és új mércét állított a fantasy irodalom számára. A regényből készült 2001-es filmadaptáció tovább növelte népszerűségét, és a könyv azóta is kultikus státusznak örvend.', 'harrypotter1.jpg', 1),
(2, 1, 'Harry Potter és a Titkok Kamrája', 'Tóth Tamás Boldizsár', 'Animus Könyvek', 'Harry Potter', 366, 2000, 'Keménytáblás', '9789636141479', 'A Harry Potter és a Titkok Kamrája J.K. Rowling második regénye, amely 1998-ban jelent meg. A történetben Harry visszatér a Roxfortba, ahol sötét rejtélyek és egy ősi legenda bontakozik ki.\r\nA Roxfort falai között egy ismeretlen erő megkőszoborítja a diákokat, és a pletykák szerint megnyílt a Titkok Kamrája – egy misztikus hely, amelyet a Roxfort alapítói egyike, Mardekár Malazár hozott létre. A kamra állítólag egy szörnyeteget rejt, amely csak Mardekár örököse tud irányítani.', 'A Harry Potter és a Titkok Kamrája, J.K. Rowling második kötete, az előző könyv eseményei után veszi fel a fonalat. Harry Potter a nyári szünetet ismét a Dursley családnál tölti.\r\nEnnek ellenére Harry eljut a varázslóiskolába, ahol egyre furcsább események zavarják meg az életet: a diákok és tanárok körében pletykák kezdenek terjedni egy titokzatos helyről, a Titkok Kamrájáról, amely állítólag a Roxfort falai között rejtőzik. A legenda szerint a kamrát Mardekár Malazár, az iskola egyik alapítója hozta létre, és egy veszélyes lény rejlik benne, amely képes megtámadni a diákokat.\r\nA Titkok Kamrája lebilincselő rejtélyekkel és fordulatokkal teli, amely az olvasókat mélyebben bevonja a Roxfort és a varázsvilág történetébe. Rowling színes stílusa és fantáziája ismét lenyűgöző világot teremt, amelyben a kaland és a veszély egyaránt jelen van. A könyv számos izgalmas helyzetet és felejthetetlen jelenetet kínál, miközben spoilermentesen is rengeteg meglepetést tartogat.\r\n\r\nA történet remek egyensúlyt talál a könnyed humor, a misztikum és az érzelmi mélység között, amely folytatja és kibővíti a Harry Potter-sorozat máig tartó sikerét.', 'harrypotter2.jpg', 1),
(3, 1, 'Harry Potter és az Azkabani Fogoly', 'Tóth Tamás Boldizsár', 'Animus Könyvek', 'Harry Potter', 400, 2000, 'Keménytáblás', '9789636142100', 'A Harry Potter és az azkabani fogoly J.K. Rowling harmadik regénye, amelyben Harry harmadik évét kezdi meg a Roxfortban. A történet középpontjában egy szökött rab, Sirius Black áll, aki az Azkaban börtönből szökött meg, és akit a varázsvilág szerint Harry szüleinek elárulásáért és haláláért felelős.', 'Harry Potter a nyári szünetet ismét a Dursley családnál tölti, de egy konfliktus miatt elszökik otthonról. Hamarosan kiderül, hogy egy hírhedt bűnöző, Sirius Black megszökött az Azkabanból, a varázslóvilág rettegett börtönéből. A varázslók között elterjedt nézet szerint Black Harry életére törhet, ezért az iskolában is fokozott biztonsági intézkedéseket vezetnek be.\r\nAhogy az események előrehaladnak, Harry egyre többet tud meg szüleiről, azok barátairól és egy múltbeli árulásról. A történet központi témája egy rejtély, amely összefügg azzal, hogy ki Sirius Black, és miért olyan fontos Harry számára.\r\nAz Azkabani fogoly sötétebb és érzelmileg mélyebb, mint az előző kötetek, miközben megőrzi a varázslatos elemeket és a Roxfort izgalmait. A könyv több fontos témát érint, mint például a barátság, a család, a megbocsátás és az igazság keresése. Az idő szerepe is központi motívum, és kulcsszerepet játszik a történetben.', 'harrypotter3.jpg', 1),
(4, 1, 'Harry Potter és a Tűz Serlege', 'Tóth Tamás Boldizsár', 'Animus Könyvek', 'Harry Potter', 678, 2000, 'Keménytáblás', '9789636144906', 'A Harry Potter és a Tűz Serlege J.K. Rowling negyedik regénye, amelyben Harry negyedik évét kezdi a Roxfortban. A történet középpontjában a Trimágus Tusához kapcsolódó izgalmas események állnak, egy nagy presztízsű, nemzetközi varázslóverseny, amelyen három iskola diákjai mérik össze képességeiket.', 'A történet a Kviddics Világkupa izgalmas eseményeivel indul, amely során Harry és barátai, Ron és Hermione, betekintést nyernek a varázsvilág nemzetközi szintű összetettségébe. Az eseményt azonban váratlan események zavarják meg, amelyek sötét előjelekként hatnak a varázsvilágban.\r\nA Roxfortba visszatérve Harry és társai izgatottan várják a Trimágus Tusa kezdetét, egy évszázadok óta megrendezett, rendkívül veszélyes versenyt, amelyben három varázslóiskola – a Roxfort, a Durmstrang és a Beauxbatons – diákjai versengenek egymással. A versenyzők nevét egy mágikus tárgy, a Tűz Serlege választja ki, és csak a legidősebb és legtehetségesebb tanulók vehetnek részt.\r\nA történetben a varázsvilág kiterjedtebbé válik, és az olvasók megismerhetik annak nemzetközi dimenzióit. A Trimágus Tusa látványos és veszélyes próbái izgalmas, fordulatos jeleneteket kínálnak, miközben a háttérben egyre érezhetőbb a fenyegető sötétség. A könyv hangulata fokozatosan komorodik, és előrevetíti a későbbi részek komolyabb konfliktusait.', 'harrypotter4.jpg', 1),
(5, 1, 'Harry Potter és a Főnix Rendje', 'Tóth Tamás Boldizsár', 'Animus Könyvek', 'Harry Potter', 752, 2003, 'Keménytáblás', '9789636140847', 'A Harry Potter és a Főnix Rendje, J.K. Rowling ötödik regénye, sötétebb és érettebb hangvételű, ahogy Harry a Roxfort ötödik évébe lép. A történetben Harry szembesül Voldemort visszatérésével és a varázsvilág hivatalos tagadásával, miközben a Mágiaügyi Minisztérium próbálja elhallgattatni őt és Dumbledore-t.', 'Harry Potter a nyári szünetet egyre fokozódó elszigeteltségben tölti. A Mágiaügyi Minisztérium nyíltan tagadja Voldemort visszatérését, és Harryt hazudozónak bélyegzi. Amikor azonban váratlan események miatt Harry veszélybe kerül, egy titkos szervezet, a Főnix Rendje, közbelép, hogy megvédje. Ez a szervezet olyan varázslókból áll, akik Voldemort ellen küzdenek, és Harry rájön, hogy nem ő az egyetlen, aki harcolni próbál a gonosz ellen.\r\nAhogy visszatér a Roxfortba, az iskola élete megváltozik. A Minisztérium egy új tanárt, Dolores Umbridge-et küldi az iskolába, aki zsarnoki módszereivel és szigorú szabályaival az egész Roxfortot fenyegeti. Harry és barátai titkos szövetséget hoznak létre, hogy szembeszálljanak vele, és felkészüljenek a sötét erőkkel való küzdelemre.\r\nEz a kötet jelentősen kiterjeszti a varázsvilág horizontját, bemutatva a Főnix Rendjének működését, a Minisztérium intrikáit és a varázsvilág politikai feszültségeit. A könyv komorabb és érettebb hangulatot áraszt, amely jól tükrözi Harry és társai érzelmi fejlődését.', 'harrypotter5.jpg', 1),
(6, 1, 'Harry Potter és a Félvér Herceg', 'Tóth Tamás Boldizsár', 'Animus Könyvek', 'Harry Potter', 618, 2006, 'Keménytáblás', '9639563757', 'A Harry Potter és a Félvér Herceg J.K. Rowling sorozatának hatodik része, amely sötétebb és érzelmesebb fordulatokat hoz. A történetben Harry hatodik évét kezdi a Roxfortban, miközben Dumbledore segítségével egyre többet tud meg Voldemort múltjáról és hatalmának forrásáról.', 'A történet kezdetén a varázsvilágot a halálfalók támadásai és Voldemort fenyegetése uralja. A mugli világban is érezhető a sötétség hatása, amely egyre mélyebb káoszt okoz. Harry és barátai visszatérnek a Roxfortba, ahol új tanév kezdődik, de a megszokott tanórákon túl Dumbledore személyesen is tanítani kezdi Harryt, hogy felfedje előtte Voldemort múltját.\r\nEközben Harry egy régi bájitaltankönyvre bukkan, amely a „Félvér Herceg” nevű rejtélyes személy jegyzeteit tartalmazza. A könyv tele van hasznos tippekkel és különleges varázslatokkal, amelyek segítik Harryt a tanulásban, de a Herceg valódi kiléte rejtély marad. A könyv mindennapi életének fontos részévé válik, ugyanakkor veszélyeket is rejt.\r\nA könyv hangulata komorabb, mint az előző köteteké. A veszteség, a rejtélyek és a háború előérzete végig jelen van, de Rowling mestere annak, hogy a sötét pillanatokat humorral és érzelmi intimitással egyensúlyozza ki. A Roxfort biztonsága már nem olyan erős, mint régen, és a varázsvilág sötétsége az iskola falain belül is érezhető.', 'harrypotter6.jpg', 1),
(7, 1, 'Harry Potter és a Halál ereklyéi', 'Tóth Tamás Boldizsár', 'Animus Könyvek', 'Harry Potter', 624, 2008, 'Keménytáblás', '9789636145019', 'A Harry Potter és a Halál ereklyéi J.K. Rowling varázslatos sorozatának zárókötete, amely a végső harcot mutatja be Harry és Voldemort között. Harry, Ron és Hermione elhagyják a Roxfortot, hogy megtalálják és megsemmisítsék a Horcruxokat, amelyek Voldemort halhatatlanságának forrásai. Eközben felfedezik a Halál ereklyéinek titkát, egy ősi legenda tárgyait, amelyek hatalmas erőt rejtenek.', 'A történet elején Harry és barátai már nem térnek vissza a Roxfortba, hanem elindulnak, hogy megtalálják és megsemmisítsék Voldemort Horcruxait – olyan tárgyakat, amelyek tartalmazzák a Sötét Nagyúr lelkének egy-egy darabját, lehetővé téve számára, hogy halhatatlan maradjon. Ahogy közelednek a céljukhoz, egyre több nehézséggel és veszéllyel kell szembenézniük, miközben próbálják megőrizni a reményt a sötét időkben.\r\nA kötetben hangsúlyos szerepet kapnak a döntések, a küzdelem és a személyes áldozatok. A varázslóvilágot egyre inkább a háború sújtja, és a fiataloknak nemcsak a külső ellenséggel kell megküzdeniük, hanem saját félelmeikkel és kétségeikkel is. Az önfeláldozás, a hűség és a bátorság a legfontosabb motívumok, amelyek végigkísérik a főszereplők útját.\r\nHarry karaktere továbbra is a történet központjában áll, miközben ő maga is egyre inkább megérti saját szerepét a háborúban. Ron és Hermione támogatása kulcsfontosságú, és a három barát kapcsolata ebben a kötetben tovább erősödik. A történet során más kulcsszereplők, például a varázslóvilág vezetői és Voldemort csatlósai is új oldalakról mutatkoznak be.\r\nA sorozat utolsó részeként egy olyan fejezetet jelent, amely nemcsak válaszokat ad, hanem mélyebb kérdéseket is felvet, és egy felemelő, mégis érzelmileg megterhelő befejezést kínál.', 'harrypotter7.jpg', 1),
(8, 2, 'A Gyűrűk Ura I-III.', 'Göncz Árpád, Réz Ádám, Tandori Dezső', 'Európa Kiadó', 'A Gyűrűk ura', 1836, 1981, 'Kötött', '9789634058397', 'A Gyűrűk Ura J.R.R. Tolkien háromkötetes epikus fantasy sorozata, amely Középföldén játszódik. A történet központjában Zsákos Frodó, egy hobbit áll, aki egy veszélyes küldetésre indul, hogy megsemmisítse a Hatalom Gyűrűjét, amelyet Sauron, a sötét úr akar visszaszerezni, hogy uralma alá hajtsa a világot. Frodo és hűséges társai, köztük Samu, Aragorn, Legolas és Gimli, hosszú utazásra indulnak, miközben szembenéznek a gyűrű hatalmával és a gonosz erőivel.', 'A történet középpontjában egy fiatal hobbit, Zsákos Frodó áll, aki egy titokzatos és rendkívül veszélyes küldetésre indul, hogy elpusztítsa a Hatalom Gyűrűjét, amely hatalmat ad tulajdonosának, és képes uralma alá hajtani a világot. A gyűrű azonban nemcsak varázslatos erejével, hanem sötét, gonosz hatalmaival is veszélyt jelent, és aki birtokolja, könnyen elcsábulhat.\r\nFrodo és hűséges társai, köztük a szintén fiatal hobbit Samu, a rejtélyes és magányos Aragorn, az elf Legolas és a törpe Gimli, valamint az Istari, egy mágikus rend tagja, Gandalf, elindulnak a veszélyes úton, hogy megsemmisítsék a gyűrűt, miközben meg kell küzdeniük a sötét úr, Sauron hatalmával, aki mindenáron vissza akarja szerezni azt. Útjuk során különböző kalandokba keverednek, és szembesülnek a barátság, a hűség, az önfeláldozás és a hatalom csábításának kérdéseivel.\r\nA három kötet:\r\n1. A gyűrű szövetsége: A hősök összeállnak, hogy elinduljanak a gyűrű megsemmisítésére.\r\n2. A két torony: A közösség tagjai külön utakon folytatják küzdelmüket a sötétség ellen.\r\n3. A király visszatér: A végső csata és a gyűrű sorsa eldől.\r\nA Gyűrűk Ura nemcsak kalandregény, hanem egy gazdag mitológiai világra épített történet, amely az egész fantasy irodalmat meghatározta. Tolkien alkotása rendkívül részletes világépítéssel rendelkezik, számos történelmi és mitológiai hivatkozással, és a szereplők személyes történeteit is mélyen bemutatja. Az egyes karakterek kapcsolata, döntései és fejlődése adja a mű érzelmi és filozófiai súlyát.', 'lotr.jpg', 1),
(9, 3, ' Napsütötte Toszkána', 'Tamás Dénes', 'Tericum Kiadó Kft.', '', 376, 2001, 'Kartonált', '9789634381242', 'Napsütötte Toszkána (Under the Tuscan Sun) Frances Mayes 1996-ban megjelent memoárja, amelyben az írónő Toszkánában vásárolt régi villájának felújításáról és az olasz vidéki életbe való beilleszkedéséről mesél. A könyv a vidék szépségét, az olasz kultúra gazdagságát és a helyi konyha iránti szenvedélyt mutatja be, miközben Frances személyes útját is végigköveti az új élet kezdete felé.\r\nTele van érzéki tájleírásokkal, humoros és megható történetekkel, valamint ínycsiklandó receptekkel, a könyv egyszerre utazási élménybeszámoló, gasztronómiai kalauz és önéletrajzi ihletésű inspiráció.', 'A könyv középpontjában Mayes döntése áll, hogy vásárol egy elhagyatott, romos villát Toszkánában, és nekilát a ház felújításának, valamint az ottani életmód elsajátításának. Ez nem csupán egy ingatlanról, hanem az életének új alapokra helyezéséről is szól, miközben rátalál a lassabb, kiegyensúlyozottabb élet örömeire.\r\nA könyv különleges élményt nyújt a részletes és érzéki leírásaival. Mayes gyönyörűen festi meg a toszkán tájakat: a végtelen szőlőültetvényeket, az olajfaligeteket és a középkori kisvárosok hangulatát. Emellett bepillantást nyújt az olasz kultúrába, különös tekintettel az ételekre, amelyek a könyv egyik legfontosabb témájává válnak. A receptek és a gasztronómiai élmények nemcsak ínycsiklandóak, hanem szimbolikusak is: a táplálás és a közös étkezés az új kapcsolatok és az új élet részeivé válnak.\r\nA könyv filozofikusabb rétegei a megújulásról, a változás elfogadásáról és az önismeretről szólnak. Mayes őszintén ír arról, hogy miként tanulta meg élvezni a pillanatokat, elengedni a múlt fájdalmait, és hogyan talált örömet a hétköznapi élet apró részleteiben.\r\nA Napsütötte Toszkána nem egy hagyományos történetvezetésű regény, hanem inkább egy lírai, elmélkedő memoár. Olyan olvasók számára ideális, akik szeretnek utazásokról, kultúrákról, gasztronómiáról és az élet apró örömeiről olvasni, mindezt inspiráló és életigenlő stílusban.', 'toszkana.jpg', 2),
(10, 4, 'Ahol a szivárvány véget ér', 'Morcsányi Júlia', 'Athenaeum Kiadó', '', 448, 2008, 'puhatáblás', '9789632930862', 'Cecelia Ahern \"Ahol a szivárvány véget ér\" (Love, Rosie) egy megható és szívhez szóló történet két gyerekkori legjobb barát, Rosie és Alex életéről. A regény levelek, e-mailek és üzenetek formájában követi nyomon kettejük kapcsolatát, amely barátságból lassan valami mélyebb érzéssé alakul. Ám az élet tele van kihívásokkal, félreértésekkel és elszalasztott lehetőségekkel, amelyek próbára teszik a kapcsolatukat.\r\nA könyv a barátság, a szerelem és a sors kiszámíthatatlanságának szép és érzelmes ábrázolása, amely arra ösztönöz, hogy soha ne adjuk fel az álmainkat és a boldogság keresését.', 'A történet Rosie Dunne és Alex Stewart életét követi, akik már gyerekkoruk óta elválaszthatatlan barátok. A regény formátuma különleges: az eseményeket levelek, e-mailek, képeslapok és csevegések formájában ismerjük meg, ami egyedi, személyes hangvételt ad a történetnek.\r\nRosie és Alex kapcsolata mindig is különleges volt, de az életükben bekövetkező fordulatok – költözések, párkapcsolatok, családi és karrierbeli döntések – folyamatosan próbára teszik a köztük lévő köteléket. Bár mindketten éreznek valami mélyebb vonzalmat a másik iránt, az időzítés és a körülmények sosem tűnnek ideálisnak. Az életük hullámvölgyei és felemelkedései során azonban mindig visszatalálnak egymáshoz, még akkor is, ha csak barátként.\r\nA regény különös figyelmet szentel annak, hogyan alakulnak az emberi kapcsolatok az idő múlásával. Rosie története nemcsak romantikus, hanem inspiráló is: egy erős nő küzdelmét és fejlődését mutatja be, aki minden nehézség ellenére megtalálja a boldogságot és a saját útját. A humoros pillanatok egyensúlyozzák a megható részeket, így a könyv egyszerre szórakoztató és elgondolkodtató.\r\nAz \"Ahol a szivárvány véget ér\" nemcsak egy barátságról és szerelemről szóló történet, hanem az emberi sorsról, az elszalasztott lehetőségekről és a reményről, hogy soha nincs túl késő a boldogságra. Ideális választás azoknak, akik szeretik a mély érzelmekkel és finom humorral átszőtt romantikus regényeket.', 'loverosie.jpg', 3),
(11, 5, 'Moby Dick', 'Kovácsné Kliment Emília', 'Holnap Kiadó', '', 684, 2012, 'Puhatáblás', '9789633490228', 'Herman Melville Moby Dick című regénye egy lenyűgöző tengeri kalandtörténet, amely az emberi megszállottság, a természet hatalma és az élet nagy kérdéseinek mélyebb filozófiai vizsgálata. A történet főszereplője Ishmael, egy tengerész, aki a Pequod nevű bálnavadászhajóra szegődik. A hajót a karizmatikus és elszánt Ahab kapitány vezeti, akinek egyetlen célja van: megtalálni és elpusztítani a hatalmas fehér bálnát, Moby Dicket, amely korábban megsebesítette őt.', 'A könyv narrátora, Ishmael, egy tengerész, aki a bálnavadászat izgalmát keresve csatlakozik a Pequod nevű bálnavadászhajóhoz. A Pequodot Ahab kapitány vezeti, egy erős akaratú és titokzatos ember, akinek megszállottsága egyetlen célt követ: levadászni a legendás fehér bálnát, Moby Dicket, amelyet a legénység és a tengerészek szinte mitikus lényként emlegetnek.\r\nA történet során az olvasó megismerheti a 19. századi bálnavadászat részleteit, a tengeri élet mindennapjait és az Atlanti-óceán végtelen kiterjedését. A regény bővelkedik gazdag természeti leírásokban, amelyek a bálnák életét és az emberi viszonyulást a természethez enciklopédikus részletességgel tárják fel. Melville nemcsak a tengeri kalandok izgalmát ragadja meg, hanem mély filozófiai kérdéseket is feszeget, mint például a sors, az ember és természet viszonya, valamint az emberi megszállottság következményei.\r\nA regény egyik legfontosabb ereje az erőteljes szimbólumokban rejlik. A fehér bálna, Moby Dick, egyszerre testesíti meg a természet vad erejét, az emberi félelmeket és az ismeretlennel való küzdelmet. Ahab kapitány karaktere az emberi akarat és megszállottság végleteit vizsgálja, miközben a legénység sokszínű alakjai különböző perspektívákon keresztül mutatják be az emberi természet komplexitását.\r\nBár a Moby Dick egy kalandos történetként is élvezhető, mélységei miatt az amerikai irodalom egyik legfontosabb műveként tartják számon. A regény nemcsak a tengeri életet és a bálnavadászatot mutatja be, hanem az emberi lélek belső harcának, a kitartásnak és a végzet elkerülhetetlenségének epikus allegóriája is.', 'mobydick.jpg', 4),
(12, 6, 'Gyilkosság az Orient expresszen', 'Katona Tamás', 'Helikon Kiadó', 'Poirot', 300, 1980, 'Puhatáblás', '9789636205362', 'Agatha Christie 1934-ben megjelent Gyilkosság az Orient expresszen című klasszikus krimijében Hercule Poirot, a zseniális belga detektív egy hóvihar miatt elakadt luxusvonaton találja magát. Az éjszaka folyamán egy utast meggyilkolnak, és Poirot-nak az elszigetelt helyzetben kell megoldania az ügyet. A gyanúsítottak köre szinte az egész vonatot lefedi, és mindenkinek van indítéka, de semmi sem az, aminek látszik. A történet tele van fordulatokkal, és Poirot briliáns logikáját követve a végén minden szál összeér egy váratlan megoldásban. Ez a mű a krimi irodalom egyik legismertebb és legnagyobb hatású alkotása.', 'A cselekmény Hercule Poirot, a híres belga nyomozó körül forog, aki éppen Törökországból térne vissza Londonba az Orient expressz fedélzetén. Az utazás azonban hamarosan váratlan fordulatot vesz, amikor a vonat egy hóvihar miatt megáll a Balkán-hegység közelében, és az éjszaka során egy utast holtan találnak.\r\nAz áldozat egy amerikai férfi, Samuel Ratchett, akiről hamarosan kiderül, hogy nem az, akinek mondja magát, és sötét múltja számos kérdést vet fel. A vonaton rekedt utasok mind gyanúsítottá válnak, és Poirot-hoz fordulnak, hogy derítse ki, ki követte el a gyilkosságot. A nyomozás során Poirot aprólékosan feltárja az utasok alibijét, motivációit, és a múltban összekapcsolódó szálakat, miközben a történet tele van meglepő fordulatokkal.\r\nA regény egyik legizgalmasabb eleme a zárt szoba rejtély: a gyilkosságot egy izolált környezetben követték el, így biztos, hogy az elkövető a vonaton tartózkodik. A szerző mesterien vezeti az olvasót a gyanúsítottak és az események között, szinte mindenkit potenciális tettesként ábrázolva.\r\nA történet nemcsak izgalmas krimi, hanem az emberi természet, az igazság és az igazságszolgáltatás kérdéseit is vizsgálja. A luxusvonat szűkös, elegáns környezete pedig különleges hangulatot teremt. A végkifejlet, amely Poirot briliáns dedukciójának eredménye, zseniálisan összeköti a szálakat, és megmutatja, miért tekintik ezt a könyvet a detektívtörténetek egyik legjobbjának.', 'poirot1.jpg', 5),
(13, 6, 'Halál a Níluson', 'Kosáryné Réz Lola', 'Helikon Kiadó', 'Poirot', 384, 1987, 'Puhatáblás', '9789636204662', 'Halál a Níluson (Death on the Nile) Agatha Christie egyik legismertebb és legnépszerűbb krimije, amely 1937-ben jelent meg. A regény a belga nyomozó, Hercule Poirot kalandját követi, aki a Níluson tett hajóúton találja magát egy gyilkosság közepette. A könyv a klasszikus \"whodunit\" (ki tette?) típusú krimik közé tartozik, amelyben a történet fokozatosan bontakozik ki, és a nyomozó az olvasóval együtt próbálja kideríteni, ki a gyilkos.', 'A cselekmény egy luxushajó utazásán játszódik, amely a Nílus mentén halad Egyiptomban. A hajón egy gazdag amerikai örökösnő, Linnet Ridgeway és férje, Simon Doyle utaznak, akik a házasságuk első szakaszát élvezik. Linnet nemcsak szépségéről és gazdagságáról híres, hanem a magánéletében is komoly drámákat élt át. Míg a házaspár úgy tűnik, hogy a boldogságot élvezi, az utazás alatt egy sor bonyodalom és feszültség kezd felszínre törni a többi utas között.\r\nA hajón több érdekes karakter is tartózkodik: a házaspár barátai, volt szerelmek, rokonok, mindannyian különböző motivációkkal és titkokkal. A regény főbb témái közé tartozik a féltékenység, a pénz és hatalom iránti vágy, valamint a bűntudat és a megtorlás kérdése.\r\nAz idilli nyaralás hamar tragédiába fordul, amikor Linnetet holtan találják a kabinjában. A feszültség és a gyanú mindegyik utast a gyanú hálójába vonja. Poirot, aki épp az úton pihen, saját nyomozásba kezd. Az események egyre inkább bonyolódnak, és Poirot fokozatosan feltárja a különböző szereplők titkait, miközben egyre közelebb kerül a gyilkoshoz.\r\nA regény központi témája az emberi motivációk, különösen a pénz és a hatalom iránti vágy, a féltékenység és a személyes kapcsolatok bonyolultsága. A gyilkosság és a bűnügy megoldásának mélyebb szintjei a morális kérdésekkel, az önzés és a szenvedés természetével is foglalkoznak. Christie ügyesen ábrázolja, hogyan vezethetnek a személyes vágyak és sérelmek bűncselekményekhez, és hogyan használhatják a szereplők a manipulációt és hazugságokat céljaik elérése érdekében.', 'poirot2.jpg', 5),
(14, 7, 'A Pál utcai fiúk', '', 'Holnap Kiadó', 'Ifjúsági Könyvek', 188, 1906, 'Keménytáblás', '9789633494578', 'A Pál utcai fiúk Molnár Ferenc legismertebb műve, amely először 1906-ban jelent meg, és azóta is a magyar irodalom egyik alapműve. A regény egy különleges barátságot és egy izgalmas, gyermeki hőstettet mutat be, miközben a tisztesség, a hűség és a bátorság eszméit hangsúlyozza.\r\nA Pál utcai fiúk története nem csupán egy izgalmas gyermekkaland, hanem egy komoly erkölcsi és filozófiai üzenetet is hordoz. A fiúk bátorsága, önfeláldozása és hűsége a csapatuk iránt mélyebb emberi értékeket közvetít, és a regény a mai napig egyetemes tanulságokkal szolgál.', 'A cselekmény középpontjában két rivális csapat, a Pál utcai fiúk és a Vörösingesek állnak, akik egy elhagyatott területen, a Grundon vívnak harcot. A Pál utcai fiúk csapata egy szoros barátságot alkot, és egy kis közösségként élnek a saját világukban. Az ő világukat veszélyezteti a Vörösingesek csapata, akik el akarják venni tőlük a Grundot, és ezért egyre komolyabb összecsapások alakulnak ki közöttük.\r\nA történet középpontjában a barátság, a hűség és az önfeláldozás áll, miközben a gyerekek egy olyan felnőtt világot is tapasztalnak, amelyben a tisztesség, a becsület és a kötelesség szerepe fontos szerepet kap. A regény egy olyan időszakot és helyszínt ábrázol, amelyben a társadalmi különbségek, a gyermeki idealizmus és a valóságos küzdelmek keverednek, így egy mélyebb társadalmi és emberi értékrendet is közvetít.\r\nA történet különlegessége abban rejlik, hogy miközben a fiúk szembesülnek a valóságos veszéllyel és küzdelmekkel, addig a regény egy mélyebb filozófiai kérdést is felvet: Mi a valódi bátorság? Hogyan képesek a gyerekek és felnőttek különböző módon, de mégis hasonló értékek mentén küzdeni a helyes ügyért?\r\nA Pál utcai fiúk műfaja egyszerre ifjúsági regény és társadalmi krónika. Miközben a fiúk a Grund védelméért küzdenek, a regény szimbolikusan azt is kérdezi, hogy mi történik, ha a gyermeki világ és a felnőttek világa összeütközik, és hogyan élik meg a fiatalok a társadalmi és erkölcsi törvényeket.', 'palutcai.jpg', 6),
(15, 8, '1984', 'Bajtai Zoltán', 'Európa Könyvkiadó', '', 163, 1984, 'Keménytáblás', '9789630792257', '1984 George Orwell 1949-ben megjelent, disztópikus regénye, amely a totalitárius államok és a személyes szabadság elnyomásának félelmetes jövőjét ábrázolja. A történet főszereplője Winston Smith, egy dolgozó, aki az Óceániában, egy elnyomó, diktatórikus rendszerben él, ahol minden aspektusát az életének az állam irányítja. Az országot a Nagy Testvér vezet, aki folyamatosan figyeli a polgárait, és aki szigorúan ellenőrzi a gondolatokat is.', 'A regény középpontjában Winston Smith, egy átlagos állampolgár áll, aki a Nagy Testvér által irányított, totális diktatúrában él. Óceánia – a világ, ahol Winston lakik – egy fiktív, elnyomó állam, amely folyamatosan háborúzik a másik két hatalommal, Eurázsiával és Kelet-Ázsiával. Az állam minden aspektust irányít, és az emberek gondolatait is szigorúan felügyelik. Minden lakos számára az állam állandóan elérhető, mivel folyamatos megfigyelés alatt állnak.\r\nA regényben a legfontosabb elem a Nagy Testvér, egy megfoghatatlan, mindenütt jelen lévő figura, aki az államot és annak ideológiáját testesíti meg. A Nagy Testvérre mindig figyelni kell, és minden egyes tevékenységet, gondolatot, beszédet a Gondolatrendőrség figyel. Az embereknek folyamatosan el kell hitetniük magukkal, hogy mindent a Nagy Testvér irányít, és hogy ő a mindenható vezető.\r\nWinston Smith a kormány egyik minisztériumában dolgozik, a Történelem Minisztériumában, amelynek feladata az, hogy átírja a múltat és manipulálja a tényeket. A kormány folyamatosan újabb és újabb hazugságokat terjeszt, így a valóságot az állam hozza létre. Winston, aki már nem képes teljes mértékben elhinni a kormány hazugságait, titokban elkezdi kérdőre vonni a rendszert, és lázadni próbál ellene.\r\nA 1984 egyik központi témája a totalitárius diktatúra és a hatalom mindenhatósága. Orwell a regényben azt ábrázolja, hogy egy ilyen rendszer miként képes mindent ellenőrizni, a legkisebb részletet is irányítani, és hogyan képes manipulálni az emberek gondolkodását. Az emberek nemcsak fizikai értelemben vannak elnyomva, hanem szellemi szinten is, hiszen az állam folyamatosan módosítja a valóságot, így az emberek már nem képesek megkülönböztetni az igazságot a hazugságtól.\r\nA regényben központi szerepe van a gondolatrendőrségnek, a társadalmi ellenőrzés egyik legfőbb eszközének. Az emberek állandóan a megfigyelés alatt állnak, minden tevékenységük, beszélgetésük, és gondolatuk is kontrollált. Az állam létrehoz egy olyan új nyelvet, a Newspeak-et, amely korlátozza az egyéni gondolkodást és lehetetlenné teszi azokat a fogalmakat, amelyek lehetőséget adhatnának a rendszer kritikájára.', '1984.jpg', 7),
(16, 9, 'Egri csillagok', '', 'Osiris Kiadó', '', 561, 2023, 'Kartonált', '9789632764672', 'Gárdonyi Géza Egri csillagok című regénye a 16. századi Magyarországon játszódik, és a török hódoltság idejének hősies eseményeit eleveníti fel. A történet középpontjában az egri vár 1552-es ostroma áll, ahol Dobó István és vitézei megvédik a várat a hatalmas török sereggel szemben.\r\nA regény két fiatal, Bornemissza Gergely és Cecey Éva sorsát követi, akiknek szerelme, hűsége és bátorsága a történelmi küzdelmek szövetébe ágyazódik. Az izgalmas események során barátság, hazaszeretet és hősiesség bontakozik ki, miközben a magyar nép megmutatja erejét és kitartását az ellenséggel szemben.', 'A történet öt nagy részre tagolódik, és két fiatal, Bornemissza Gergely és Cecey Éva életútját követi végig. Gergely gyermekként találkozik először a török fenyegetéssel, majd az események sodrában egyre nagyobb szerepet kap a vár védelmében és a hazájáért vívott küzdelemben. A regény nemcsak a csaták és a vár ostromának részleteit mutatja be, hanem a szereplők emberi oldalát, érzelmeit, küzdelmeit és fejlődését is. Éva Gergely hűséges társa, akinek sorsa és kitartása szintén kiemelkedő szerepet játszik a regényben.\r\nA mű színes mellékszereplőkkel gazdagítja a történetet: a magyar vitézek és a török harcosok jellemrajzai izgalmasak és árnyaltak. A regény egyszerre mutatja be a hősiesség, a hazaszeretet, az áldozatvállalás és az emberi érzelmek mélységeit. Gárdonyi részletes leírásai a történelmi korszakról és a mindennapi élet részleteiről hitelesen idézik fel a 16. századi Magyarországot.\r\nAz Egri csillagok különösen nagy hangsúlyt fektet a közösség erejére és a hazaszeretet fontosságára. A cselekmény izgalmas fordulatai, a személyes történetek és a történelmi események összefonódása miatt a regény egyszerre érzelmileg megindító és kalandos. Gárdonyi stílusa olvasmányos, nyelvezete élénk, és a történet feszült pillanatai minden korosztály számára érthetők és élvezhetők.\r\nA regény a magyar történelem egy dicsőséges időszakát mutatja be, és a bátorság, a kitartás, valamint az emberi helytállás örök értékeiről mesél, így méltán vált az egyik legnagyobb magyar', 'egricsillagok.jpg', 8),
(17, 10, 'A ragyogás', 'Prekop Gabriella', 'Európa Kiadó', '', 440, 2018, 'Kötött', '9789634059165', 'Stephen King – A ragyogás egy pszichológiai horror regény, amely az elszigeteltség, az őrület és a természetfeletti fenyegetés sötét világát tárja fel. A történet főszereplője Jack Torrance, egy írói ambíciókkal rendelkező, alkoholproblémákkal küzdő férfi, aki télire gondnokként vállal munkát az elhagyatott Overlook Hotelben, egy hegyekben fekvő, hatalmas szállodában.', 'A történet középpontjában a Torrance család áll: Jack, az apa, Wendy, az anya, és Danny, a hatéves kisfiuk. Jack Torrance író és tanár, aki egy balul elsült munkahelyi incidens és korábbi alkoholproblémái után új esélyt keres az életében. Elfogadja az Overlook Hotel téli gondnoki állását, amely kiváló lehetőségnek tűnik arra, hogy újra összekovácsolja a családját, és közben íróként is alkosson.\r\nAz Overlook Hotel, egy eldugott hegyvidéki szálloda, télen teljesen elzárt a külvilágtól. Miközben a család beköltözik, a hely különleges és nyomasztó légköre lassan feltárul előttük. A szálloda falai között évtizedek óta sötét események történtek, és ezek a titkok mintha életre kelnének a magányos, hóval borított környezetben. Danny különleges érzéke, a \"ragyogás\", lehetővé teszi számára, hogy meglássa a szálloda természetfeletti erőit és a fenyegető veszélyeket, amelyek a családjára leselkednek.\r\nA regény egyedülálló módon építi fel a feszültséget. Stephen King részletesen bemutatja a karakterek érzéseit, félelmeit és belső küzdelmeit, miközben a szálloda baljós légköre egyre fojtogatóbbá válik. A történet lassan, de biztosan halad a tetőpont felé, miközben az olvasóban fokozódik a nyugtalanság.\r\nA ragyogás nem csupán egy rémtörténet. Mély témákat érint, mint az emberi psziché törékenysége, a függőség hatásai, a családi kötelékek ereje és a múlt árnyainak súlya. A szálloda nemcsak egy helyszín, hanem egy metafora is: a bűnök, a megbánás és az emberi gyengeségek tükörképe. King a pszichológiai rémületet mesterien keveri a természetfeletti elemekkel, miközben szinte észrevétlenül bevonja az olvasót a Torrance család drámájába.', 'shining.jpg', 9),
(18, 11, 'A három testőr', 'Majtényi Zoltán', 'Könyvmolyképző kiadó', '', 304, 2005, 'Kötött', '9639492493', 'A három testőr Alexandre Dumas 1844-ben megjelent történelmi kalandregénye, amely a 17. századi Franciaországban játszódik. A történet fiatal főhőse, D\'Artagnan, Párizsba utazik, hogy testőr lehessen. Útja során három legendás testőrrel – Athosszal, Porthosszal és Aramisszal – barátságot köt. Négyük mottója: \"Egy mindenkiért, mindenki egyért!\"\r\n', 'A fiatal és ambiciózus D\'Artagnan Gascony tartományából indul Párizsba, hogy a király testőrei közé álljon. Az ifjú hamarosan összebarátkozik három legendás testőrrel: Athosszal, a komoly és titokzatos vezérrel; Porthosszal, az életvidám és kissé hiú harcossal; valamint Aramisszal, a művelt és visszafogott testőrrel. Négyük barátsága, amely a „mindenki egyért, egy mindenkiért” elvén alapul, a történet szívét képezi.\r\nA könyv középpontjában a becsület, a hűség és az igaz barátság áll. A testőrök nemcsak egymás mellett állnak a harcokban, hanem közösen szállnak szembe az őket fenyegető intrikákkal és veszélyekkel. Eközben a regény bemutatja a francia királyi udvar fényűző, de ármányokkal teli világát, ahol minden tettnek politikai következményei vannak.\r\nA történet egyik fő konfliktusa a királyt és az országot veszélyeztető politikai játszmák köré szerveződik. A testőrök egyre mélyebben keverednek bele a kardinalista és royalista pártok közötti hatalmi harcokba, miközben olyan rejtélyes és veszélyes ellenfelekkel kerülnek szembe, mint a manipulatív és kegyetlen Milady de Winter.\r\nDumas írásában különösen élvezetes a cselekmény dinamizmusa: a párbajok, menekülések és rejtélyek egymást követik, mindezt színes karakterek és feszes párbeszédek egészítik ki. Bár a történet a francia történelem valós alakjain és eseményein alapul, a szerző szabadon alakította a történelmi hátteret, hogy fokozza a drámai hatást.', 'haromtestor.jpg', 8),
(19, 12, 'Egy gésa emlékiratai', 'Nagy Imre', 'Trivium Kiadó Kft.', '', 448, 2014, 'Keménytáblás', '9786156346230', 'Arthur Golden: Egy gésa emlékiratai című regénye egy magával ragadó történet, amely egy fiatal lány életének alakulását mutatja be Japán 20. századi gésavilágában. A történet Sayuri, egy híres gésa szemszögéből tárul elénk, aki idős korában emlékszik vissza életének meghatározó eseményeire. A könyv fikciós mű, de alapos kutatómunkán alapul, és Golden mélyrehatóan mutatja be a gésák kultúráját, mindennapjait és a mögöttük rejlő társadalmi rendszert.', 'A regény kezdetén egy szegény halászfaluban élő kislány, Chiyo, akit szépsége és különleges kék szeme különlegessé tesz, elkerül otthonából, és egy kiotói gésaházba kerül. A gésává válás folyamata rendkívül szigorú: a fiatal lányok hosszú éveken keresztül tanulják a művészeteket, az etikettet és a társasági viselkedést. Sayuri, a felnőtt Chiyo új neve, kivételes tehetséggel és kitartással építi fel karrierjét, miközben az élet nehézségeivel és a riválisokkal is meg kell küzdenie.\r\nA könyv központi témája a túlélés, az önállóság és a kitartás, ahogyan Sayuri küzd, hogy helyet találjon a világban, amely nem mindig kedvez neki. Ezen kívül a regény bemutatja a japán kultúra egyedülálló, nyugati szemmel nézve gyakran misztikus aspektusait. A gésák világát nemcsak a művészetek és a társadalmi rang szabályozza, hanem a szerelem, a sors és a hatalom szövevénye is.\r\nGolden írásmódja részletes, szinte lírai, amely lehetővé teszi az olvasó számára, hogy elmerüljön a gésák kifinomult és szépséggel teli, de ugyanakkor kegyetlen világában. A könyv érzelmekkel telített, egyensúlyozva a remény, a küzdelem és az elkerülhetetlen változás között.\r\nA regény hátterében a japán történelem és a második világháború hatásai is megjelennek, amelyek meghatározzák Sayuri életét és Japán társadalmi átalakulásait. Az író kutatásait egy valódi gésa, Mineko Iwasaki élményei is inspirálták, aki betekintést nyújtott ebbe a titokzatos világba.', 'gesa.jpg', 9),
(20, 13, '2001 Űrodisszeia', 'Göncz Árpád', 'Metropolis Media Group', '', 264, 2015, 'Puhatáblás', '9786155508073', 'Arthur C. Clarke: 2001: Űrodüsszeia egy időtlen sci-fi klasszikus, amely az emberiség fejlődésének és az univerzum rejtélyeinek mélyebb vizsgálatára hív. A történet szövevényesen fonódik össze filozófiai kérdésekkel, a mesterséges intelligenciával, az űrkutatással és az emberi sors tágabb értelmezésével.', 'A regény több idősíkon keresztül vezeti az olvasót. A korai fejezetekben az emberi evolúció hajnalát követhetjük, ahol egy titokzatos fekete monolit jelenik meg, amely rejtélyes módon elősegíti az intelligencia fejlődését. Ez a misztikus elem később az emberiség űrbéli törekvéseinek középpontjába kerül.\r\nAz események fő szála a 2000-es években játszódik, ahol a Földön és az űrben már fejlett technológiát alkalmaznak. Egy monolit felfedezése a Holdon felkelti az érdeklődést, és egy grandiózus űrexpedíciót indítanak a Jupiter irányába. Az űrhajó, a Discovery One fedélzetén néhány asztronauta dolgozik, akiknek társasága HAL-9000, egy fejlett mesterséges intelligencia, amely az űrhajó irányításáért felelős.\r\nA könyv központi témái közé tartozik az emberiség helye az univerzumban, az intelligencia fejlődése, valamint a technológia és az ember kapcsolatának törékeny egyensúlya. A mesterséges intelligencia, HAL-9000 szerepe különösen hangsúlyos, mivel Clarke azt vizsgálja, hogyan válhatnak az emberek által létrehozott gépek az alkotóik fölé.\r\nA monolit szimbolikus jelentőséggel bír: a felfedezés, az ismeretlen és az emberi fejlődés metaforájaként szolgál, miközben egy mélyebb, kozmikus rejtélyt hordoz, amely az egész történet mozgatórugója.\r\nClarke írói stílusa részletes és tudományosan megalapozott, amely a regény alapvető hitelességét adja. Az olvasó számára egyaránt lenyűgöző a regény technológiai jövőképe és az a mód, ahogyan a szerző a tudományos ismereteket összekapcsolja a fikcióval. A szövegben filozófiai elmélkedések és a csillagászat iránti mély tisztelet is megjelenik, ami az olvasót gondolkodásra ösztönzi.', 'odyssey.jpg', 10);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `loan_start_date` date NOT NULL,
  `return_date` date NOT NULL,
  `return_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `cart_items_books`
--

CREATE TABLE `cart_items_books` (
  `book_id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `db` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `categories`
--

CREATE TABLE `categories` (
  `categories_id` int(11) NOT NULL,
  `categories_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `categories`
--

INSERT INTO `categories` (`categories_id`, `categories_name`) VALUES
(1, 'Fantasy'),
(2, 'RomCom(Romantikus Vígjáték)'),
(3, 'Romantikus dráma'),
(4, 'Filozófiai regény'),
(5, 'Krimi'),
(6, 'Ifjúsági regény'),
(7, 'Disztópikus irodalom'),
(8, 'Történelmi regény'),
(9, 'Horror'),
(10, 'Sci-fi');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `date` varchar(70) NOT NULL,
  `description` text NOT NULL,
  `img` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `events`
--

INSERT INTO `events` (`id`, `name`, `date`, `description`, `img`) VALUES
(3, 'Dedikálás és beszélgetés Varró Dániellel', '2025. Május 23. 14:00', 'Találkozz Varró Dániellel egy dedikálással egybekötött beszélgetésen! Vers, humor és könnyed irodalmi élmény vár.', 'varro_daniel.png'),
(4, 'Informatikai alapoktatás nyugdíjasoknak - Egyszerűen és érthetően!', 'Minden szerdán délután 5-től.', 'Ismerje meg az informatika alapjait könnyen és érthetően! Nyugdíjasoknak szóló gyakorlati oktatás türelemmel és támogatással.', 'infalapokt.png'),
(5, 'Szeged-menti Történetek', '2025. júniusában négy héten keresztül minden csütörtökön 4-től.', 'Tarts velünk, és fedezd fel a Szeged-menti titkokat könyveken keresztül!', 'szegedmentitortenetek.png');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `events_items`
--

CREATE TABLE `events_items` (
  `user_id` int(11) NOT NULL,
  `events_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `expired_books`
--

CREATE TABLE `expired_books` (
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `rating` int(1) NOT NULL,
  `review_text` text NOT NULL,
  `review_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `registration_date` datetime NOT NULL DEFAULT current_timestamp(),
  `phone` varchar(20) NOT NULL,
  `city` varchar(30) NOT NULL,
  `postalcode` int(10) NOT NULL,
  `address` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `middle_name`, `last_name`, `registration_date`, `phone`, `city`, `postalcode`, `address`, `email`, `password`, `is_active`) VALUES
(1, 'Ákos', '', 'Jernei', '2024-12-02 00:00:00', '+36 20 325 1764', 'Makó', 6900, 'Kígyó utca 11.', 'jernei.akos-2020@keri.mako.hu', '1234Aa', 1);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`author_id`);

--
-- A tábla indexei `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `blog_descriptions`
--
ALTER TABLE `blog_descriptions`
  ADD PRIMARY KEY (`id`,`blog_id`);

--
-- A tábla indexei `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `categories_id` (`categories_id`);

--
-- A tábla indexei `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `book_id` (`book_id`);

--
-- A tábla indexei `cart_items_books`
--
ALTER TABLE `cart_items_books`
  ADD PRIMARY KEY (`book_id`,`cart_id`);

--
-- A tábla indexei `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categories_id`);

--
-- A tábla indexei `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `events_items`
--
ALTER TABLE `events_items`
  ADD PRIMARY KEY (`user_id`,`events_id`);

--
-- A tábla indexei `expired_books`
--
ALTER TABLE `expired_books`
  ADD PRIMARY KEY (`book_id`,`user_id`);

--
-- A tábla indexei `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `book_id` (`book_id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `authors`
--
ALTER TABLE `authors`
  MODIFY `author_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT a táblához `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `blog_descriptions`
--
ALTER TABLE `blog_descriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT a táblához `books`
--
ALTER TABLE `books`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT a táblához `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `categories`
--
ALTER TABLE `categories`
  MODIFY `categories_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT a táblához `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
