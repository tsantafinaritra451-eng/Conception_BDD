CREATE Table commande (
    id_commande SERIAL PRIMARY KEY, 
    date DATE NOT NULL
);

CREATE Table commande_plat(
    id SERIAL PRIMARY KEY,
    id_commande INTEGER REFERENCES commande(id_commande) NOT NULL,
    id_plat INTEGER REFERENCES plats(id_plat) NOT NULL,
    quantite INTEGER NOT NULL
);

insert into commande(date) values('2024-06-01');
insert into commande(date) values('2024-07-01');

insert into commande_plat(id_commande, id_plat, quantite) values(1, 1, 2);
insert into commande_plat(id_commande, id_plat, quantite) values(1, 2, 1);
insert into commande_plat(id_commande, id_plat, quantite) values(1, 3, 1);

