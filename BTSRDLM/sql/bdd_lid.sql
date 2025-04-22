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
(1, 'Auguy', 'Jean', '1 rue droite', '30000', 'NÃ®mes', '0485957575'),
(2, 'Baptiste', 'Jean-Luc', '7 rue courbe', '12000', 'Rodez', '0565428775'),
(3, 'Baptiste', 'Amandine', 'Avenue Foch', '12000', 'Rodez', NULL),
(4, 'Collard', 'Marie-Claire', 'Rue dâ€™Espagne', '66000', 'Perpignan', NULL),
(5, 'Durand', 'Raymond', 'Rue des oliviers', '30000', 'NÃ®mes', '0475145425');

INSERT INTO Articles (NumArt, Designation, Categorie, Prix) VALUES
(1, 'Charlie Winston', 'CD', 12),
(2, 'CamÃ©ra CafÃ©', 'DVD', 19),
(3, 'WebCam', 'Informatique', 24),
(4, 'Graveur', 'Informatique', 38),
(5, 'ClÃ© USB 16G', 'Informatique', 18);

INSERT INTO Achats (NumCli, NumArt, Date, Qte) VALUES
(1, 1, '2024-01-30', 1),
(1, 5, '2024-01-30', 4),
(4, 3, '2024-01-29', 1),
(4, 2, '2024-01-30', 2),
(5, 2, '2024-02-01', 2);

-- Afficher tous les clients de la table clients

SELECT * FROM clients;

-- Afficher le nom et le prenom des clients 
-- sous la forme nom de famille et prÃ©nom

SELECT nom AS 'Nom de famille :', prenom AS 'PrÃ©nom :'
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

-- Afficher les articles dont les prix sont supÃ©rieurs 
-- Ã&nbsp; 15 Euros

SELECT * FROM articles
WHERE prix > 15;

-- Afficher Les articles dont les prix sont compris 
-- entre 14 et 30 â‚¬

SELECT * FROM articles
WHERE prix >= 14 
AND prix <= 30 ;

-- version avec BETWEEN

SELECT * FROM articles
WHERE prix BETWEEN 14 AND 30 ; 

-- Afficher les clients qui habitent Ã&nbsp; Rodez 
-- et qui s'appellent Baptiste
SELECT * FROM clients
WHERE ville = 'Rodez'
AND nom = 'Baptiste';

-- Afficher les clients qui habitent Ã&nbsp; Rodez 
-- ou qui s'appellent Collard
SELECT * FROM clients
WHERE ville = 'Rodez'
OR nom = 'Collard';

-- Afficher les clients dont le numÃ©ro de tÃ©lÃ©phone
-- n'est pas saisi.
SELECT * FROM clients
WHERE telephone IS NULL;

-- Afficher les clients dont le numÃ©ro de tÃ©lÃ©phone
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

-- Afficher tous les clients dans l'ordre dÃ©croissant de leur nom
SELECT * FROM clients
ORDER BY nom DESC;

-- LES JOINTURES

/*
Il s'agit d'une condition permetant de combiner 
les rÃ©sultats d'une entitÃ© ou d'une relation avec
une ou plusieurs autres et de projeter le rÃ©sultat
sur le mÃªme tableau. 
*/

-- afficher le nom et prÃ©nom des clients 
-- qui ont fait un achat le 30 janvier 2024

SELECT nom, prenom, date, qte
FROM clients, achats
WHERE clients.NumCli = achats.NumCli
AND Date = '2024-01-30';

-- afficher la requete precedente avec la dÃ©signation
-- de l'article

SELECT nom, prenom, date, designation, qte
FROM clients, achats, articles
WHERE clients.NumCli = achats.NumCli
AND articles.NumArt = achats.NumArt
AND Date = '2024-01-30';

/* 
SQL offre 5 fonctions mathÃ©matiques standard
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

-- Afficher la quantitÃ© totale 
-- des produits commandÃ©es avec SUM()

SELECT SUM(qte) AS QuantitÃ©_Totale FROM achats;

-- DÃ©compte de toutes les catÃ©gories prÃ©sentes
-- dans la table articles COUNT()

SELECT COUNT(Categorie) AS CatÃ©gories 
FROM articles;

-- la même sans doublons

SELECT COUNT(DISTINCT Categorie) AS CatÃ©gories 
FROM articles;

-- Select * from clients;
-- Durant avec 't' au lieu de Durand
-- numcli = 5

UPDATE clients SET nom = 'Durant' WHERE numcli = 5;

-- 1 - modifier l'adresse du client collard afin d'y ajouter le numéro de voie = '10 rue d espagne'

UPDATE clients SET adresse = '10 rue d espagne' WHERE numcli = 4;


-- 2 - Modifier l'adresse du client 5 en '15 avenue de tourcoing'


UPDATE clients SET adresse = '15 avenue de tourcoing' WHERE numcli = 4;


-- 3 - ajouter un numéro de téléphone pour Marie-Claire Collard et changer sa ville : 75014, Paris.

UPDATE clients SET telephone = '0123456789', cp = 75014, ville = 'Paris' WHERE numcli = 4;


-- 4 - Supprimer tous les clients qui habitent Rodez


DELETE FROM clients WHERE ville = 'Rodez';

-- SAUVEGARDE ET RESTAURATION 

-- Windows :

-- ouvrir CMD en admin

-- Recruperer le chemin vers mysql.exe dans wamp

--exemple : 
CD C:\wamp\bin\mysql\mysql5.6.17\bin

-- sauvegarde : 

mysqldump -u root -p <nomdelaBDD> > save.mysql

-- version avec creation de la bdd integrée

mysqldump -u root -p --add-drop-database --databases <nomdelaBDD> > save.mysql

-- restauration : 

mysql -u root -p < save.sql 

