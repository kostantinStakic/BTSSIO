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

-- 1 Afficher les noms et 
-- prénoms de tous les utilisateurs
SELECT * FROM utilisateur;

-- 2 Afficher les titres et 
-- les prix des chansons
SELECT titre_chan, prix_chan 
FROM chanson;

-- 3 Afficher le nom des playlists
SELECT nom_playlist
FROM playlist;

-- 4 Afficher 
-- toutes les commandes du 22 novembre 2024
SELECT *
FROM commande
WHERE date_com = '2024-11-22';


-- Partie 2 – Restriction 
 
-- 2.1 Afficher les chansons à moins de 5€. 
SELECT * 
FROM chanson 
WHERE prix_chan < 5;

-- 2.2 Afficher les utilisateurs dont le prénom commence par "J". 
SELECT *
FROM utilisateur
WHERE prenom_utilisat LIKE 'j%';

-- 2.3 Afficher les playlists contenant la lettre "o". 
SELECT *
FROM playlist
WHERE nom_playlist LIKE '%o%';

-- 2.4 Afficher les commandes effectuées en 2025. 
SELECT *
FROM commande
WHERE YEAR(date_com) = '2025';


