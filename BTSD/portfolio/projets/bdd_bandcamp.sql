/*
MLD
utilisateur(id_utilisat,nom_utilisat,prenom_utilisat,mail_utilisat,mdp_utilisat)
playlist(id_playlist,nom_playlist)
chanson(id_chan,artiste_chan,titre_chan,date_sortie_chan,prix_chan)
album(id_album,artiste_album,titre_album,date_sortie_album,prix_album)
commande(id_com,date_com,id_utilisat)
creation_playlist(id_utilisat,id_playlist)
selection_chanson_playlist(id_chan,id_playlist)
album(id_album,titre_album,date_sortie_album,prix_album)
ligne_commande(qte,id_chan,id_album,id_com)
*/

	drop database if exists music_p ;

	create database music_p ;

	use music_p ;

	create table utilisateur(
	id_utilisat int auto_increment primary key,
	nom_utilisat varchar(50),
	prenom_utilisat varchar(50),
	mail_utilisat varchar(50),
	mdp_utilisat varchar(15)
	);

	insert into utilisateur values
		(null,'Descartes','John','jd@gmail.com','123'),
		(null,'Charles','Jean','jc@gmail.com','123'),
		(null,'Dubois','Laurent','dl@gmail.com','123'),
		(null,'Haroun','Jami','hj@gmail.com','123'),
		(null,'Ziani','Zineb','zz@gmail.com','123'); 

	create table playlist(
	id_playlist int auto_increment primary key,
	nom_playlist varchar(25)
	);

	insert into playlist values
		(null,'Rap'),
		(null,'Electro'),
		(null,'Jazz'),
		(null,'Gospel'),
		(null,'Classique'),
		(null,'Anniversaire');


	create table chanson(
	id_chan int auto_increment primary key,
	artiste_chan varchar(50),
	titre_chan varchar(50),
	date_sortie_chan date,
	prix_chan float
	);

	insert into chanson values
		(null,'Bethoven','Symphonie 5','2000-11-01',2),
		(null,'Jeff Mills','Waveform transmission','1998-07-23',15),
		(null,'Best of gabber','Compilation','2025-01-01',10),
		(null,'House of Pain','Jum around','2010-05-26',8),
		(null,'House of Pain','Back from the dead','2010-11-04',8),
		(null,'House of Pain','Back from the dead album','2011-09-01',8),
		(null,'Cypress hill','Tequilla sunrise','1993-02-16',2),
		(null,'Jeff Mills','DNA','1998-06-29',2),
		(null,'Jeff Mills','Java','1998-06-01',2),
		(null,'Jeff Mills','The exchange','1998-04-23',2);


	create table commande(
	id_com int auto_increment primary key,
	date_com date,
	id_utilisat int,
	foreign key(id_utilisat) references utilisateur(id_utilisat)
	);

	insert into commande values
		(null,'2025-03-21',1),
		(null,'2025-03-11',2),
		(null,'2025-01-21',3),
		(null,'2024-12-12',4),
		(null,'2024-11-22',5);

	create table creation_playlist(
	id_utilisat int,
	id_playlist int,
	foreign key(id_utilisat) references utilisateur(id_utilisat),
	foreign key(id_playlist) references playlist(id_playlist),
	primary key(id_utilisat,id_playlist)
	);

	insert into creation_playlist values
		(1,1),
		(2,6),
		(3,5);

	create table selection_chanson_playlist(
	id_chan int,
	id_playlist int,
	foreign key(id_chan) references chanson(id_chan),
	foreign key(id_playlist) references playlist(id_playlist),
	primary key(id_chan,id_playlist)
	);

	insert into selection_chanson_playlist values
		(2,2),
		(3,2),
		(4,1),
		(5,1),
		(1,6),
		(4,6),
		(5,6);

	create table album(
	id_chan int,
	id_album int,
	foreign key(id_chan) references chanson(id_chan),
	foreign key(id_album) references chanson(id_chan),
	primary key(id_chan,id_album)
	);

	insert into album values
		(4,6),
		(5,6),
		(8,2),
		(9,2),
		(10,2);

	create table ligne_commande(
	qte int,
	id_chan int,
	id_com int,
	foreign key(id_chan) references chanson(id_chan),
	foreign key(id_com) references commande(id_com),
	primary key(id_chan,id_com)
	);

	insert into ligne_commande values
		(1,2,1),
		(1,3,3),
		(1,5,2),
		(1,1,5),
		(1,1,4);

/* Requête : Afficher les titres des morceaux d’un album donné (par titre)

SELECT 
    alb.titre_chan AS titre_album,
    mus.titre_chan AS titre_morceau,
    mus.artiste_chan,
    mus.date_sortie_chan,
    mus.prix_chan
FROM album a
JOIN chanson alb ON a.id_album = alb.id_chan  -- l’album
JOIN chanson mus ON a.id_chan = mus.id_chan -- le morceau
WHERE alb.titre_chan = 'Back from the dead album';  -- nom de l’album

-- ou

SELECT * 
FROM album a, chanson alb, chanson mu
WHERE a.id_album = alb.id_chan
AND a.id_chan = mu.id_chan
AND a.id_album = 6;

*/
-- afficher la structure d'une table

