def isVol(cursor,id):
    cursor.execute("""
    SELECT 1
    FROM Vol
    WHERE (id = %s)
    """,(id))
    res = cursor.fetchone()
    if res:
        return True
    else :
        return False
