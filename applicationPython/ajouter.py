from isPassager import *
from isVol import *
from isVolPassageMax import *


def ajouter_Passage(cursor):
    print("Choisir quel passager voulez-vous ajouter : ")
    sql="SELECT P.nom, P.prenom, P.date_naissance FROM Passager P"
    cursor.execute(sql)

    ligne = cursor.fetchone()

    while ligne:
        print("Nom : ", ligne[0])
        print("Prenom : ", ligne[1])
        print("Date de naissance : ", ligne[2])

        ligne = cursor.fetchone()

    nom = input("Entrez le nom du passager que vous voulez ajouter : ")
    prenom = input("Entrez le prenom du passager que vous voulez ajouter : ")
    date_naissance = input("Entrez la de date naissance du passager que vous voulez ajouter (YYYY-MM-DD) : ")

    print("Choisir dans quel vol voulez-vous ajouter le passager : ")
    sql="SELECT V.id FROM Vol V"
    cursor.execute(sql)

    ligne = cursor.fetchone()

    while ligne:
        print("Numéro de Vol : ", ligne[0])
        ligne = cursor.fetchone()

    num_vol = input("Entrez le numéro de vol : ")


    if isPassager(cursor, nom,prenom, date_naissance):
        if isVol(cursor, num_vol):
            if isVolPassageMax(cursor, num_vol) :
                print("Vous avez dépassez le nombre maximal de passage !")
            else:
                nb_bagages = input("Entrez le nombre des bagages : ")
                poids_total_bagages = input("Entrez les poids totals des bagages : ")
                cursor.execute(f"""
                                INSERT INTO Bagage(vol, passager_nom, passager_prenom, passager_date_naissance, nombre_bagages, poids_total_bagages)
                                VALUES ('{num_vol}', '{nom}', '{prenom}', TO_DATE('{date_naissance}', 'YYYY-MM-DD'), {nb_bagages}, {poids_total_bagages});""")
                print("Le passager", nom, "\t", prenom, "\t", date_naissance, "\t", "a bien été ajouté à la base" )
        else:
            print(f"Le vol {num_vol} existe pas")
    else :
        print(f"Le passager {nom} {prenom} qui est né le {date_naissance} n'existe pas")
