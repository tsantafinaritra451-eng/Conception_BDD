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

-- etape 3

-- Montant total chaque commande

select c.id_commande, SUM(p.prix * c.quantite) as montant_total FROM commande_plat as c
JOIN commande as com
ON  c.id_commande = com.id_commande 
JOIN plats as p
ON c.id_plat = p.id_plat 
GROUP BY c.id_commande;

-- Question piege: quantite est placer dans commande_plat parce que c'est la quantite de chaque plat dans une commande, donc c'est logique de le mettre dans cette table qui relie les commandes et les plats.

-- Etape 4 
-- Liste les commandes avec nom du client en affichant « client de passage »

SELECT c.id_commande, cl.nom as nom_client from commande_plat as c 
JOIN commande as com
ON  c.id_commande = com.id_commande 
JOIN plats as p
ON c.id_plat = p.id_plat 

select 
CASE 
WHEN cm.id_client IS NULL THEN 'client de passage'
ELSE cl.nom
END as nom_client, cm.date from commande as cm
left join client as cl 
on cm.id_client = cl.id_client;

-- question piege : non c'est pas not null le client car seul les clients habituelle sont not null 
-- jointure pour ne rien perdre: left join

Etape 5
-- nombre de commandes et chiffre d'affaires par serveur


select s.nom, COUNT(c.id_commande) as nombre_commandes, SUM(p.prix * cp.quantite) as chiffre_affaires
from serveur as s   
left join commande as c on s.id_serveur = c.id_serveur
left join commande_plat as cp on c.id_commande = cp.id_commande
left join plats as p on cp.id_plat = p.id_plat
group by s.id_serveur;

-- piege : une table de la salle et une commande sont deux choses différentes car une table de la salle représente un emplacement physique dans le restaurant où les clients peuvent s'asseoir, tandis qu'une commande représente une transaction spécifique effectuée par un client ou un groupe de clients à un moment donné. Une table peut être utilisée pour plusieurs commandes au fil du temps,
-- mais une commande est une action que les client dans la salle qui s'assoit a la table 
-- Le nom "table" pose problème en SQL car "TABLE" est un mot réservé dans sql.
 