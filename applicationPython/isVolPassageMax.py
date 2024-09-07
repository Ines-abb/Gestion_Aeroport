def isVolPassageMax(cursor,id):
    cursor.execute("""
    SELECT COUNT(*) AS current_passengers, m.nb_passagers AS max_passengers
    FROM Vol v
    JOIN Bagage b ON v.id = b.vol
    JOIN Avion a ON v.avion = a.identifiant
    JOIN Modele m ON a.modele = m.nom
    WHERE v.id = %s
    GROUP BY m.nb_passagers
    """, (id,))
    result = cursor.fetchone()
    if result:
        current_passengers, max_passengers = result
        return current_passengers >= max_passengers
    else:
        return False