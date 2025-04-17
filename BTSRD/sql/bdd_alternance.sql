/* Commentaire sur plusieurs ligne
 
*/
drop database if exists alternanceBTSRD;
 
-- creation
 
create database alternanceBTSRD;
 
-- acceder
 
use alternanceBTSRD;
 
-- creation des tables
 
CREATE TABLE entreprise(
id_ent int auto_increment primary key,
siret int,
nom_ent varchar(150),
categorie varchar(50) ,
adresse_ent varchar(250) ,
cp int(5),
mail_ent varchar(15) , 
telephone int);
 
CREATE TABLE alternance(
id_alt int auto_increment primary key,
intitule varchar(150),
description varchar(1000),
date_deb date,
date_fin date,
id_ent int,
foreign key(id_ent) references entreprise(id_ent));
 
CREATE TABLE etudiant(
id_etu int auto_increment primary key,
nom_etu varchar(150),
prenom_etu varchar(150),
adresse_etu varchar(250),
mail_etu varchar(50),
telephone_etu int);
 
CREATE TABLE candidature(
id_ent int,
id_etu int,
foreign key(id_ent) references entreprise(id_ent),
foreign key(id_etu) references  etudiant(id_etu),
primary key(id_ent,id_etu));

-- lister toutes les bdd existantes dans le système 

show databases;

-- accéder à une bdd 

use alternancebtsrd;

-- lister toutes les tables d'une bdd

show tables;

-- lister la structure d'une table 
-- (les attributs, les types, les options/contraintes)

describe etudiant;

-- ou

desc etudiant;

-- insertion des données 

-- 1 : la méthode classique

/*
entreprise(id_ent,siret,nom_ent,categorie,adresse_ent,cp,mail_ent,telephone)
alternance(id_alt,intitule,descripition,date_deb,date_fin,#id_ent)
etudiant(id_etu,nom_etu,prenom_etu,adresse_etu,mail_etu,telephone_etu)
candidature(#id_etu, #id_ent)
*/

insert into etudiant(nom_etu,prenom_etu,adresse_etu,mail_etu,telephone_etu) 
values('Dubois','Sophie','13 rue de verdun','dubois@gmail',0143216153);

-- 2 : la méthode courte 

insert into etudiant values(null,'Chan','Li','1 rue de Pékin','chan@gmail.com',0143216153);
insert into etudiant values(null,'Ilic','Vladislav','3 Boulevard du vieux Slave','ilic@gmail.com',0143216153);
insert into etudiant values(null,'Chaouche','Yazid','14 place de Marakech','ch@gmail.com',0143216153);
insert into etudiant values(null,'Diouf','Pape','5 avenue du Congo','di@gmail.com',0143216153);

insert into entreprise values
	(null,113567,'SNCF','Support SI','3 du rail',75014,'info@sncf.com',0123456789),
	(null,234567,'RATP','Support SI','14 place de la grève',78000,'info@ratp.com',0123456789),
	(null,367833,'EDF','Dev','5 avenue de Tchernobyl',92200,'info@edf.com',0123456789),
	(null,234568,'URSSAF','Dev','12 rue des voleurs',78140,'info@urssaf.com',0123456789),
	(null,777897,'AMELI','Chef de projet SI','4 place des malades',75020,'info@ameli.com',0123456789);





