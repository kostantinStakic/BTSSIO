	-- commentaire sur une ligne
	/*
	commentaires 
	sur
	plusieur
	lignes
	*/

	-- suppression de la bdd si elle existe
	drop database if exists bts1rd;

	-- creation de la bdd
	create database bts1rd;

	-- accéder à la bdd
	use bts1rd;

	-- creation des tables

	create table entreprise(
		id_ent int auto_increment primary key, 
		responsable varchar(50),
		nom_ent varchar(50),
		siret int,
		adresse_ent varchar(150),
		mail_ent varchar(50),
		telephone_ent varchar(10)
		);

	insert into entreprise(responsable,nom_ent,siret,adresse_ent,mail_ent,telephone_ent)
	values('Dubois','SNCF',1234567, '14 avenue de la grève','dubois@sncf.fr','0142356578');	
	insert into entreprise
		values(null,'Stephan','EDF',7878789, '1 place Tesla','stephan@edf.fr','0142356578'),
		(null,'Descartes','RATP',24567878, '4 rue du rail','descartes@ratp.fr','0142356578'),
		(null,'Chan','LAPOSTE',3478778, '32 boulevard des timbrés','chan@laposte.fr','0142356578'),	
		(null,'Yazid','THALES',378999, '5 rue de la guerre','dubois@thales.fr','0142356578');	

		



	create table alternance(
		id_alt int auto_increment primary key,
		intitule varchar(150),
		descriptif varchar(1000),
		date_form date,
		date_fin date, 
		id_ent int,
		foreign key(id_ent) references entreprise(id_ent)
		);

	create table etudiant(
		id_etu int auto_increment primary key,
		nom_etu varchar(50),
		prenom_etu varchar(50),
		adresse_etu varchar(150),
		mail_etu varchar(50),
		telephone_etu varchar(10),
		niveau enum('BAC','BTS','BACHELOR','MASTER')
		); 

	create table candidature(
		id_etu int,
		id_alt int,
		foreign key(id_etu) references etudiant(id_etu),
		foreign key(id_alt) references alternance(id_alt),
		primary key(id_etu,id_alt)
		);

	-- visualiser toutes les bdd du système

	show databases;

	-- visualiser toutes les tables dans la bdd selectionnée

	show tables;

	-- visualiser la structure d'une table

	describe entreprise;

	-- ou

	desc entreprise;

	-- afficher tous les enregistrements/tuples d'une table

	select * from entreprise;

	-- afficher de colonnes specifiques

	select nom_ent, adresse_ent, mail_ent
	from entreprise;

		insert into etudiant 
			values(null, 'Domenech', 'Raymond', '14 place du foot', 'dr@gmail.com','012345678','BTS'),
			(null, 'Dubois', 'Julie', '4 rue de Stalingrad', 'dj@gmail.com','012345678','BACHELOR'),
			(null, 'Zlatan', 'Dragan', '3 bld de la libération', 'zd@gmail.com','012345678','BTS');
/*
EXERCICES (Création de VIEWS) 
Exercice 1 : VUE des chambres avec leur hôtel associé 
Créer une vue Vue_Chambres_Hotels affichant pour chaque chambre : 
l’idChambre 
le NumChambre 
le nom de l'hôtel (Libelle)
*/

CREATE VIEW Vue_Chambres_Hotels as
SELECT c.idChambre, c.NumChambre, h.libelle
FROM chambres c
JOIN hotels h 
ON c.hotel = h.idhotel;
/*
Exercice 2 : VUE des tarifs par type de chambre 
Créer une vue Vue_Tarifs_TypeChambre affichant : 
le nom de l’hôtel (Libelle) 
le type de lit (TypeLit) 
le nombre de lits (NombreLit) 
le prix (Prix) */

CREATE VIEW vue_tarif_typechambre AS
SELECT 
h.Libelle AS nom_hotel,
tc.TypeLit,
tc.NombreLit,
t.Prix
FROM 
Tarifs t
JOIN 
Hotels h ON t.hotel = h.idHotel
JOIN 
TypesChambre tc ON t.typeChambre = tc.idTypeChambre;
/*
créer une vue avec le nom des hotels associés 
au nombre d'étoiles sur une seule colonne
CONCAT(nomHotel,' ',nbreEtoile,' Type de chambre : ',typeschambre) AS Description
*/

	CREATE VIEW Vue_description_complete AS
	SELECT idhotel, 
	CONCAT(h.libelle,' ',h.etoile,' Type de chambre : ',tc.TypeLit) AS Description
	FROM hotels h
	JOIN chambres c 
	ON c.hotel =h.idhotel
	JOIN TypesChambre tc 
	ON tc.idtypeChambre = c.typeChambre;


GRANT SELECT ON resahotel.* TO 'lolo'@'localhost';

revoke all privileges on resahotel.* FROM 'lolo'@'localhost';

GRANT SELECT(libelle,etoile) 
	ON resahotel.hotels TO 'lolo'@'localhost';
