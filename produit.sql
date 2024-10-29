-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : mysql
-- Généré le : sam. 26 oct. 2024 à 12:59
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
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id` int NOT NULL,
  `libelle` varchar(255) NOT NULL,
  `prix` decimal(6,2) NOT NULL,
  `quantite` int NOT NULL,
  `id_commande` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id`, `libelle`, `prix`, `quantite`, `id_commande`) VALUES
(1, 'Banane', '2.50', 2, 1),
(2, 'Mangue', '5.00', 2, 1),
(3, 'Poire', '3.00', 1, 1),
(4, 'Pomme', '2.00', 2, 1),
(5, 'Pomme', '3.00', 2, 2),
(6, 'Poire', '3.00', 3, 2),
(7, 'Orange', '2.00', 5, 2);

--
-- Déclencheurs `produit`
--
DELIMITER $$
CREATE TRIGGER `update_montant_paye` AFTER INSERT ON `produit` FOR EACH ROW BEGIN
-- Ici, vous devez écrire la logique de mise à jour du montant_paye 
-- Cette logique dépendra de votre structure de données et de vos calculs 
-- Voici un exemple simplifié en supposant que le montant_paye est simplement 
-- incrémenté du prix du nouveau produit pour toutes les commandes associées : 
UPDATE commande
SET montant_paye = montant_paye + NEW.prix * NEW.quantite WHERE id = NEW.id_commande; 
END
$$
DELIMITER ;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_COMMANDE_ID` (`id_commande`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `FK_COMMANDE_ID` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
