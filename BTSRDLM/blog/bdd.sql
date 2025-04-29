-- gestion d'un blog : 

/*
un auteur peut publier un ou plusieurs articles
et un article ne pourra être publier que par un 
seul auteur 
*/

-- MLD
/*
auteur(id_aut,nom,prenom,mail,mdp)
article(id_art,titre,contenu,url_image,#id_aut)
*/
-- MPD (Modèle physique de données)

drop database if exists blog;

create database blog;

use blog;

create table auteur(
	id_aut int auto_increment primary key,
	nom varchar(50),
	prenom varchar(50),
	mail varchar(50),
	mdp varchar(15)
	);

create table article(
	id_art int auto_increment primary key,
	titre varchar(50),
	contenu text,
	url_image varchar(150),
	id_aut int,
	foreign key(id_aut) references auteur(id_aut)
	);

-- insertion des auteurs 

insert into auteur values
	(null,"Daddy","Yankee","mail@mail.com","123"),
	(null,"Mommy","Yankaa","mail2@mail.com","456"),
	(null,"Lil","BB","mail3@mail.com","789");


