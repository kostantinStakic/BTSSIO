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
        (10,'Farniente','2023-09-05',3);-- 1. Afficher clients et séjours associés.  

SELECT c.nom,c.prenom,c.ville,s.debut FROM
client c,sejour s
WHERE s.idClient = c.id;

-- avec JOIN

SELECT * FROM client
JOIN sejour ON client.id = sejour.idclient;

-- 2. Afficher stations et activités proposées.

SELECT DISTINCT s.station, a.libelle
FROM sejour s, activite a 
WHERE s.station = a.nomstation;

-- 3. Afficher les clients (nom,prenom), leurs séjours(debut) et les stations concernées(nom, lieu).  

SELECT c.nom,c.prenom,s.debut,st.nomStation,st.lieu
FROM client c, sejour s, station st
WHERE s.station = st.nomstation
AND c.id = s.idclient;


-- 4. Afficher activités et tarifs des stations associées.

SELECT a.libelle, st.tarif
FROM activite a, station st
WHERE st.nomStation = a.nomStation;




REQUETES A faire pour vendredi prochain
### **Module 1 : Introduction**

-- 1. Afficher toutes les stations.

SELECT * FROM station;  

-- 2. Afficher tous les clients.  

SELECT * FROM clients;

-- 3. Afficher toutes les activités.  

SELECT * FROM activites;

-- 4. Afficher tous les séjours. 

SELECT * FROM sejours; 

-- 5. Afficher les stations en Europe.  

SELECT nomStation AS 'Nom de la station',region 
FROM station 
WHERE region='europe';

-- 6. Afficher les clients avec solde positif. 

select nom,prenom,solde from client where solde > 0; 

-- 7. Afficher les activités coûtant moins de 50.  

select libelle,prix from activite where prix <= 50;

-- 7bis. Modifier l'activite mal orthographiée 'kayac' en 'kayak'

update activite set libelle='Kayak' where libelle='Kayac';

-- 8. Afficher le nombre de stations.  

select count(nomStation) from station;

-- 8-1 affichage sans doublon

select count(distinct libelle) as "Nombre d'activités" from activite;

-- 8-2 Le total de capacité de toutes les stations

select sum(capacite) from station;

-- 8-3 La station la plus chere 

select max(prix) from station;

-- 8-4 La station la moins chere

select min(prix) from station;

-- 8-5 le total de tous les tarifs des stations, la moins chere et la plus chere
-- avec des alias

select sum(tarif) as 'total', min(tarif) as 'prix le + bas', max(tarif) as 'prix le + haut'
from station; 

-- 8-6 la moyenne des tarifs arrondi au superieur avec 2 chiffres après la virgule

select avg(tarif) from station;

select round(avg(tarif),2) as 'total' from station;

-- 9. Afficher les clients habitant à Paris.  

select nom, prenom from client where ville='paris';

-- 10. Afficher les séjours qui commence en juillet 2023.  

select station from sejour 
where debut >= '2023-07-01' and debut <= '2023-07-31';

select station from sejour
where debut BETWEEN '2023-07-01' And '2023-07-31';
 
-- Module 4 : Agrégation et regroupement
-- 1. Nombre total de clients.
SELECT COUNT(*) FROM Client;

-- 2. Nombre d'activités par station.
SELECT nomStation, COUNT(*) FROM Activite GROUP BY nomStation;

-- 3. Moyenne des tarifs des stations.
SELECT AVG(tarif) FROM Station;

-- 4. Somme totale des soldes des clients.
SELECT SUM(solde) FROM Client;

-- 5. Prix maximum des activités.
SELECT MAX(prix) FROM Activite;

-- alternative

SELECT prix as 'Prix maximum' FROM Activite 
ORDER BY prix DESC LIMIT 1;

-- 6. Durée moyenne des séjours en nombre de places.
SELECT AVG(nbPlaces) FROM Sejour;

-- 7. Nombre de stations par région.
SELECT region, COUNT(*) FROM Station GROUP BY region;

-- 8. Minimum des tarifs des stations.
SELECT MIN(tarif) FROM Station;

-- alternative 

SELECT tarif AS 'Tarif minimum' FROM station
ORDER BY tarif LIMIT 1;

-- 9. Nombre de clients par ville.
SELECT ville, COUNT(*) FROM Client GROUP BY ville;

-- 10. Nombre total de places réservées tous séjours confondus.
SELECT SUM(nbPlaces) FROM Sejour;

-- Module 5 : Jointures implicites (méthode classique)
-- 1. Afficher clients et séjours associés.
SELECT c.nom, c.prenom, s.debut, s.fin 
FROM Client c, Sejour s 
WHERE c.idClient = s.idClient;

-- 2. Afficher stations et activités proposées.
SELECT st.nomStation, a.libelle FROM Station st, Activite a WHERE st.nomStation = a.nomStation;

-- 3. Afficher les clients, leurs séjours et les stations concernées.
SELECT c.nom, s.debut, st.nomStation FROM Client c, Sejour s, Station st WHERE c.idClient = s.idClient AND s.nomStation = st.nomStation;

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
SELECT c.nom, COUNT(*) as 'Nombre total de séjour' 
FROM Client c, Sejour s 
WHERE c.id = s.idClient GROUP BY c.nom;

-- 10. Séjours avec détails complets (client, station, activité).
SELECT c.nom, st.nomStation, a.libelle 
FROM Client c, Sejour s, Station st, Activite a 
WHERE c.idClient = s.idClient AND s.nomStation = st.nomStation 
AND st.nomStation = a.nomStation;

-- on va changer id de la table client en idclient pour
-- plus de cohésion 

