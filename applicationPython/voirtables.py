

def voir_table(cursor, nom_table):
#    if ((nom_table != "Vol") or (nom_table != "Passager") or (nom_table != "Bagage") or (nom_table != "Avion")):
#        raise Exception("Nom de table non valide")

    sql = f"SELECT * FROM {nom_table};"
    cursor.execute(sql)

    row = cursor.fetchone()
    while row is not None:
        print(row)
        row = cursor.fetchone()
