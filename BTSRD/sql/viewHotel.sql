-- créer une vue avec :
-- numéro de l'hotel, 
-- numéro de la chambre , le type de lit, 
-- le nombre de lits et la description de la chambre

create view V_chambre_hotel as
-- jointure avec JOIN
	select c.idChambre, c.numChambre, tc.typeLit,
			tc.nombreLit, tc.description
			from chambres c
			join typesChambre tc
			on c.typeChambre = tc.idtypeChambre;

-- jointure version classique
	select c.idChambre, c.numChambre, tc.typeLit,
			tc.nombreLit, tc.description
			from chambres c, typesChambre tc
			where c.typeChambre = tc.idtypeChambre;
