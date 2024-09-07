
-- Requete 1

SELECT SUM(B.poids_total_bagages)
    FROM Bagage as B
        LEFT JOIN VolDepart as VD
            ON B.vol = VD.id
        LEFT JOIN VolArrive as VA
            ON B.vol = VA.id
    WHERE ((VD.destination = 'Istanbul') OR (VA.provenance = 'Istanbul'));


-- Requete 2 : Quel est le nombre de stewarde de chaque avion de model 'A307'

SELECT V.id, COUNT(*) as count
    FROM
    Vol_Steward as VS
    JOIN Vol as V on V.id = VS.vol
    JOIN Avion as A on V.avion = A.identifiant
    WHERE A.modele = 'A307'
    GROUP BY V.id;



-- Requete 3
SELECT cv.nom AS compagnie, COUNT(*) AS nombre_passagers
FROM Vol v
INNER JOIN CompagnieVol cv ON v.compagnieVol = cv.nom
INNER JOIN Bagage b ON v.id = b.vol
INNER JOIN Passager p ON b.passager_nom = p.nom AND b.passager_prenom = p.prenom AND b.passager_date_naissance = p.date_naissance
INNER JOIN VolDepart vd ON v.id = vd.id
GROUP BY cv.nom
ORDER BY nombre_passagers DESC
LIMIT 10;
