def voir_resultat_requete(cursor, type_requete):
    #if ((type_requete != "Istanbul") or (type_requete != "A307") or (type_requete != "10 Compagnies")):
    #    raise Exception("Type de requete non valide")

    sql = ""

    if(type_requete == "Istanbul"):
        sql = """
        SELECT SUM(B.poids_total_bagages)
    FROM Bagage as B
        LEFT JOIN VolDepart as VD
            ON B.vol = VD.id
        LEFT JOIN VolArrive as VA
            ON B.vol = VA.id
    WHERE ((VD.destination = 'Istanbul') OR (VA.provenance = 'Istanbul'));
        """
    if (type_requete == "A307"):
        sql = """
        SELECT V.id, COUNT(*) as count
    FROM
    Vol_Steward as VS
    JOIN Vol as V on V.id = VS.vol
    JOIN Avion as A on V.avion = A.identifiant
    WHERE A.modele = 'A307'
    GROUP BY V.id;
        """
    if (type_requete == "10 Compagnies"):
        sql = """
        SELECT cv.nom AS compagnie, COUNT(*) AS nombre_passagers
FROM Vol v
INNER JOIN CompagnieVol cv ON v.compagnieVol = cv.nom
INNER JOIN Bagage b ON v.id = b.vol
INNER JOIN Passager p ON b.passager_nom = p.nom AND b.passager_prenom = p.prenom AND b.passager_date_naissance = p.date_naissance
INNER JOIN VolDepart vd ON v.id = vd.id
GROUP BY cv.nom
ORDER BY nombre_passagers DESC
LIMIT 10;
        """

    cursor.execute(sql)

    row = cursor.fetchone()
    while row is not None:
        print(row)
        row = cursor.fetchone()
