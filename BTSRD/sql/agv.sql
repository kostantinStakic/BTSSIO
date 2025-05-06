drop database if exists agvoyages;
CREATE database agvoyages;
use agvoyages;

CREATE TABLE Station (nomStation VARCHAR (30),
                      capacite   int (10) NOT NULL,
                      lieu       VARCHAR(30) NOT NULL,
                      region     VARCHAR (30),
                      tarif      decimal (6,2) default 0,
                      CONSTRAINT cle_station PRIMARY KEY (nomStation), 
                      CONSTRAINT cle_lieu_region UNIQUE (lieu, region),
                      CONSTRAINT CHK_region
                         CHECK (region IN ('Ocean Indien', 
                                        'Antilles', 'Europe',
                                        'Ameriques', 'Extreme Orient'))
                    )engine=innodb,charset='utf8';


set @p=(select min(tarif) from station);

CREATE TABLE Activite (nomStation   VARCHAR(30),
            libelle      VARCHAR(30),
            prix         decimal (6,2) DEFAULT 0,
 /*CONSTRAINT  chk_prix CHECK(prix <((select min(tarif) from station))),*/
  /* sinon CONSTRAINT  chk_prix   CHECK(prix < @p)*/                                              
            PRIMARY KEY (nomStation, libelle),
            FOREIGN KEY (nomStation) REFERENCES Station(nomStation)
            ON DELETE CASCADE
            )engine=innodb ,charset='utf8';
CREATE TABLE Client (id int (10),
                      nom VARCHAR(30) NOT NULL,
                      prenom VARCHAR (30),
                       ville VARCHAR (30) NOT NULL,
                       region VARCHAR(30),
                        solde decimal (10,2) DEFAULT 0 NOT NULL,
                         PRIMARY KEY (id)
                   )engine=innodb;  
CREATE TABLE Sejour (idClient int (10),
                    station VARCHAR (30),
                    debut date ,
                    nbPlaces  int(4) NOT NULL,
                PRIMARY KEY (idClient, station, debut),
                FOREIGN KEY (idClient) REFERENCES Client(id),
                FOREIGN KEY (station) REFERENCES Station(nomStation)
                ON DELETE CASCADE)engine=innodb,charset='utf8';


INSERT INTO Station (NomStation, Capacite, Lieu, Region, tarif)
  VALUES     ('Venusa', 350, 'Guadeloupe', 'Antilles', 1200);
INSERT INTO Station values('Farniente',200,'Seychelles','Ocean Indien',1500);
 INSERT INTO Station values('Santalba',150,'Martinique','Antilles',2000);
  INSERT INTO Station values ('Passac',400,'Alpes','Europe',1000);

INSERT INTO Activite (NomStation, Libelle, prix)
VALUES ('Venusa', 'Voile', 150);
INSERT INTO Activite values ('Venusa','Plongée',120);
INSERT INTO Activite values('Farniente','Plongée',130);
  INSERT INTO Activite values('Passac','Ski',200);
    INSERT INTO Activite values ('Passac','Piscine',20);
     INSERT INTO Activite values ('Santalba','Kayac',50);



INSERT INTO CLIENT (id, nom,  prenom, ville, region, solde)
VALUES (20, 'Pascal', 'Blaise', 'Paris', 'Europe', 6763);
INSERT INTO CLIENT VALUES (10,'Fogg ','Phileas','Londres','Europe', 12465);
INSERT INTO CLIENT VALUES  (30,'Kerouac','Jack','NewYork','Amérique', 9812);

INSERT INTO SEJOUR (idClient, station, debut, nbPlaces)
VALUES(10,'Passac','2023-07-01', 2),
       (30,'Santalba','2020-08-14',5),
        (20,'Santalba','2023-08-03',4),
        (30,'Passac','2023-08-15', 3),
        (30,'Venusa','2023-08-03',3),
        (20,'Venusa','2023-08-03',6),
        (30,'Farniente','2024-06-24',5),
        (10,'Farniente','2023-09-05',3);

-- CORRECTION

-- Module 1 : Introduction
-- 1. Afficher toutes les stations.
SELECT * FROM Station;
 
-- 2. Afficher tous les clients.
SELECT * FROM Client;
 
-- 3. Afficher toutes les activités.
SELECT * FROM Activite;
 
-- 4. Afficher tous les séjours.
SELECT * FROM Sejour;
 
-- 5. Afficher les stations en Europe.
SELECT * FROM Station WHERE region = 'Europe';
 
-- 6. Afficher les clients avec solde positif.
SELECT * FROM Client WHERE solde > 0;
 
-- 7. Afficher les activités coûtant moins de 50.
SELECT * FROM Activite WHERE prix < 50;
 
-- 8. Afficher le nombre de stations.
SELECT COUNT(*) FROM Station;
 
-- 9. Afficher les clients habitant à Paris.
SELECT * FROM Client WHERE ville = 'Paris';
 
-- 10. Afficher les séjours commençant en juillet 2023.
SELECT * FROM Sejour 
WHERE debut 
BETWEEN '2023-07-01' AND '2023-07-31';
-- OU
SELECT * FROM Sejour 
WHERE debut >= '2023-07-01' 
AND debut <= '2023-07-31';

-- Module 2 : Tri et filtrage

-- 1. Stations triées par tarif croissant.
SELECT * FROM Station ORDER BY tarif ASC;
--ou
SELECT * FROM Station ORDER BY tarif;
 
-- 2. Clients triés par solde décroissant.
SELECT * FROM Client ORDER BY solde DESC;
 
-- 3. Activités triées par prix décroissant.
SELECT * FROM Activite ORDER BY prix DESC;
 
-- 4. Séjours triés par date de début croissante.
SELECT * FROM Sejour ORDER BY debut ASC;
 
-- 5. Clients triés par nom.
SELECT * FROM Client ORDER BY nom;
 
-- 6. Stations ayant plus de 100 places.
SELECT * FROM Station WHERE capacite > 100;
 
-- 7. Activités disponibles à 'Passac'.
SELECT * FROM Activite WHERE nomStation = 'Passac';
 
-- 8. Clients en dehors d'Europe.
SELECT * FROM Client WHERE region != 'Europe';

-- 8bis. Clients en Europe.

SELECT * FROM Client WHERE region = 'Europe';
 
-- 9. Séjours ayant plus de 2 places réservées.
SELECT * FROM Sejour WHERE nbPlaces > 2;
 
-- 10. Stations dont le nom commence par 'S'.
SELECT * FROM Station WHERE nomStation LIKE 'S%';




