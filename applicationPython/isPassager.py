#!/usr/bin/python3

import psycopg2

def isPassager(cursor, nom,prenom,date):
    cursor.execute("""
    SELECT *
    FROM Passager
    WHERE (nom = %s AND prenom  = %s AND date_naissance = %s)
    """,(nom,prenom,date))
    res = cursor.fetchone()
    if res:
        return True
    else :
        return False
