


#!/usr/bin/python3
def supp(cur):
    print("Choisir quel passager voulez-vous supprimer : ")
    sql="SELECT P.nom, P.prenom, P.date_naissance FROM Passager P"
    cur.execute(sql)

    ligne = cur.fetchone()

    while ligne:
        print("Nom : ", ligne[0])
        print("Prenom : ", ligne[1])
        print("Date de naissance : ", ligne[2])

        ligne = cur.fetchone()

    nom_passager = input("Entrez le nom du passager que vous voulez supprimer : ")
    prenom_passager = input("Entrez le prenom du passager que vous voulez supprimer : ")
    date_passager = input("Entrez la date de date naissance du passager que vous voulez supprimer : ")

    print("Choisir dans quel vol voulez-vous supprimer le passager : ")
    sql="SELECT V.id FROM Vol V"
    cur.execute(sql)

    ligne = cur.fetchone()

    while ligne:
        print("Numéro de Vol : ", ligne[0])
        ligne = cur.fetchone()

    num_vol = input("Entrez le numéro de vol : ")


    sql = f"""
    DELETE FROM Bagage B
    WHERE B.vol LIKE '{num_vol}'
    AND B.passager_nom LIKE '{nom_passager}'
    AND B.passager_prenom LIKE '{prenom_passager}'
    AND B.passager_date_naissance =  TO_DATE('{date_passager}', 'YYYY-MM-DD');
    """
    cur.execute(sql)

    print("Le passager ", nom_passager, "\t", prenom_passager, "\t", date_passager, "\t", "du vol", num_vol, "\t", "a bien été supprimé")
