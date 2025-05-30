-- créer une vue avec liste des chambres: numéro de l'hotel, numéro de la chambre,
-- type de lit, nombre de lit et desciption de la chambre

-- vue avec jointure version join
create view V_chambres as
select c.hotel, c.NumChambre, t.TypeLit, t.NombreLit, t.Description
from chambres c
join typeschambre t
on c.typeChambre = t.idTypeChambre;

-- version classique
create view V_chambres as
select c.hotel, c.NumChambre, t.TypeLit, t.NombreLit, t.Description
from chambres c,typeschambre t
where c.typeChambre = t.idTypeChambre;

-- tarif par type de chambre : nom de l'hotel, type de lit, nombre de lits , prix
create view V_Tarifs_Chambres as
select h.libelle as Hotel, t.TypeLit, t.NombreLit, tr.Prix
from tarifs tr
join hotels h on tr.hotel = h.idhotel
join typeschambre t on t.idTypeChambre = tr.TypeChambre;



-- exemple d'utilisation de la fonction CONCAT()
select concat("Nom de l'hotel : ",libelle," Nombre d'étoiles : ",etoile) as 'Les hotels' from hotels;

-- vue avec nom de l'hotel et nbre d'étoiles dans une seule colonne, et nbre total
-- de lit par hotel. CONCAT('',nomDeLaColonne1,'',nomDeLaColonne2)

drop view V_Hotel_Etoiles;
create view V_Hotel_Etoiles as
select concat("Nom de l'hotel : ",libelle," Nombre d'étoiles : ",etoile),
sum(NombreLit)
from chambres c, typeschambre t, hotels h
where c.TypeChambre = t.idTypeChambre
and h.idhotel = c.hotel
group by h.libelle;

-- création utilisateur avec privilèges

create user 'paul'@'localhost' identified by 'mdp123';

-- donner les privileges d'affichage de toutes les tables de lid

grant select on lid.* to 'paul'@'localhost';

flush privileges;

revoke select on lid.* from 'paul'@'localhost';

grant select on lid.clients to 'paul'@'localhost';

flush privileges;

-- donner plusieurs privilèges à l'utilisateur
grant select,insert on lid.clients to 'paul'@'localhost';

-- donner des privileges sur certaines colonnes d'une table
grant select(nom,prenom) on lid.clients to 'paul'@'localhost';

-- commande pour lister tous les utilisateurs depuis root

select user from mysql.user;

-- afficher les privileges d'un utilisateur

show grants for 'paul'@'localhost';


