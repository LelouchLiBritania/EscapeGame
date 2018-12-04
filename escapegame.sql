-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 04, 2018 at 08:53 PM
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
  `destobj2` varchar(45) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `objectif`
--

INSERT INTO `objectif` (`id`, `intitule`, `objectif_suivant`, `objet1`, `objet2`, `evenement_de_reussite`, `victoire`, `gain`, `debut`, `bonus`, `destobj1`, `destobj2`) VALUES
(1, '- Cliquez sur le réveil pour réveiller la coloc', 2, 1, -1, 'validation', 0, 0, 1, 0, 'dispcarte', ''),
(2, '- Trouvez la clé de la coloc\' pour fermer la maison avant de partir.', 3, 2, 3, 'superposition', 0, 0, 0, 0, 'addinv', 'dispcarte'),
(3, '- Prenez la voiture au parking.', 4, 4, -1, 'click', 0, 0, 0, 0, 'tp', ''),
(4, '- Rejoignez le centre IGN à Forcalquier.', 5, 5, -1, 'click', 0, 0, 0, 0, 'dispcarte', ''),
(5, '- Trouvez une carte mère dans Forcalquier.', 6, 6, -1, 'click', 0, 1, 0, 0, 'addinv', ''),
(8, '- Assemblez le GPS au centre IGN.', 801, 15, 16, 'superposition', 0, 10, 0, 0, 'dispcarte', 'addcarte'),
(6, '- Trouvez un boîtier pour votre GPS.', 7, 8, 7, 'click', 0, 2, 0, 0, 'addinv', 'dispcarte'),
(7, '- Trouvez une antenne pour votre GPS.', 8, 14, 9, 'click', 0, 5, 0, 0, 'addinv', 'dispcarte'),
(10, '- Emmenez votre GPS aux mourres.', 11, 4, -1, 'click', 0, 2, 0, 0, 'tp', ''),
(9, '- Programmez votre carte mère.', 10, 16, -1, 'validation', 0, 10, 0, 0, 'addinv', ''),
(11, '- Triangulez votre position.', 12, 16, -1, 'superposition', 0, 5, 0, 0, '', ''),
(12, '- Retournez au centre IGN.', 13, -1, -1, 'click', 0, 0, 0, 0, '', ''),
(13, '- Faites au moins quatre autres mesures GPS dans d\'autres secteurs de la région de Forcalquier.', 14, -1, -1, 'validation', 0, 10, 0, 0, '', ''),
(15, '- Présentez votre projet au centre.', -1, -1, -1, 'validation', 1, 10, 0, 0, '', ''),
(14, '- Analysez vos données GPS une fois que vous pensez en avoir suffisamment.', 15, -1, -1, 'validation', 0, 10, 0, 0, '', ''),
(801, '', 802, 6, 15, 'superposition', 0, 0, 0, 0, 'dispinv', ''),
(802, '', 803, 8, 15, 'superposition', 0, 0, 0, 0, 'dispinv', ''),
(803, '', 9, 14, 15, 'superposition', 0, 0, 0, 0, 'dispinv', 'dispcarte'),
(1301, '', 0, -1, -1, 'validation', 0, 10, 0, 1, '', ''),
(1302, '', 0, -1, -1, 'validation', 0, 10, 0, 1, '', ''),
(1303, '', 0, -1, -1, 'validation', 0, 10, 0, 1, '', ''),
(1304, '', 0, -1, -1, 'validation', 0, 10, 0, 1, '', ''),
(1305, '', 0, -1, -1, 'validation', 0, 10, 0, 1, '', ''),
(1306, '', 0, -1, -1, 'validation', 0, 10, 0, 1, '', ''),
(1309, '', 0, -1, -1, 'validation', 0, 10, 0, 1, '', ''),
(1308, '', 0, -1, -1, 'validation', 0, 10, 0, 1, '', ''),
(1307, '', 0, -1, -1, 'validation', 0, 10, 0, 1, '', ''),
(1001, '', 0, 1001, -1, 'click', 0, 0, 0, 1, 'addinv', ''),
(1002, '', 0, 1002, -1, 'click', 0, 0, 0, 1, 'addinv', ''),
(1003, '', 0, 1003, -1, 'click', 0, 0, 0, 1, 'addinv', ''),
(1004, '', 0, 1004, -1, 'click', 0, 0, 0, 1, 'addinv', ''),
(1005, '', 0, 1005, -1, 'click', 0, 0, 0, 1, 'addinv', '');

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
(6, 'carte', 'images/cartemere.png', 43.95946, 5.78067, 'Une carte pour programmer des instructions dans un appareil électrique.', 'J\'ai entendu dire qu\'il y aurait un stand d\'électronique au marché de Forca. C\'est sur la place du Bourget.', 22, 1),
(7, 'Cliente', 'images/pnj.png', 43.95867, 5.7808, 'Le SMIC matériaux vend beaucoup d\'objets de bricolage. Vous devriez y trouver un boitier là-bas.', 'Le glacier saint-michel attire beaucoup de monde. Peut-être que vous y croiserez quelqu\'un qui peut vous aider?', 22, 1),
(8, 'Boitier', 'images/boitier.png', 43.95739, 5.80007, 'Un boîtier qui servira de protection pour vos composants du GPS.', 'SIMC possède beaucoup de variété de matériaux. Mais en cherchant bien, vous devriez trouver un boîtier sans problème.', 22, 1),
(9, 'Habitant', 'images/pnj.png', 43.95775, 5.78279, 'On raconte qu\'il est impossible de se perdre au sommet de la citadelle. Les étapes sur le chemin vous indiqueront où regarder.', 'La citadelle est le lieu de promenade favoris des habitants de la ville. Quelqu\'un vous aidera peut-être là-bas.', 20, 1),
(10, 'etape1', 'images/vue.png', 43.95724, 5.78251, '<img src= \"images/citadelle_1.png\" />', '', 20, 1),
(11, 'etape2', 'images/vue.png', 43.957, 5.78149, '<img src= \"images/citadelle_2.png\" />', '', 20, 1),
(12, 'etape3', 'images/vue.png', 43.95711, 5.78187, '<img src= \"images/citadelle_3.png\" />', '', 20, 1),
(13, 'tableorientation', 'images/tab_ori.png', 43.95704, 5.78211, '<img src= \"images/Table_orientation.png\" />', 'Il y a une table d\'orientation au sommet de la citadelle.', 22, 1),
(14, 'antenne', 'images/antenne.png', 44.04676, 5.77593, 'Une antenne pour capter les ondes des satellites. Très utile pour un GPS.', 'La gendarmerie de St-Etienne-les-Orgues pourrait effectivement posséder une antenne, vu la proximité avec le sommêt de Lure.', 22, 3),
(15, 'Table', 'images/table.png', 43.96261, 5.77402, 'Une table de travail pour assembler vos composants.', '', 21, 1),
(16, 'GPS', 'images/GPS.png', 43.96263, 5.77408, 'Votre GPS low-cost est enfin assemblé, il reste plus qu\'a programmer la carte de comande.', '', 21, 1),
(1001, 'bouteille1', 'images/bouteille.png', 44.00799, 5.79398, 'Le champion a laissé traîner ses bouteilles. Récupérez les toutes pour obtenir un bonus.', '', 22, 2),
(1005, 'bouteille5', 'images/bouteille.png', 43.97829, 5.77153, 'Une autre bouteille!', '', 22, 1),
(1002, 'bouteille2', 'images/bouteille.png', 44.1236, 5.7912, 'Une autre bouteille!', '', 20, 3),
(1003, 'bouteille3', 'images/bouteille.png', 44.03838, 5.62858, 'Une autre bouteille!', '', 21, 5),
(1004, 'bouteille4', 'images/bouteille.png', 43.93383, 5.58578, 'Une autre bouteille!', '', 22, 6),
(17, 'demineur', 'images/demineur.png', 43.97968, 5.77392, '- Il va falloir trouver où placer le GPS pour capter au mieux les satellites.', '', 18, 1);

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
(8, 16),
(10, 17);

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
