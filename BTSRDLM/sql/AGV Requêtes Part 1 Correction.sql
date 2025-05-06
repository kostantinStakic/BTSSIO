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

-- ou version < et >
SELECT * FROM Sejour 
WHERE 
debut >= '2023-07-01' AND
debut <= '2023-07-31';

-- Module 2 : Tri et filtrage
-- 1. Stations triées par tarif croissant.
SELECT * FROM Station ORDER BY tarif;
-- ou
SELECT * FROM Station ORDER BY tarif ASC;

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

-- 9. Séjours ayant plus de 2 places réservées.
SELECT * FROM Sejour WHERE nbPlaces > 2;

-- 10. Stations dont le nom commence par 'S'.
SELECT * FROM Station WHERE nomStation LIKE 'S%';


-- Module 3 : Conditions avancées
-- 1. Clients avec solde entre 1000 et 5000.
SELECT * FROM Client WHERE solde BETWEEN 1000 AND 5000;

-- 2. Stations hors des Antilles.
SELECT * FROM Station WHERE region != 'Antilles';

-- 3. Activités avec un prix supérieur à la moyenne.
SELECT * FROM Activite 
WHERE prix > (SELECT AVG(prix) FROM Activite);

-- 4. Séjours en 2024.
SELECT * FROM Sejour WHERE YEAR(debut) = 2024;

-- 5. Clients dont le prénom contient 'a'.
SELECT * FROM Client WHERE prenom LIKE '%a%';

-- 6. Stations avec capacité inférieure à 150.
SELECT * FROM Station WHERE capacite < 150;

-- 7. Activités coûtant exactement 100.
SELECT * FROM Activite WHERE prix = 100;

-- 8. Séjours terminés avant août 2023.
SELECT * FROM Sejour WHERE fin < '2023-08-01';

-- 9. Clients dont le nom commence par 'B'.
SELECT * FROM Client WHERE nom LIKE 'B%';

-- 10. Stations avec tarif pair.
SELECT * FROM Station WHERE MOD(tarif,2) = 0;
