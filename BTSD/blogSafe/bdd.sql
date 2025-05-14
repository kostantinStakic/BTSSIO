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
	(null,"DOKJA","123"),
	(null,"Amandine","345"),
	(null,"AmFicy","456");

	
