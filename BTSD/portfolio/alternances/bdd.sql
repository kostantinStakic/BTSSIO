-- commentaire sur une ligne (ATTENTION : mettre des espaces au début)

/* 
commentaire 
sur 
plusieurs lignes
*/

-- suppression de la bdd si elle existe

drop database if exists alternanceBTSD;

-- création de la bdd

create database alternanceBTSD;

-- accéder à la bdd

use alternanceBTSD;

-- creation des tables

CREATE TABLE entreprise(
id_ent int auto_increment primary key,
siret int,
nom_ent varchar(150),
categorie varchar(150),
adresse_ent varchar(250),
cp int(5),
mail_ent varchar(15),
telephone int
);

CREATE TABLE alternance(
	id_alt int auto_increment primary key,
	intitule varchar(150),
	descripition varchar(1000),
	date_deb date,
	date_fin date,
	id_ent int,
	foreign key(id_ent) 
	references entreprise(id_ent)
	);

CREATE TABLE etudiant(
id_etu int auto_increment primary key,
nom_etu varchar(150),
prenom_etu varchar(150),
adresse_etu varchar(250),
mail_etu varchar(15),
telephone_etu int
);

CREATE TABLE candidature(
id_ent int,
id_etu int,
foreign key(id_ent) references entreprise(id_ent),
foreign key(id_etu) references etudiant (id_etu),
primary key(id_ent,id_etu) 
);

-- ajouter une colonne/attribut mot de passe (mdp)

ALTER TABLE etudiant 
ADD mdp varchar(20) 
AFTER mail_etu;

insert into etudiant(nom_etu,prenom_etu,mail_etu,mdp)
	values('Blabla', 'Blibli', 'bla@gmail.fr','123');

-- tentative d'injection SQL

SELECT * FROM etudiant 
WHERE mail_etu = '
OR 1=1 --
' AND mdp = 'variable';

-- objectif : 
SELECT * FROM etudiant WHERE mail_etu = '' AND mdp = '';

OR 1=1 

select * from etudiant where id='' OR 1=1 -- ' AND mdp = '';
