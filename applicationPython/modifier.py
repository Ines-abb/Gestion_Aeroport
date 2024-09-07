#!/usr/bin/python3

import psycopg2

def modifier(cursor, attribut, nv_val, nom, prenom, date_naissance):

    if (attribut == "nom") or (attribut == "prenom") or (attribut == "date_naissance"):
        cursor.execute(f"""
        UPDATE Personne
        SET {attribut} = '{nv_val}'
        WHERE (nom = '{nom}' AND prenom = '{prenom}' AND date_naissance = TO_DATE('{date_naissance}', 'YYYY-MM-DD'));
        """)

    cursor.execute(f"""
    UPDATE Passager
    SET {attribut} = '{nv_val}'
    WHERE (nom = '{nom}' AND prenom = '{prenom}' AND date_naissance = TO_DATE('{date_naissance}', 'YYYY-MM-DD'));
    """)

    print("Modification reussi ! ")
