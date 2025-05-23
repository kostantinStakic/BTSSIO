-- BLOG --

/*
bdd :
un auteur (pseudo, mdp) peut publier un ou plusieurs articles
un article (titre, contenu, url_image) ne peut être publié que par un auteur
*/

-- MLD
-- Auteur(_id_Aut, pseudo, mdp)
-- Article(_id_Art, titre, contenu, url_image, #id_Aut)

-- MPD

drop database if exists blogd;
create database blogd;
use blogd;

create table Auteur(
	id_Aut int auto_increment primary key,
	pseudo varchar(50),
	mail varchar(50),
	mdp varchar(50)
);

create table Article(
	id_Art int auto_increment primary key,
	titre varchar(50),
	contenu text,
	url_image varchar(250),
	id_Aut int,
	foreign key (id_Aut) references auteur(id_Aut)
);

insert into auteur values
	(null,"Dokja","mail1@mail.com","123"),
	(null,"Amandine","mail2@mail.com","345"),
	(null,"AmFicy","mail3@mail.com","456"),
	(null, "tls123", "ORW@mail.com","123");


select * from auteur where mail='' and mdp='' 


select * from auteur where mail='0' or 1=1

ou

select * from auteur where mail='' or 1=1 


select * from auteur where mail=''' or 1=1 -- and mdp='' 
