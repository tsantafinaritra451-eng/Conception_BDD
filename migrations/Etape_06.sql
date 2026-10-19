create Table mobile_money (
    id_mobile_money SERIAL PRIMARY KEY,
    libelle VARCHAR(50)
);

CREATE Table type_paiement (
    id_type_paiement SERIAL PRIMARY KEY,
    libelle VARCHAR(50)
);

CREATE Table paiement (
    id_paiement SERIAL PRIMARY KEY,
    id_commande INTEGER REFERENCES commande (id_commande),
    date DATE
);

CREATE Table paiement_fille (
    id_paiement_fille SERIAL PRIMARY KEY,
    id_paiement INTEGER NOT NULL REFERENCES paiement (id_paiement) ON DELETE CASCADE,
    id_type_paiement INTEGER NOT NULL REFERENCES type_paiement (id_type_paiement),
    id_mobile_money INTEGER REFERENCES mobile_money (id_mobile_money),
    montant INTEGER,
    reference_transaction VARCHAR(100),
    CHECK (
        (
            id_type_paiement = 1 AND id_mobile_money is NULL
        )
        OR (
            id_type_paiement = 2 AND id_mobile_money is NOT NULL
        )
    )
);

INSERT INTO
    mobile_money(libelle)
VALUES
    ('MVola'),
    ('Orange Money'),
    ('Airtel Money');

INSERT INTO
    type_paiement (libelle)
VALUES
    ('Espèces'),
    ('Mobile Money');

INSERT INTO paiement(id_commande,date) VALUES 
(1,'2026-10-17'),
(2,'2026-10-18');

INSERT into paiement_fille(id_paiement,id_type_paiement,id_mobile_money,montant,reference_transaction) VALUES
(1,1,NULL,10000,NULL),
(1,2,1,5000,'REF00001'),
(2,2,2,6000,'REF00002');