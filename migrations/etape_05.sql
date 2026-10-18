create Table serveur (
    id_serveur SERIAL PRIMARY KEY,
    nom VARCHAR(50) NOT NULL
);

create Table tables (
    id_table SERIAL PRIMARY KEY,
    numero INTEGER NOT NULL
);

--  Ajoutez les serveurs (Njaka Rakoto, Lalao Rasoa) et les huit tables de la salle

insert into serveur (nom) values('Njaka Rakoto');
insert into serveur (nom) values('Lalao Rasoa');

insert into tables (numero) values(1);
insert into tables (numero) values(2);
insert into tables (numero) values(3);
insert into tables (numero) values(4);
insert into tables (numero) values(5);
insert into tables (numero) values(6);
insert into tables (numero) values(7);
insert into tables (numero) values(8);

-- nombre de commandes et chiffre d'affaires par serveur.



   

insert into commande(date, id_serveur, id_client) values('2024-06-01', 1, 1);
insert into commande(date, id_serveur, id_client) values('2024-06-01', 1, 1);
