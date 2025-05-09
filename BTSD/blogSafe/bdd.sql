-- BLOG -- 

/*
bdd : 
un auteur(pseudo,mdp) peut publier un ou plusieur articles 
un article(titre,contenu,urlimage) ne peut être publié que par un auteur

MLD : 

auteur(idaut,pseudo,mdp)
article(idart,titre,contenu,urlimage,#idaut)

MPD : 
*/

drop database if exists blogD;

create database blogD;

use blogD;

create table auteur(
	idaut int auto_increment primary key,
	pseudo varchar(50),
	mail varchar(50),
	mdp varchar(20)
	);

create table article(
	idart int auto_increment primary key,
	titre varchar(50),
	contenu text,
	urlimage varchar(250),
	idaut int,
	foreign key(idaut) references auteur(idaut)
	);

insert into auteur values
	(null,"Dokja","mail1@mail.com","123"),
	(null,"Amandine","mail2@mail.com","345"),
	(null,"AmFicy","mail3@mail.com","456"),
	(null, "tls123", "ORW@mail.com","123");

	
select * from auteur where mail='' and mdp='';

on veut cette requete : 
select * from auteur where mail='' and mdp='';


-- Les injections sql 

-- dans le champ mail dans index

' or 1=1 --

-- dans l'url dans accueil.php

0 or 1=1

-- pour de user à la volée

par exemple : 
blog/accueil.php?idaut=1
blog/accueil.php?idaut=2
blog/accueil.php?idaut=3

-- on remplace juste les valeurs après idaut