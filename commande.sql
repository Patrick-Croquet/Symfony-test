-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : mysql
-- Généré le : sam. 26 oct. 2024 à 12:57
-- Version du serveur : 8.2.0
-- Version de PHP : 8.0.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `filrouge`
--

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id` int NOT NULL,
  `id_user` int NOT NULL,
  `date` date NOT NULL,
  `montant_paye` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id`, `id_user`, `date`, `montant_paye`) VALUES
(1, 1, '2024-09-02', '22.00'),
(2, 1, '2024-09-03', '25.00'),
(3, 1, '2024-09-04', '0.00'),
(4, 1, '2024-09-05', '0.00'),
(5, 1, '2024-09-05', '0.00'),
(6, 1, '2024-09-05', '0.00'),
(7, 1, '2024-09-05', '0.00'),
(8, 1, '2024-09-05', '0.00'),
(9, 1, '2024-09-05', '0.00'),
(10, 1, '2024-09-05', '0.00'),
(11, 1, '2024-09-16', '0.00'),
(13, 1, '2024-10-08', '0.00'),
(14, 1, '2024-10-08', '0.00'),
(15, 1, '2024-10-08', '0.00');

--
-- Déclencheurs `commande`
--
DELIMITER $$
CREATE TRIGGER `insere_montant` BEFORE INSERT ON `commande` FOR EACH ROW BEGIN
	Set new.montant_paye = "0.00";
END
$$
DELIMITER ;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_USER_ID` (`id_user`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `FK_USER_ID` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
