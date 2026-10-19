CREATE TABLE categorie_plat(
    id_categorie SERIAL PRIMARY KEY, 
    libelle VARCHAR(100)

);

INSERT INTO categorie_plat(libelle) VALUES
('Plat malagasy'),
('Plat chinois'),
('Soupe'),
('Dessert et goûter'),
('Boisson');

ALTER TABLE plats ADD COLUMN id_categorie INTEGER REFERENCES categorie_plat(id_categorie) on delete CASCADE;


UPDATE plats SET id_categorie = 1 WHERE categorie = 'Plat malagasy';
UPDATE plats SET id_categorie = 2 WHERE categorie = 'Plat chinois';
UPDATE plats SET id_categorie = 3 WHERE categorie = 'Soupe';
UPDATE plats SET id_categorie = 4 WHERE categorie = 'Dessert et goûter';
UPDATE plats SET id_categorie = 5 WHERE categorie = 'Boisson';

ALTER TABLE plats DROP COLUMN categorie ;

ALTER Table plats alter COLUMN id_categorie SET NOT NULL;

INSERT INTO categorie_plat(libelle) VALUES('glace');

UPDATE plats SET prix = 7500 WHERE id_plat=1;



