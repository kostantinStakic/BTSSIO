-- Gestion d'un blog :

-- Un auteur peut publier un ou plusieurs articles et un article appartient à un auteur.

-- MLD

-- Auteur (id_aut, nom, prenom, mail, mdp)
-- Article (id_art, titre, contenu, url_image, #id_aut)

-- MPD

DROP DATABASE IF EXISTS blog;
CREATE DATABASE blog;
USE blog;

-- Table auteur
CREATE TABLE auteur (
    id_aut INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    mail VARCHAR(100) NOT NULL UNIQUE,
    mdp VARCHAR(255) NOT NULL
);

-- Table article
CREATE TABLE article (
    id_art INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(100) NOT NULL,
    contenu TEXT NOT NULL,
    url_image VARCHAR(255),
    id_aut INT,
    FOREIGN KEY (id_aut) REFERENCES auteur(id_aut)
);

INSERT INTO auteur (nom, prenom, mail, mdp) VALUES
('Daddy', 'Yankee', 'mail@mail.com', '123'),
('Mommy', 'Yankaa', 'mail2@mail.com', '456'),
('Lil', 'BB', 'mail3@mail.com', '789');


-- afficher tous les renseignements de l'auteur
-- ayant le mail : mail1@mail.com 
-- et le mot de passe : 123

select * from auteur where mail_aut="mail1@mail.com" 
and mdp_aut="123";