describe utilisateur;
--ou
desc utilisateur;

-- Afficher les noms et les prénoms des utilisateurs
SELECT nom_utilisat, prenom_utilisat
FROM utilisateur;

-- Afficher le titre et le prix de toutes les chansons
SELECT titre_chan, prix_chan
FROM chanson;

-- Afficher le nom de toutes les playlists
SELECT nom_playlist
FROM playlist;

-- Afficher toutes les colonnes de la table commande
SELECT * FROM commande;

-- pour un affichage à la verticale : 
SELECT * FROM commande \G

-- Afficher le titre et le prix de toutes les chansons
 SELECT titre_chan AS Titre FROM chanson;

SELECT titre_chan AS Titre, prix_chan AS 'Prix TTC'
FROM chanson;

-- PARTIE Operateur logique et restriction

-- Afficher les chansons à moins de 5 €

SELECT * 
FROM chanson
WHERE prix_chan < 5 ;

-- Afficher les utilisateurs 
-- dont le prenom commence par J

SELECT *
FROM utilisateur
WHERE prenom_utilisat like 'j%';

-- Afficher les utilisateurs 
-- dont le prenom contient la lettre O

SELECT *
FROM utilisateur
WHERE prenom_utilisat like '%o%';

-- Afficher les commandes effectuées en 2025
-- YEAR()

SELECT * FROM commande
WHERE YEAR(date_com) = 2025;

-- Afficher les utilisateurs dont l'id est 1, 3 et 5
SELECT*
FROM utilisateur
WHERE id_utilisat IN(1,3,5);

-- Afficher les titres des chansons contenant 'back'
SELECT*
FROM chanson
WHERE titre_chan like '%back%';

-- Afficher les playlists nommées 'Jazz' ou 'Rap'
SELECT*
FROM playlist
WHERE nom_playlist IN('Jazz','Rap');

-- Afficher les titres ainsi que leurs artistes et prix
-- des chansons dont le prix est compris entre 5 et 10 €
SELECT titre_chan, artiste_chan, prix_chan
FROM chanson
WHERE prix_chan BETWEEN 5 AND 10;

-- Sauvegarde et restauration

-- EXPORTER une bdd

-- exemple : mysqldump -u root -p <options> <nomdelaBDD> > bddSave.sql 

mysqldump -u root -p --add-drop-database --databases lid > lid.sql

-- RESTAURER la bdd

mysql -u root -p < lid.sql

-- LES JOINTURES

-- afficher le nom, prénom de tous les clients qui ont commandé 
-- un article le 30 janvier 2024

SELECT nom, prenom 
FROM clients, achats
WHERE clients.numcli = achats.numcli
AND date='2024-01-30';


-- pour afficher une seule fois chaque clients on utilise DISTINCT

SELECT DISTINCT nom, prenom 
FROM clients, achats
WHERE clients.numcli = achats.numcli
AND date='2024-01-30';

/*
 - Afficher le nom et le prénom des clients ainsi 
 que la quantité et la désignation des produits achetés :

*/

SELECT c.nom, c.prenom, ac.qte, ar.designation
FROM clients c, achats ac, articles ar
WHERE c.numcli = ac.numcli
AND ar.numart = ac.numart;

-- FONCTIONS :

-- calculer et afficher le prix moyen d'un article
SELECT AVG(prix) AS 'Prix moyen'
FROM articles;

-- on utilisera round(valeur,Nbede chiffre) ROUND(x,2)
-- pour n'afficher que 2 chiffres après la virgule
SELECT ROUND(AVG(prix),2) AS 'Prix moyen'
FROM articles;


-- le prix moyen, le min et le max
SELECT ROUND(AVG(prix),2), MIN(prix), MAX(prix)
FROM articles;

SELECT * FROM articles
ORDER BY prix
LIMIT 1;

-- ou

SELECT * FROM articles
ORDER BY prix ASC;

-- ordre décroissant

SELECT * FROM articles
ORDER BY prix DESC;


-- la somme de toutes les quantités achetées
SELECT SUM(qte)
FROM articles;


-- le nombre de catégorie
SELECT COUNT(categorie)
FROM articles;

-- cette requête affichera toutes leslignes correspondantes
-- ce qui ne nous arrange pas, puisqu'il n'y a que 3 catégories
-- on utilisera DISTINCT 

SELECT COUNT(DISTINCT categorie)
FROM articles;


-- UPDATE 
-- changer l'adresse mal insérée 'rue d?espagne' en "rue d'Espagne"
UPDATE clients SET adresse = "Rue d'Espagne" WHERE numcli=4;

-- mettre vide les telephones qui sont NULL

UPDATE clients SET telephone="" WHERE telephone IS NULL; 
-- Amandine ayant divorcée a recupéré à défaut de son argent, son nom de 
-- naissance. Ainsi qu'un nouveau téléphone de marque inconnu

UPDATE clients SET nom="Sharknado", telephone="0671344500"
WHERE numcli=3;

-- DELETE 

-- Jean-Luc, fou de chagrin, décide de clôturer son compte 

DELETE FROM clients WHERE numcli=2;