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

drop database if exists blogLM;

create database blogLM;

use blogLM;

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

-- afficher toutes les informations de l'utilisateur
-- dont le mail est mail@mail.com 
-- et le mot de passe : 123

select * from auteur where mail='mail@mail.com' 
and mdp='123'

-- injection SQL

select * from auteur where mail='' OR 1=1 

select * from auteur where mail='' OR 1=1 -- ' and mdp=''

-- à mettre dans le champ mail : 

' OR 1=1 -- 

