# etape 1
plats (**id_plat**, nom, categorie, prix)

# etape 2
categorie (**id_categorie**, libelle)
modifier: plats (**id_plat**, nom, prix, #id_categorie)

# etape 3
commande (**id_commande**, date)
commande_plat(**id**, #id_plat, #id_commande)

# etape 4
client (**id_client**, nom)
modifier: commande (**id_commande**, date, #id_client)

# etape 5
serveur(**id_serveur**, nom)
tables (**id_tables**, numero)

# etape 6
mobile_money(**id_mobile_money**, libelle)
type_paiement(**id_type_paiement**, libelle)
paiement(**id_paiement_fille**,#id_paiement, #id_type_paiement, #id_mobile_money, montant, reference_transaction)



