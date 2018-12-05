-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 05, 2018 at 07:53 PM
-- Server version: 5.7.17
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `escapegame`
--

-- --------------------------------------------------------

--
-- Table structure for table `ennigmes`
--

CREATE TABLE `ennigmes` (
  `id` int(11) NOT NULL,
  `objectif` int(11) NOT NULL,
  `message` varchar(300) NOT NULL,
  `reponse` varchar(45) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ennigmes`
--

INSERT INTO `ennigmes` (`id`, `objectif`, `message`, `reponse`) VALUES
(1, 9, 'Le Xème jour du Yème mois de l’année 1900 + Z, un bateau ayant U hélices, V cheminées et W hommes d’équipage est lancé.\r\nSachant que le produit UVWXYZ ajouté de la racine cubique de l’âge du capitaine (qui est grand-père) est égal à 4002331, de combien d\'hommes est composé l\'équipage?', '101'),
(3, 1301, 'Où est la mine?\r\n*- - - - -*\r\n|0 1 1 2 1|\r\n|0 1 X A X|\r\n|1 2 1 B 1|\r\n|C D E F 0|\r\n*- - - - -*\r\nLes chiffres indiquent le nombre de mines voisines, le X les mines déjà trouvées.', 'C'),
(4, 1302, 'Où est la mine?\r\n*- - - - - -*\r\n|0 0 2 2 2 1|\r\n|1 1 2 X X A|\r\n|B X D 3 X 2|\r\n|1 1 1 1 2 E|\r\n|0 0 0 0 1 F|\r\n*- - - - - -*\r\nLes chiffres indiquent le nombre de mines voisines, le X les mines déjà trouvées.', 'F');

-- --------------------------------------------------------

--
-- Table structure for table `loggin`
--

CREATE TABLE `loggin` (
  `Log` varchar(45) NOT NULL,
  `Best` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loggin`
--

INSERT INTO `loggin` (`Log`, `Best`) VALUES
('Le champion', 15),
('Marie', 17),
('Zacharie', 14);

-- --------------------------------------------------------

--
-- Table structure for table `objectif`
--

CREATE TABLE `objectif` (
  `id` int(11) NOT NULL,
  `intitule` varchar(300) NOT NULL,
  `objectif_suivant` int(11) NOT NULL,
  `objet1` int(11) NOT NULL,
  `objet2` int(11) NOT NULL,
  `evenement_de_reussite` varchar(45) NOT NULL,
  `victoire` tinyint(1) NOT NULL,
  `gain` double NOT NULL,
  `debut` tinyint(1) DEFAULT NULL,
  `bonus` tinyint(1) DEFAULT NULL,
  `destobj1` varchar(45) NOT NULL,
  `destobj2` varchar(45) NOT NULL,
  `indice` varchar(300) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `objectif`
--

INSERT INTO `objectif` (`id`, `intitule`, `objectif_suivant`, `objet1`, `objet2`, `evenement_de_reussite`, `victoire`, `gain`, `debut`, `bonus`, `destobj1`, `destobj2`, `indice`) VALUES
(1, '- Cliquez sur le réveil pour réveiller la coloc', 2, 1, -1, 'click', 0, 0, 1, 0, 'dispcarte', '', 'Clique sur le réveil pour réveiller la colloque.'),
(2, '- Trouvez la clé de la coloc\' pour fermer la maison avant de partir.', 3, 2, 3, 'superposition', 0, 0, 0, 0, 'addinv', 'dispcarte', 'Zoomez au maximum près de la porte pour faire apparaître la clé. Ensuite ouvrez l\'inventaire et glissez-là sur la porte.'),
(3, '- Prenez la voiture au parking.', 4, 4, -1, 'click', 0, 0, 0, 0, 'tp', '', 'La voiture devrais se trouver sur le parking au sud. Une fois que vous avez cliqué dessus, cliquez sur Forcalquier dans la liste des villes pour vous y rendre.'),
(4, '- Rejoignez le centre IGN à Forcalquier.', 5, 5, -1, 'click', 0, 0, 0, 0, 'dispcarte', '', 'Je vais vous ouvrir le portail.'),
(5, '- Trouvez une carte mère dans Forcalquier.', 6, 6, -1, 'click', 0, 1, 0, 0, 'addinv', '', 'J\'ai entendu dire qu\'il y aurait un stand d\'électronique au marché de Forca. C\'est sur la place du Bourget.'),
(8, '- Assemblez le GPS au centre IGN.', 801, 6, 15, 'superposition', 0, 10, 0, 0, 'dispinv', '', 'Glissez dans le bon ordre les objets sur la table.'),
(6, '- Trouvez un boîtier pour votre GPS.', 7, 8, 7, 'click', 0, 2, 0, 0, 'addinv', 'dispcarte', 'Le glacier saint-michel attire beaucoup de monde. Peut-être que vous y croiserez quelqu\'un qui peut vous aider?'),
(7, '- Trouvez une antenne pour votre GPS.', 8, 14, 9, 'click', 0, 5, 0, 0, 'addinv', 'dispcarte', 'Regardez bien les images, un indice doit être caché de chacune d\'elle.'),
(10, '- Faites une acquisition aux mourres', 11, 16, 1103, 'click', 0, 5, 0, 0, '', '', 'Un des rochers doit être plus adapté pour réaliser nos mesures.'),
(9, '- Programmez votre carte mère.', 10, 16, -1, 'validation', 0, 10, 0, 0, 'addinv', '', 'Les chiffres premiers permettent des décompositions intéressantes. Voyez si on ne peut pas trouver l\'âge du capitaine facilement d\'abord.'),
(12, '- Retournez au centre IGN.', 13, -1, -1, 'click', 0, 0, 0, 0, '', '', ''),
(13, '- Faites au moins quatre autres mesures GPS dans d\'autres secteurs de la région de Forcalquier.', 1301, 16, -1, 'validation', 0, 10, 0, 0, '', '', ''),
(15, '- Présentez votre projet au centre.', -1, -1, -1, 'validation', 1, 10, 0, 0, '', '', ''),
(14, '- Analysez vos données GPS une fois que vous pensez en avoir suffisamment.', 15, -1, -1, 'validation', 0, 10, 0, 0, '', '', ''),
(801, '', 802, 8, 15, 'superposition', 0, 0, 0, 0, 'dispinv', '', ''),
(802, '', 803, 14, 15, 'superposition', 0, 0, 0, 0, 'dispinv', '', ''),
(803, '', 9, 15, 16, 'click', 0, 0, 0, 0, 'dispcarte', 'addinv', ''),
(1301, '', 1302, -1, -1, 'validation', 0, 10, 0, 0, '', '', ''),
(1302, '', 1303, -1, -1, 'validation', 0, 10, 0, 0, '', '', ''),
(1303, '', 1304, -1, -1, 'validation', 0, 10, 0, 0, '', '', ''),
(1304, '', 1305, -1, -1, 'validation', 0, 10, 0, 0, '', '', ''),
(1305, '', 1306, -1, -1, 'validation', 0, 10, 0, 0, '', '', ''),
(1306, '', 1307, -1, -1, 'validation', 0, 10, 0, 0, '', '', ''),
(1309, '', 14, -1, -1, 'validation', 0, 10, 0, 0, '', '', ''),
(1308, '', 1309, -1, -1, 'validation', 0, 10, 0, 0, '', '', ''),
(1307, '', 1308, -1, -1, 'validation', 0, 10, 0, 0, '', '', ''),
(1001, '', 0, 1001, -1, 'click', 0, 3, 0, 1, 'addinv', '', ''),
(1002, '', 0, 1002, -1, 'click', 0, 3, 0, 1, 'addinv', '', ''),
(1003, '', 0, 1003, -1, 'click', 0, 3, 0, 1, 'addinv', '', ''),
(1004, '', 0, 1004, -1, 'click', 0, 3, 0, 1, 'addinv', '', ''),
(1005, '', 0, 1005, -1, 'click', 0, 3, 0, 1, 'addinv', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `objet`
--

CREATE TABLE `objet` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `image` varchar(60) NOT NULL,
  `lat` double NOT NULL,
  `lon` double NOT NULL,
  `descriptif` varchar(300) NOT NULL,
  `indice` varchar(300) NOT NULL,
  `zoom_affichage` int(11) NOT NULL,
  `Ville` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `objet`
--

INSERT INTO `objet` (`id`, `name`, `image`, `lat`, `lon`, `descriptif`, `indice`, `zoom_affichage`, `Ville`) VALUES
(1, 'reveil', 'images/alarme.png', 44.0085, 5.79356, 'Le reveil de la coloque, il a le pouvoir de reveiller quiconque l\'entend...pour mieux se rendormir ensuite.....', 'Clique sur le réveil pour reveiller la coloque', 18, 2),
(2, 'cle', 'images/cles.png', 44.00848, 5.7936, 'Les clés de la coloc, utile pour ne pas se faire voler, ou disputer par Marie.', 'Les clés servent souvent à fermer et ouvrir des choses, comme une porte par exemple.', 22, 2),
(3, 'porte', 'images/door_open.png', 44.00848, 5.79357, 'Il faudrait fermer la porte à clé. Mais où sont ces fichues clés?', 'Voilà une porte qui a besoin d\'une clé pour être fermée...sinon Marie va gueuler.', 18, 2),
(4, 'voiture', 'images/voiture.png', 44.00803, 5.79414, 'Le trajet dans celle de Marie coûte exactement 0.25 centimes. Sinon y\'a celle de Florent, c\'est gratuit et ça va plus vite!', 'Le parking est au sud de la coloc\'.', 18, 2),
(5, 'Portail', 'images/portail.png', 43.96202, 5.77388, 'Le portail est fermé on dirait. Vous êtes en avance. Seul pageot pourrait vous aider.', 'Je vous ouvre ce portail, vous en faites pas!', 18, 1),
(6, 'carte', 'images/cartemere.png', 43.95946, 5.78067, 'Une carte pour programmer des instructions dans un appareil électrique.', 'J\'ai entendu dire qu\'il y aurait un stand d\'électronique au marché de Forca. C\'est sur la place du Bourget.', 20, 1),
(7, 'Cliente', 'images/pnj.png', 43.95867, 5.7808, 'Le SMIC matériaux vend beaucoup d\'objets de bricolage. Vous devriez y trouver un boitier là-bas.', 'Le glacier saint-michel attire beaucoup de monde. Peut-être que vous y croiserez quelqu\'un qui peut vous aider?', 18, 1),
(8, 'Boitier', 'images/boitier.png', 43.95739, 5.80007, 'Un boîtier qui servira de protection pour vos composants du GPS.', 'SIMC possède beaucoup de variété de matériaux. Mais en cherchant bien, vous devriez trouver un boîtier sans problème.', 21, 1),
(9, 'Habitant', 'images/pnj.png', 43.95775, 5.78279, 'On raconte qu\'il est impossible de se perdre au sommet de la citadelle. Les étapes sur le chemin vous indiqueront où regarder.', 'La citadelle est le lieu de promenade favoris des habitants de la ville. Quelqu\'un vous aidera peut-être là-bas.', 18, 1),
(10, 'etape1', 'images/vue.png', 43.95724, 5.78251, '<img src= \"images/citadelle_1.png\" style=\"width: 500px; heigth: 500px;\" />', '', 21, 1),
(11, 'etape2', 'images/vue.png', 43.957, 5.78149, '<img src= \"images/citadelle_2.png\" style=\"width: 500px; heigth: 500px;\"/>', '', 21, 1),
(12, 'etape3', 'images/vue.png', 43.95711, 5.78187, '<img src= \"images/citadelle_3.png\" style=\"width: 500px; heigth: 500px;\"/>', '', 21, 1),
(13, 'tableorientation', 'images/tab_ori.png', 43.95704, 5.78211, '<img src= \"images/Table_orientation.png\" style=\"width: 500px; heigth: 500px;\"/>', 'Il y a une table d\'orientation au sommet de la citadelle.', 20, 1),
(14, 'antenne', 'images/antenne.png', 44.04676, 5.77593, 'Une antenne pour capter les ondes des satellites. Très utile pour un GPS.', 'La gendarmerie de St-Etienne-les-Orgues pourrait effectivement posséder une antenne, vu la proximité avec le sommêt de Lure.', 19, 3),
(15, 'Table', 'images/table.png', 43.96261, 5.77402, 'Une table de travail pour assembler vos composants.', '', 20, 1),
(16, 'GPS', 'images/GPS.png', 43.96263, 5.77408, 'Votre GPS low-cost est enfin assemblé, il reste plus qu\'a programmer la carte de comande.', '', 20, 1),
(1001, 'bouteille1', 'images/bouteille.png', 44.00799, 5.79398, 'Le champion a laissé traîner ses bouteilles. Récupérez les toutes pour obtenir un bonus.', '', 22, 2),
(1005, 'bouteille5', 'images/bouteille.png', 43.97829, 5.77153, 'Une autre bouteille!', '', 22, 1),
(1002, 'bouteille2', 'images/bouteille.png', 44.1236, 5.7912, 'Une autre bouteille!', '', 18, 3),
(1003, 'bouteille3', 'images/bouteille.png', 44.03838, 5.62858, 'Une autre bouteille!', '', 21, 5),
(1004, 'bouteille4', 'images/bouteille.png', 43.93383, 5.58578, 'Une autre bouteille!', '', 22, 6),
(1305, 'gps_lurs', 'images/GPS.png', 43.97109, 5.88961, '', '', 21, 9),
(1308, 'gps_oraison', 'images/GPS.png', 43.9294, 5.9086, '', '', 20, 10),
(1301, 'gps_mane', 'images/GPS.png', 43.93796, 5.76837, '', '', 21, 8),
(1302, 'gps_oppedette', 'images/GPS.png', 43.93318, 5.58733, '', '', 22, 6),
(1303, 'gps_dauphin', 'images/GPS.png', 43.89788, 5.78912, '', '', 20, 7),
(1304, 'gps_banon', 'images/GPS.png', 44.03292, 5.63253, '', '', 20, 5),
(1306, 'gps_ongle', 'images/GPS.png', 44.02844, 5.73178, '', '', 21, 4),
(1307, 'gps_fontienne', 'images/GPS.png', 44.0099, 5.79074, '', '', 21, 2),
(1309, 'gps_mees', 'images/GPS.png', 44.02983, 5.98089, '', '', 21, 11),
(1101, 'rocher1', 'images/rocher.png', 43.97992, 5.77436, '1, je regarde 2', '', 18, 1),
(1102, 'rocher2', 'images/rocher.png', 43.97966, 5.7738, '2, je regarde 5', '', 18, 1),
(1103, 'rocher3', 'images/rocher.png', 43.97924, 5.77386, '3, je regarde 5', '', 18, 1),
(1104, 'rocher4', 'images/rocher.png', 43.97878, 5.77481, '4, je regarde 1 et 2', '', 18, 1),
(1105, 'rocher5', 'images/rocher.png', 43.97949, 5.77544, '5, je regarde 4', '', 18, 1);

-- --------------------------------------------------------

--
-- Table structure for table `objet_a_debloquer`
--

CREATE TABLE `objet_a_debloquer` (
  `id_objectif` int(11) NOT NULL,
  `id_objet` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `objet_a_debloquer`
--

INSERT INTO `objet_a_debloquer` (`id_objectif`, `id_objet`) VALUES
(1, 2),
(1, 3),
(2, 4),
(3, 5),
(4, 6),
(5, 7),
(5, 8),
(6, 9),
(6, 10),
(6, 11),
(6, 12),
(6, 13),
(6, 14),
(7, 15),
(803, 16),
(10, 1101),
(12, 1301),
(12, 1301),
(12, 1302),
(12, 1303),
(12, 1304),
(12, 1305),
(12, 1306),
(12, 1307),
(12, 1308),
(12, 1309),
(2, 1001),
(2, 1001),
(2, 1002),
(2, 1003),
(2, 1004),
(2, 1005),
(10, 1102),
(10, 1103),
(10, 1104),
(10, 1105);

-- --------------------------------------------------------

--
-- Table structure for table `trajet`
--

CREATE TABLE `trajet` (
  `Ville` varchar(45) NOT NULL,
  `Forcalquier` int(11) NOT NULL,
  `Fontienne` int(11) NOT NULL,
  `St-Etienne-les-Orgues` int(11) NOT NULL,
  `Ongle` int(11) NOT NULL,
  `Banon` int(11) NOT NULL,
  `Oppedette` int(11) NOT NULL,
  `Dauphin` int(11) NOT NULL,
  `Mane` int(11) NOT NULL,
  `Lurs` int(11) NOT NULL,
  `Oraison` int(11) NOT NULL,
  `Les_Mees` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trajet`
--

INSERT INTO `trajet` (`Ville`, `Forcalquier`, `Fontienne`, `St-Etienne-les-Orgues`, `Ongle`, `Banon`, `Oppedette`, `Dauphin`, `Mane`, `Lurs`, `Oraison`, `Les_Mees`) VALUES
('Forcalquier', 0, 10, 16, 14, 24, 35, 9, 5, 12, 17, 25),
('Fontienne', 10, 0, 7, 12, 24, 35, 19, 14, 16, 24, 28),
('St-Etienne-les-Orgues', 16, 7, 0, 6, 18, 28, 24, 17, 22, 29, 23),
('Ongle', 14, 12, 6, 0, 14, 24, 21, 14, 25, 31, 28),
('Banon', 24, 24, 18, 14, 0, 16, 25, 24, 35, 41, 40),
('Oppedette', 35, 35, 28, 24, 16, 0, 30, 31, 46, 49, 51),
('Dauphin', 9, 19, 24, 21, 25, 31, 0, 7, 21, 20, 28),
('Mane', 5, 14, 17, 14, 24, 31, 7, 0, 16, 21, 29),
('Lurs', 12, 16, 22, 25, 35, 46, 21, 16, 0, 14, 19),
('Oraison', 17, 24, 29, 31, 41, 49, 20, 21, 14, 0, 15),
('Les_Mees', 25, 28, 23, 28, 40, 51, 28, 29, 19, 15, 0);

-- --------------------------------------------------------

--
-- Table structure for table `villes`
--

CREATE TABLE `villes` (
  `id` int(11) NOT NULL,
  `Name` varchar(45) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `lat` double NOT NULL,
  `lon` double NOT NULL,
  `Image` varchar(60) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `villes`
--

INSERT INTO `villes` (`id`, `Name`, `lat`, `lon`, `Image`) VALUES
(1, 'Forcalquier', 43.96181, 5.77394, 'images/Forcalquier.png'),
(2, 'Fontienne', 44.00866, 5.79394, 'images/Fontienne.png'),
(3, 'Saint-Etienne-Les-Orgues', 44.04562, 5.77879, 'images/St-Etienne-orgues.png'),
(4, 'Ongle', 44.02672, 5.73422, 'images/Ongle.png'),
(5, 'Banon', 44.03974, 5.62985, 'images/Banon.png'),
(6, 'Oppedette', 43.93309, 5.58772, 'images/Oppedette.png'),
(7, 'Dauphin', 43.9004, 5.78385, 'images/Dauphin.png'),
(8, 'Mane', 43.9374, 5.76653, 'images/Mane.png'),
(9, 'Lurs', 43.97002, 5.88989, 'images/Lurs.png'),
(10, 'Oraison', 43.91665, 5.9185, 'images/Oraison.png'),
(11, 'Les Mées', 44.0295, 5.97592, 'images/Mees.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ennigmes`
--
ALTER TABLE `ennigmes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loggin`
--
ALTER TABLE `loggin`
  ADD PRIMARY KEY (`Log`);

--
-- Indexes for table `objectif`
--
ALTER TABLE `objectif`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `objet`
--
ALTER TABLE `objet`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trajet`
--
ALTER TABLE `trajet`
  ADD PRIMARY KEY (`Ville`);

--
-- Indexes for table `villes`
--
ALTER TABLE `villes`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
