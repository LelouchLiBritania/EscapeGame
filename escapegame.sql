-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2018 at 06:14 PM
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
(1, '- Cliquez sur le réveil pour réveiller la coloc', 2, 1, -1, 'click', 0, 0.1, 1, 0, 'dispcarte', ''),
(2, '- Trouvez la clé de la coloc\' pour fermer la maison avant de partir.', 3, 2, 3, 'superposition', 0, 0, 0, 0, 'addinv', 'dispcarte'),
(3, '- Prenez la voiture au parking.', 4, 4, -1, 'click', 0, 0.1, 0, 0, 'tp', ''),
(4, '- Rejoignez le centre IGN à Forcalquier.', 5, 5, -1, 'click', 0, 0.1, 0, 0, 'dispcarte', ''),
(5, '- Trouvez une carte mère dans Forcalquier.', 6, 6, -1, 'click', 0, 10, 0, 0, 'addinv', ''),
(6, '- Trouvez un boîtier pour votre GPS.', 7, 7, 8, 'click', 0, 20, 0, 10, 'dispcarte', 'addinv'),
(7, '- Trouvez une antenne pour votre GPS.', 8, 14, 9, '\"click\"', 0, 50, 0, 0, 'dispcarte', 'addinv');

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
  `zoom_affichage` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `objet`
--

INSERT INTO `objet` (`id`, `name`, `image`, `lat`, `lon`, `descriptif`, `indice`, `zoom_affichage`) VALUES
(1, 'reveil', 'images/alarme.png', 44.0085, 5.79356, 'Le reveil de la coloque, il a le pouvoir de reveiller quiconque l\'entend...pour mieux se rendormir ensuite.....', 'Clique sur le réveil pour reveiller la coloque', 18),
(2, 'cle', 'images/cles.png', 44.00848, 5.7936, 'Les clés de la coloc, utile pour ne pas se faire voler, ou disputer par Marie.', 'Les clés servent souvent à fermer et ouvrir des choses, comme une porte par exemple.', 22),
(3, 'porte', 'images/door_open.png', 44.00848, 5.79357, 'UNE PORTE!!! ON PEUT FAIRE DES CHOOSES GROS!!!', 'Voilà une porte qui a besoin d\'une clé pour être fermée...sinon Marie va gueuler.', 18),
(4, 'voiture', 'images/voiture.png', 44.00803, 5.79414, 'Le trajet dans celle de Marie coûte exactement 0.25 centimes. Sinon y\'a celle de Florent, c\'est gratuit et ça va plus vite!', 'Le parking est au sud de la coloc\'.', 18),
(5, 'Portail', 'images/portail.png', 43.96202, 5.77388, 'Le portail est fermé on dirait. Vous êtes en avance. Seul pageot pourrait vous aider.', 'Je vous ouvre ce portail, vous en faites pas!', 18),
(6, 'carte_mere', 'images/carte_mere.png', 43.95946, 5.78067, 'Une carte pour programmer des instructions dans un appareil électrique.', 'J\'ai entendu dire qu\'il y aurait un stand d\'électronique au marché de Forca. C\'est sur la place du Bourget.', 22),
(7, 'Cliente', 'images/pnj.png', 43.95867, 5.7808, 'Cette personne a l\'air de connaître la région.', 'Le glacier saint-michel attire beaucoup de monde. Peut-être que vous y croiserez quelqu\'un qui peut vous aider?', 22),
(8, 'Boitier', 'images/boitier', 43.95739, 5.80007, 'Un boîtier qui servira de protection pour vos composants du GPS.', 'SIMC possède beaucoup de variété de matériaux. Mais en cherchant bien, vous devriez trouver un boîtier sans problème.', 22),
(9, 'Habitant', 'images/pnj.png', 43.95775, 5.78279, 'Quelqu\'un qui pourrait vous aider.', 'La citadelle est le lieu de promenade favoris des habitants de la ville. Quelqu\'un vous aidera peut-être là-bas.', 20),
(10, 'etape1', 'images/vue.png', 43.95724, 5.78251, 'C\'est la première étape du chemin.', '', 20),
(11, 'etape2', 'images/vue.png', 43.957, 5.78149, 'C\'est la deuxième étape du chemin.', '', 20),
(12, 'etape3', 'images/vue.png', 43.95711, 5.78187, 'C\'est la dernière étape du chemin.', '', 20),
(13, 'table_orientation', 'images/tab_ori.png', 43.95704, 5.78211, 'Cette table pourrait vous aider.', 'Il y a une table d\'orientation au sommet de la citadelle.', 22),
(14, 'antenne', 'images/antenne.png', 44.04676, 5.77593, 'Une antenne pour capter les ondes des satellites. Très utile pour un GPS.', 'La gendarmerie de St-Etienne-les-Orgues pourrait effectivement posséder une antenne, vu la proximité avec le sommêt de Lure.', 22);

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
(3, 5);

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
(1, 'Forcalquier', 43.9585, 5.7814, 'images/Forcalquier.png'),
(2, 'Fontienne', 44.00866, 5.79394, 'images/Fontienne.png'),
(3, 'Saint-Etienne-Les-Orgues', 44.0453, 5.7801, 'images/St-Etienne-orgues.png'),
(4, 'Ongle', 44.0277, 5.7337, 'images/Ongle.png'),
(5, 'Banon', 44.0382, 5.6285, 'images/Banon.png'),
(6, 'Oppedette', 43.935, 5.5906, 'images/Oppedette.png'),
(7, 'Dauphin', 43.8984, 5.7831, 'images/Dauphin.png'),
(8, 'Mane', 43.9382, 5.7685, 'images/Mane.png'),
(9, 'Lurs', 43.9695, 5.8895, 'images/Lurs.png'),
(10, 'Oraison', 43.917, 5.9189, 'images/Oraison.png'),
(11, 'Les Mées', 44.0301, 5.9738, 'images/Mees.png');

--
-- Indexes for dumped tables
--

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
