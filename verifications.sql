-- affiche plats plus cher au moins cher
SELECT * FROM plats ORDER BY prix DESC;

-- piege : je choisi INTEGER comme type de prix
-- l'identifiant : id_plat

-- Etape 2

-- Nombre de plat par categorie y compris les categories sans plats

SELECT c.libelle, COUNT(c.libelle) as nb_plat FROM plats as p
RIGHT join categorie_plat as c
ON c.id_categorie = p.id_categorie
GROUP BY c.id_categorie;

-- Question Piege : on ajoute pas simplements caterie dans la table plat parce que c'est pas optimise du tout a chaque plats on devrais ajouter une categorie c'est mieux de separer comme ca les memes categorie porte juste les meme id sans 
-- reecrire et meme si on peut ajoute des categories imagine ca devrais etre parails mais mauvaise ecriture 