
from voirresultatrequetes import *
from voirtables import *
from supprimer import *
from ajouter import *
from isVol import *
from isVolPassageMax import *
from modifier import *

import psycopg2

print("Bienvenue sur notre base de donnée de gestion d'aeroport")
#input("Veuillez entrer le USER ")

HOST = "tuxa.sme.utc"
USER = "nf18p018"
PASSWORD = "IFs2f7EgOaQ3"
DATABASE = "dbnf18p018"

# Open connection
conn = psycopg2.connect("host=%s dbname=%s user=%s password=%s" % (HOST, DATABASE, USER, PASSWORD))

# Open a cursor to send SQL commands
cur = conn.cursor()

while True:
    print("Veuillez choisir ce que voulez faire :")
    print("1. Voir les tables")
    print("2. Ajouter un passager à un vol")
    print("3. Supprimer un passager d'un vol")
    print("4. Modifier un passager")
    print("5. Voir le résultat des requêtes")
    print("6. Quitter")

    choix = input("Entrez le numéro de l'action que vous souhaitez faire : ")

    if choix == "1" :
        nom_table = input("Entrez le nom de la table que vous voulez voir : ")
        print(nom_table)
        voir_table(cur, nom_table.strip())

    if choix == "2" :
        ajouter_Passage(cur)
        conn.commit()

    if choix == "3" :
        supp(cur)
        conn.commit()

    if choix == "4" :
        attribut = input("Entrez l'attribut de la table que vous voulez modifier : ")
        nv_val = input("Entrez la nouvelle valeur :  ")
        nom = input("Entrez le nom du passager :  ")
        prenom = input("Entrez le prenom du passager :  ")
        date_naissance = input("Entrez la date de naissance du passager (YYYY-MM-DD) :  ")

        modifier(cur, attribut.strip(), nv_val.strip(), nom.strip(), prenom.strip(), date_naissance.strip())
        conn.commit()

    if choix == "5" :
        print("Voici les 3 requêtes : ")
        print("Istanbul")
        print("A307")
        print("10 Compagnies")
        type_requete = input("Entrez le type de requête : ")
        voir_resultat_requete(cur, type_requete.strip())

    if choix == "6" :
        break

conn.close()
