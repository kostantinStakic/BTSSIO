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
    Date DATE,
    Qte INT,
    PRIMARY KEY (NumCli, NumArt, Date),
    FOREIGN KEY (NumCli) REFERENCES Clients(NumCli),
    FOREIGN KEY (NumArt) REFERENCES Articles(NumArt)
);


INSERT INTO Clients (NumCli, Nom, Prenom, Adresse, Cp, Ville, Telephone) VALUES
(1, 'Auguy', 'Jean', '1 rue droite', '30000', 'Nîmes', '0485957575'),
(2, 'Baptiste', 'Jean-Luc', '7 rue courbe', '12000', 'Rodez', '0565428775'),
(3, 'Baptiste', 'Amandine', 'Avenue Foch', '12000', 'Rodez', NULL),
(4, 'Collard', 'Marie-Claire', 'Rue d’Espagne', '66000', 'Perpignan', NULL),
(5, 'Durand', 'Raymond', 'Rue des oliviers', '30000', 'Nîmes', '0475145425');

INSERT INTO Articles (NumArt, Designation, Categorie, Prix) VALUES
(1, 'Charlie Winston', 'CD', 12),
(2, 'Caméra Café', 'DVD', 19),
(3, 'WebCam', 'Informatique', 24),
(4, 'Graveur', 'Informatique', 38),
(5, 'Clé USB 16G', 'Informatique', 18);

INSERT INTO Achats (NumCli, NumArt, Date, Qte) VALUES
(1, 1, '2024-01-30', 1),
(1, 5, '2024-01-30', 4),
(4, 3, '2024-01-29', 1),
(4, 2, '2024-01-30', 2),
(5, 2, '2024-02-01', 2);

-- Afficher tous les clients de la table clients

SELECT * FROM clients;

-- Afficher le nom et le prenom des clients 
-- sous la forme nom de famille et prénom

SELECT nom AS 'Nom de famille :', prenom AS 'Prénom :'
FROM clients;

-- Afficher les noms des clients sans doublon

SELECT DISTINCT nom FROM clients;

-- LES RESTRICTIONS : 
-- Afficher les clients qui habitent Rodez

SELECT * FROM clients WHERE ville = 'Rodez';

-- Afficher tous les clients dont le nom commence par B

SELECT * FROM clients WHERE nom LIKE 'A%';

-- Afficher les clients qui habitent dans la ville 
-- qui se termine par la lettre Z

SELECT * FROM clients 
WHERE ville LIKE '%Z' 
AND nom LIKE '%B%' ;

-- Afficher les articles dont les prix sont supérieurs 
-- à 15 Euros

SELECT * FROM articles
WHERE prix > 15;

-- Afficher Les articles dont les prix sont compris 
-- entre 14 et 30 €

SELECT * FROM articles
WHERE prix >= 14 
AND prix <= 30 ;

-- version avec BETWEEN

SELECT * FROM articles
WHERE prix BETWEEN 14 AND 30 ; 

-- Afficher les clients qui habitent à Rodez 
-- et qui s'appellent Baptiste
SELECT * FROM clients
WHERE ville = 'Rodez'
AND nom = 'Baptiste';

-- Afficher les clients qui habitent à Rodez 
-- ou qui s'appellent Collard
SELECT * FROM clients
WHERE ville = 'Rodez'
OR nom = 'Collard';

-- Afficher les clients dont le numéro de téléphone
-- n'est pas saisi.
SELECT * FROM clients
WHERE telephone IS NULL;

-- Afficher les clients dont le numéro de téléphone
-- est saisi.
SELECT * FROM clients
WHERE telephone IS NOT NULL;

-- Afficher les clients qui habitent les villes 
-- de Tarbes, Aurillac et Rodez avec IN

SELECT * FROM clients
WHERE ville IN('Tarbes','Aurillac','Rodez');

-- Afficher tous les clients dans l'ordre croissant de leur nom
SELECT * FROM clients
ORDER BY nom ASC;

-- Afficher tous les clients dans l'ordre décroissant de leur nom
SELECT * FROM clients
ORDER BY nom DESC;

-- LES JOINTURES

/*
Il s'agit d'une condition permetant de combiner 
les résultats d'une entité ou d'une relation avec
une ou plusieurs autres et de projeter le résultat
sur le même tableau. 
*/

-- afficher le nom et prénom des clients 
-- qui ont fait un achat le 30 janvier 2024

SELECT nom, prenom, date, qte
FROM clients, achats
WHERE clients.NumCli = achats.NumCli
AND Date = '2024-01-30';

-- afficher la requete precedente avec la désignation
-- de l'article

SELECT nom, prenom, date, designation, qte
FROM clients, achats, articles
WHERE clients.NumCli = achats.NumCli
AND articles.NumArt = achats.NumArt
AND Date = '2024-01-30';

/* 
SQL offre 5 fonctions mathématiques standard
SUM()
COUNT()
AVG()
MIN()
MAX()
*/

-- Afficher le prix moyen des articles
-- contenus dans la table articles

SELECT AVG(prix) AS Moyenne_prix FROM articles;

-- Afficher le prix moyen des articles
-- ainsi que le prix minimum et maximum des articles

SELECT AVG(prix) AS Moyenne_prix, MIN(prix), MAX(prix) 
FROM articles;

-- Afficher la quantité totale 
-- des produits commandées avec SUM()

SELECT SUM(qte) AS Quantité_Totale FROM achats;

-- Décompte de toutes les catégories présentes
-- dans la table articles COUNT()

SELECT COUNT(Categorie) AS Catégories 
FROM articles;

-- la même sans doublons

SELECT COUNT(DISTINCT Categorie) AS Catégories 
FROM articles;

