/* 
Création d'un petit blog pour 
tester la sécurité d'un formulaire
avec 

- des injections sql simples via GET
- injections via form
- modification directe dans l'url

objectif :
- sécuriser les requetes sql grace aux méthodes
	prepare(), bind_param() et execute()
- gestion des sessions utilisateurs ($_SESSION)
- hashage de mdp
- gestion des requetes SQL : select,insert,delete et update

bonus:
- upload des images
- initiation à la POO(programmtion orientée objets)
- utilisation des fonctions pour nos requêtes

- création de la bdd BLOG :
un espace de publication d'articles sur 
divers sujets.
Un auteur pourra publier des articles.

entités : AUTEUR, ARTICLE
relation : AUTEUR 1,N -publier- 1,1 ARTICLE
*/

drop database if exists blog;

create database blog;

use blog;

-- AUTEUR
create table auteur(
id_aut int auto_increment primary key,
nom_aut varchar(50),
prenom_aut varchar(50),
mail_aut varchar(50),
mdp_aut varchar(20)
);

-- ARTICLE
create table article(
id_art int auto_increment primary key,
titre varchar(50),
contenu text,
id_aut int,
foreign key(id_aut) references auteur(id_aut)
);

-- insertion d'auteurs
insert into auteur values
	(null,'Lord','British','mail1@mail.com','123'),
	(null,'Lady','French','mail2@mail.com','234'),
	(null,'Mama','Mexican','mail3@mail.com','345');


select * from auteur where mail_aut='' OR 1=1 -- and mdp_aut=;