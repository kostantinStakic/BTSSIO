DROP DATABASE IF EXISTS LID;

CREATE DATABASE LID;

USE LID;

CREATE TABLE Clients (
    NumCli INT PRIMARY KEY,
    Nom VARCHAR(50),
    Prenom VARCHAR(50),
    Adresse VARCHAR(100),
    Cp VARCHAR(10),
    Ville VARCHAR(50),
    Telephone VARCHAR(20)
);

CREATE TABLE Articles (
    NumArt INT PRIMARY KEY,
    Designation VARCHAR(100),
    Categorie VARCHAR(50),
    Prix DECIMAL(10,2)
);

CREATE TABLE Achats (
    NumCli INT,
    NumArt INT,
    Date_achat DATE,
    Qte INT,
    PRIMARY KEY (NumCli, NumArt),
    FOREIGN KEY (NumCli) REFERENCES Clients(NumCli),
    FOREIGN KEY (NumArt) REFERENCES Articles(NumArt)
);


INSERT INTO Clients (NumCli, Nom, Prenom, Adresse, Cp, Ville, Telephone) VALUES
(1, 'Auguy', 'Jean', '1 rue droite', '30000', 'Nîmes', '0485957575'),
(2, 'Baptiste', 'Jean-Luc', '7 rue courbe', '12000', 'Rodez', '0565428775'),
(3, 'Baptiste', 'Amandine', 'Avenue Foch', '12000', 'Rodez', NULL),
(4, 'Collard', 'Marie-Claire', 'Rue d Espagne', '66000', 'Perpignan', NULL),
(5, 'Durand', 'Raymond', 'Rue des oliviers', '30000', 'Nîmes', '0475145425');

INSERT INTO Articles (NumArt, Designation, Categorie, Prix) VALUES
(1, 'Charlie Winston', 'CD', 12),
(2, 'Caméra Café', 'DVD', 19),
(3, 'WebCam', 'Informatique', 24),
(4, 'Graveur', 'Informatique', 38),
(5, 'Clé USB 16G', 'Informatique', 18);

INSERT INTO Achats (NumCli, NumArt, Date_achat, Qte) VALUES
(1, 1, '2024-01-30', 1),
(1, 5, '2024-01-30', 4),
(4, 3, '2024-01-29', 1),
(4, 2, '2024-01-30', 2),
(5, 2, '2024-02-01', 2);

-- afficher nom et prenom des clients

SELECT nom, prenom FROM clients;

-- afficher les noms

SELECT nom FROM clients;

-- afficher les noms sans les doublons

SELECT DISTINCT nom FROM clients;

-- afficher le nom d'une ou plusieur colonnes 
-- en utilisant des alias(en la rennomant)

SELECT nom AS 'Nom des clients' FROM clients;

-- Les restrictions
-- afficher les clients qui habitent
-- dans la ville de Rodez

SELECT * FROM clients
WHERE ville='Rodez';

-- afficher les habitants de Rodez sans telephone 
-- renseigné

SELECT * FROM clients
WHERE ville='Rodez'
AND Telephone IS NULL;

-- Lister les articles dont le prix est supérieur 
-- à 15

SELECT * FROM articles 
WHERE prix > 15;

/* Lister les articles dont le prix 
est compris entre 14 et 30 €
*/

SELECT * 
FROM articles 
WHERE prix >= 14
AND prix <= 30;

-- version BETWEEN

SELECT * FROM articles
WHERE prix BETWEEN 14 AND 30;

/* lister tous les clients dont le nom
est Baptiste et qui habitent à Rodez
*/

SELECT * FROM clients
WHERE nom='Baptiste'
AND ville='Rodez';

/* Lister tous les clients dont le nom
est Baptiste ou qui habitent à Perpignan
*/

SELECT * FROM clients
WHERE nom='Baptiste'
OR ville='Perpignan';

-- .... Dont le téléphone n'est pas renseigné

SELECT * FROM clients
WHERE Telephone IS NULL;

-- Pour afficher les clients habitant à Rodez et Perpignan

SELECT * FROM clients
WHERE ville IN('Rodez', 'Perpignan');

-- Connaitre les clients dont la premiere lettre 
-- du nom de famille est B 
/* (commence LIKE 'B%', 
    se termine LIKE '%B', 
    contient LIKE '%B%')
*/

SELECT * FROM clients
WHERE nom LIKE 'B%';

-- afficher tous les clients dont le nom contient la lettre A

SELECT * FROM clients
WHERE nom LIKE '%A%';

-- Afficher la requete au dessus juste 
-- avec les noms, et remplacer nom par nom de famille 

SELECT nom AS 'Nom des clients'
FROM clients
WHERE nom LIKE '%L%';

-- tri croissant ASC

SELECT designation from articles
ORDER BY designation ASC;

-- tri croissant DESC

SELECT designation from articles
ORDER BY designation DESC;

/*
LES JOINTURES :
La jointure est l'opération consistant à rapprocher
selon un condition, les tuples de deux relations
R1 et R2 afin de former une troisième relation R3 
qui contient l'ensemble de tous les tuples obtenus
en concatenant un tuple R1 avec un tuple R2 vérifiant
la condition de rapprochement.
*/

-- afficher le nom et prénom des clients ayant
-- acheté un article le 30 janvier 2024 (2024-01-30)

SELECT nom, prenom, Date_achat
FROM Clients, Achats
WHERE clients.NumCli = achats.NumCli
AND Date_achat = '2024-01-30';

-- afficher le nom, prénom des clients 
-- date de commande, quantité
-- et désignation des articles achetés sur le site

SELECT nom, prenom, designation, Date_achat, qte
FROM clients, achats, articles
WHERE clients.NumCli = achats.NumCli
AND achats.NumArt = articles.NumArt;

-- afficher la quantité de produit commandé par personne

SELECT designation, qte, nom, prenom
FROM clients cli, articles art, achats ach
WHERE cli.NumCli = ach.NumCli
AND art.NumArt = ach.NumArt;

-- Révision :

/* nom et prénoms et cp des clients qui habitent 
à RODEZ
*/

SELECT nom, prenom, cp
FROM clients
WHERE ville = 'Rodez';

/* les articles dont le prix est compris entre 
15 et 40 euros, (2 méthodes)
*/

-- 1 : avec < et > 
SELECT * FROM articles WHERE prix >= 15
AND prix <= 40;

-- 2 : avec BETWEEN
SELECT * FROM articles WHERE prix BETWEEN 15 AND 40;

SELECT * FROM articles WHERE prix BETWEEN 15 AND 40
ORDER BY designation DESC;

/* Liste des articles dont la désignation 
commence par la lettre C */

SELECT * FROM articles WHERE designation LIKE 'C%';

-- 1 Calculer et afficher le prix moyen des articles :
SELECT AVG(prix) AS prix_moyen FROM articles;

-- 2 Calculer et afficher le prix moyen des articles, afficher le prix minimum et le prix maximum :
SELECT AVG(prix) AS prix_moyen, MIN(prix) AS Minimum, MAX(prix) AS Maximum
FROM articles;

-- 3 Afficher la somme de toutes les quantités achetées :
SELECT SUM(qte) AS Total FROM achats;
 
-- 4 Compter et afficher le nombre de catégories :
SELECT COUNT(Categorie) FROM articles;
 
-- 5 Compter et afficher le nombre de catégories sans doublons :
SELECT COUNT(DISTINCT Categorie) FROM articles;

-- 6 Faire la somme et afficher les quantités totales 
-- des achats réalisés pour l’article numéro 3 :
SELECT SUM(qte) AS 'Quantité total'
FROM achats
WHERE NumArt = 3;

