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


-- Module 5 : Jointures implicites (méthode classique)
-- 1. Afficher clients et séjours associés.
SELECT c.nom, c.prenom, s.debut, s.fin 
FROM Client c, Sejour s WHERE c.idClient = s.idClient;

-- 2. Afficher stations et activités proposées.
SELECT st.nomStation, a.libelle 
FROM Station st, Activite a 
WHERE st.nomStation = a.nomStation;

-- 3. Afficher les clients, leurs séjours et les stations concernées.
SELECT c.nom, s.debut, st.nomStation 
FROM Client c, Sejour s, Station st 
WHERE c.idClient = s.idClient 
AND s.nomStation = st.nomStation;

-- 4. Afficher activités et tarifs des stations associées.
SELECT a.libelle, st.tarif FROM Activite a, Station st WHERE a.nomStation = st.nomStation;

-- 5. Afficher les séjours en Europe avec noms des clients.
SELECT c.nom, s.debut FROM Client c, Sejour s, Station st WHERE c.idClient = s.idClient AND s.nomStation = st.nomStation AND st.region = 'Europe';

-- 6. Stations proposant des activités supérieures à 100€.
SELECT DISTINCT st.nomStation FROM Station st, Activite a WHERE st.nomStation = a.nomStation AND a.prix > 100;

-- 7. Clients ayant réservé un séjour aux Antilles.
SELECT DISTINCT c.nom FROM Client c, Sejour s, Station st WHERE c.idClient = s.idClient AND s.nomStation = st.nomStation AND st.region = 'Antilles';

-- 8. Stations ayant au moins une activité.
SELECT DISTINCT st.nomStation FROM Station st, Activite a WHERE st.nomStation = a.nomStation;

-- 9. Clients et nombre de séjours réservés.
SELECT c.nom, COUNT(*) FROM Client c, Sejour s WHERE c.idClient = s.idClient GROUP BY c.nom;

-- 10. Séjours avec détails complets (client, station, activité).
SELECT c.nom, st.nomStation, a.libelle FROM Client c, Sejour s, Station st, Activite a WHERE c.idClient = s.idClient AND s.nomStation = st.nomStation AND st.nomStation = a.nomStation;


-- Module 6 : Sous-requêtes et opérations avancées
-- 1. Clients ayant réservé dans 
la station la plus chère.

SELECT nom FROM Client WHERE idClient 
IN (SELECT idClient FROM Sejour WHERE nomStation = (SELECT nomStation FROM Station ORDER BY tarif DESC LIMIT 1));

-- 2. Stations sans activité.
SELECT nomStation FROM Station WHERE nomStation 
NOT IN (SELECT DISTINCT nomStation FROM Activite);

-- 3. Clients ayant le solde le plus élevé.
SELECT * FROM Client WHERE solde = (SELECT MAX(solde) FROM Client);

-- 4. Stations ayant une capacité supérieure à la moyenne.
SELECT * FROM Station WHERE capacite > (SELECT AVG(capacite) FROM Station);

-- 5. Activités proposées par la station ayant la plus grande capacité.
SELECT * FROM Activite WHERE nomStation = 
(SELECT nomStation FROM Station ORDER BY capacite DESC LIMIT 1);

-- 6. Clients sans séjour réservé.
SELECT * FROM Client WHERE idClient NOT IN (SELECT DISTINCT idClient FROM Sejour);

-- 7. Séjours avec un nombre de places 
inférieur à la moyenne.

SELECT * FROM Sejour 
WHERE nbPlaces < (SELECT AVG(nbPlaces) FROM Sejour);

-- 8. Stations en Europe proposant des activités à moins de 50€.
SELECT nomStation FROM Activite WHERE prix < 50 AND nomStation IN (SELECT nomStation FROM Station WHERE region = 'Europe');

-- 9. Client ayant réservé le séjour avec le plus grand nombre de places.
SELECT nom FROM Client WHERE idClient = (SELECT idClient FROM Sejour ORDER BY nbPlaces DESC LIMIT 1);

-- 10. Activités les plus coûteuses.
SELECT * FROM Activite WHERE prix = (SELECT MAX(prix) FROM Activite);
