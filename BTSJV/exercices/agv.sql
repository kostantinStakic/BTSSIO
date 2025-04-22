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

-- 5. Afficher les séjours en Europe avec noms des clients.  

-- 6. Stations proposant des activités supérieures à 100€.  

-- 7. Clients ayant réservé un séjour aux Antilles.  

-- 8. Stations ayant au moins une activité.  

-- 9. Clients et nombre de séjours réservés.  

-- 10. Séjours avec détails complets (client, station, activité). 