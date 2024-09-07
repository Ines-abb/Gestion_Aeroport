
INSERT INTO CompagnieVol(nom) VALUES ('Air France');
INSERT INTO CompagnieVol(nom) VALUES ('Transavia');
INSERT INTO CompagnieVol(nom) VALUES ('Easyjet');
INSERT INTO CompagnieVol(nom) VALUES ('RyanAir');

INSERT INTO CompagnieFabriquant(nom) VALUES ('Boeing');
INSERT INTO CompagnieFabriquant(nom) VALUES ('Airbus');
INSERT INTO CompagnieFabriquant(nom) VALUES ('Textron');
INSERT INTO CompagnieFabriquant(nom) VALUES ('Avic');

INSERT INTO Modele(nom, nb_passagers, vitesse_max, vitesse_rot_max, poussee_max, compagnieFabriquant, t)
VALUES ('A307', 300, 800, 0.0, 7.5, 'Airbus', 'turboreacteur');
INSERT INTO Modele(nom, nb_passagers, vitesse_max, vitesse_rot_max, poussee_max, compagnieFabriquant, t)
VALUES ('737', 350, 850, 0.0, 6.5, 'Boeing', 'turboreacteur');
INSERT INTO Modele(nom, nb_passagers, vitesse_max, vitesse_rot_max, poussee_max, compagnieFabriquant, t)
VALUES ('A321', 200, 900, 125.5 , 0, 'Airbus', 'turbopropulseur');
INSERT INTO Modele(nom, nb_passagers, vitesse_max, vitesse_rot_max, poussee_max, compagnieFabriquant, t)
VALUES ('707', 250, 920, 134.5 , 0, 'Boeing', 'turbopropulseur');

INSERT INTO Terminal(nom, longitude, latitude)
VALUES ('2C', 130.2, -32.4);
INSERT INTO Terminal(nom, longitude, latitude)
VALUES ('1A', -100.2, 84.4);
INSERT INTO Terminal(nom, longitude, latitude)
VALUES ('4', 172.2, 61.4);
INSERT INTO Terminal(nom, longitude, latitude)
VALUES ('1', 142.2, -52.4);

INSERT INTO PorteEmbarquement(identifiant, terminal)
VALUES (1,'2C');
INSERT INTO PorteEmbarquement(identifiant, terminal)
VALUES (2,'1A');
INSERT INTO PorteEmbarquement(identifiant, terminal)
VALUES (3,'4');
INSERT INTO PorteEmbarquement(identifiant, terminal)
VALUES (4,'1');

INSERT INTO Avion(identifiant, modele)
VALUES ('aa307','A307');
INSERT INTO Avion(identifiant, modele)
VALUES ('bb737','737');
INSERT INTO Avion(identifiant, modele)
VALUES ('aa321','A321');
INSERT INTO Avion(identifiant, modele)
VALUES ('bb707','707');

INSERT INTO Personne(nom, prenom, date_naissance)
VALUES ('Chazal','Claire', TO_DATE('17-06-1978', 'DD-MM-YYYY'));
INSERT INTO Personne(nom, prenom, date_naissance)
VALUES ('Boulot','Gille', TO_DATE('12-04-1981', 'DD-MM-YYYY'));
INSERT INTO Personne(nom, prenom, date_naissance)
VALUES ('Pujadas','Antoine', TO_DATE('21-03-1967', 'DD-MM-YYYY'));
INSERT INTO Personne(nom, prenom, date_naissance)
VALUES ('Nguyen','Etienne', TO_DATE('17-06-1985', 'DD-MM-YYYY'));
INSERT INTO Personne(nom, prenom, date_naissance)
VALUES ('Dupont', 'Jean', TO_DATE('06-06-1960', 'DD-MM-YYYY'));
INSERT INTO Personne(nom, prenom, date_naissance)
VALUES ('Durand', 'Julien', TO_DATE('15-12-1999', 'DD-MM-YYYY'));
INSERT INTO Personne(nom, prenom, date_naissance)
VALUES ('Legrand', 'Julie', TO_DATE('17-05-1975', 'DD-MM-YYYY'));
INSERT INTO Personne(nom, prenom, date_naissance)
VALUES ('Lepetit', 'Elise', TO_DATE('12-01-1982', 'DD-MM-YYYY'));
INSERT INTO Personne(nom, prenom, date_naissance)
VALUES ('Chimbert', 'Pascal',TO_DATE('04-06-2002', 'DD-MM-YYYY'));
INSERT INTO Personne(nom, prenom, date_naissance)
VALUES ('Alloui', 'Sebastien',TO_DATE('17-01-1962', 'DD-MM-YYYY'));
INSERT INTO Personne(nom, prenom, date_naissance)
VALUES ('Fratty', 'Claire',TO_DATE('05-09-1994', 'DD-MM-YYYY'));
INSERT INTO Personne(nom, prenom, date_naissance)
VALUES ('Pesquet', 'Amelie',TO_DATE('29-11-1976', 'DD-MM-YYYY'));
INSERT INTO Personne(nom, prenom, date_naissance)
VALUES ('Li', 'Franck',TO_DATE('16-04-1981', 'DD-MM-YYYY'));
INSERT INTO Personne(nom, prenom, date_naissance)
VALUES ('Fontaine', 'Gaelle',TO_DATE('30-07-1997', 'DD-MM-YYYY'));
INSERT INTO Personne(nom, prenom, date_naissance)
VALUES ('Hugo', 'Paul',TO_DATE('26-12-2000', 'DD-MM-YYYY'));
INSERT INTO Personne(nom, prenom, date_naissance)
VALUES ('Macron', 'Lucie',TO_DATE('11-11-1992', 'DD-MM-YYYY'));
INSERT INTO Personne(nom, prenom, date_naissance)
VALUES ('Borne', 'Claire',TO_DATE('11-11-1992', 'DD-MM-YYYY'));
INSERT INTO Personne(nom, prenom, date_naissance)
VALUES ('Lemaire', 'Ronan',TO_DATE('10-02-1961', 'DD-MM-YYYY'));
INSERT INTO Personne(nom, prenom, date_naissance)
VALUES ('Lepen', 'Angélique',TO_DATE('22-04-1968', 'DD-MM-YYYY'));
INSERT INTO Personne(nom, prenom, date_naissance)
VALUES ('Mélanchon', 'Nora',TO_DATE('02-10-1988', 'DD-MM-YYYY'));

INSERT INTO Passager(nom, prenom, date_naissance, adresse, numero_telephone)
VALUES ('Chazal','Claire', TO_DATE('17-06-1978', 'DD-MM-YYYY'), '2 boulevard Jean Moulin', '0745322964');
INSERT INTO Passager(nom, prenom, date_naissance, adresse, numero_telephone)
VALUES ('Boulot','Gille', TO_DATE('12-04-1981', 'DD-MM-YYYY'), '2 Rue de Rennes', '0745321964');
INSERT INTO Passager(nom, prenom, date_naissance, adresse, numero_telephone)
VALUES ('Pujadas','Antoine', TO_DATE('21-03-1967', 'DD-MM-YYYY'), '128 rue de Vaugirard', '0741322964');
INSERT INTO Passager(nom, prenom, date_naissance, adresse, numero_telephone)
VALUES ('Nguyen','Etienne', TO_DATE('17-06-1985', 'DD-MM-YYYY'), '2 avenue de La Fontaine', '0740322964');

INSERT INTO PersonnelTechnique(id, numero_telephone, nom, prenom, date_naissance, adresse, terminal)
VALUES (1, '0665525211', 'Dupont', 'Jean', TO_DATE('06-06-1960', 'DD-MM-YYYY'), '3 rue Victor Hugo', '2C');
INSERT INTO PersonnelTechnique(id, numero_telephone, nom, prenom, date_naissance, adresse, terminal)
VALUES (2, '0785869452', 'Durand', 'Julien', TO_DATE('15-12-1999', 'DD-MM-YYYY'), '17 avenue Guynemer', '1A');
INSERT INTO PersonnelTechnique(id, numero_telephone, nom, prenom, date_naissance, adresse, terminal)
VALUES (3, '0732654236', 'Legrand', 'Julie', TO_DATE('17-05-1975', 'DD-MM-YYYY'), '23 boulevard Rolland Garos', '4');
INSERT INTO PersonnelTechnique(id, numero_telephone, nom, prenom, date_naissance, adresse, terminal)
VALUES (4, '0611572364', 'Lepetit', 'Elise', TO_DATE('12-01-1982', 'DD-MM-YYYY'), '3 rue Anatole France', '1');

INSERT INTO Steward(id, numero_telephone, nom, prenom, date_naissance, adresse)
VALUES (1, '0625352694', 'Chimbert', 'Pascal',TO_DATE('04-06-2002', 'DD-MM-YYYY'), '17 avenue Paul Hochard');
INSERT INTO Steward(id, numero_telephone, nom, prenom, date_naissance, adresse)
VALUES (2, '0741526581', 'Alloui', 'Sebastien',TO_DATE('17-01-1962', 'DD-MM-YYYY'), '21 rue Raspail');
INSERT INTO Steward(id, numero_telephone, nom, prenom, date_naissance, adresse)
VALUES (3, '0752526485', 'Fratty', 'Claire',TO_DATE('05-09-1994', 'DD-MM-YYYY'), '4 allé Marie Curie');
INSERT INTO Steward(id, numero_telephone, nom, prenom, date_naissance, adresse)
VALUES (4, '0661430622', 'Pesquet', 'Amelie',TO_DATE('29-11-1976', 'DD-MM-YYYY'), '39 boulevard de Port Royal');

INSERT INTO Pilote(id, numero_telephone, nom, prenom, date_naissance, adresse)
VALUES (1, '0665525452', 'Li', 'Franck',TO_DATE('16-04-1981', 'DD-MM-YYYY'), '12 avenue Maurice Ocagne');
INSERT INTO Pilote(id, numero_telephone, nom, prenom, date_naissance, adresse)
VALUES (2, '0665251525', 'Fontaine', 'Gaelle',TO_DATE('30-07-1997', 'DD-MM-YYYY'), '1 rue Robespierre');
INSERT INTO Pilote(id, numero_telephone, nom, prenom, date_naissance, adresse)
VALUES (3, '0752544458', 'Hugo', 'Paul',TO_DATE('26-12-2000', 'DD-MM-YYYY'), '3 boulevard Rouget de Lisle');
INSERT INTO Pilote(id, numero_telephone, nom, prenom, date_naissance, adresse)
VALUES (4, '0742533964', 'Macron', 'Lucie',TO_DATE('11-11-1992', 'DD-MM-YYYY'), '27 allé Dathe');

INSERT INTO HoteDAccueil(id, numero_telephone, nom, prenom, date_naissance, adresse)
VALUES (1, '0742533964', 'Borne', 'Claire',TO_DATE('11-11-1992', 'DD-MM-YYYY'), '27  rue Roger Cottolenc');
INSERT INTO HoteDAccueil(id, numero_telephone, nom, prenom, date_naissance, adresse)
VALUES (2, '0664528654', 'Lemaire', 'Ronan',TO_DATE('10-02-1961', 'DD-MM-YYYY'), '4  rue du Dépôt');
INSERT INTO HoteDAccueil(id, numero_telephone, nom, prenom, date_naissance, adresse)
VALUES (3, '0785756652', 'Lepen', 'Angélique',TO_DATE('22-04-1968', 'DD-MM-YYYY'), '17 boulevard Denfert Rochereau');
INSERT INTO HoteDAccueil(id, numero_telephone, nom, prenom, date_naissance, adresse)
VALUES (4, '0742522964', 'Mélanchon', 'Nora',TO_DATE('02-10-1988', 'DD-MM-YYYY'), '2 boulevard Alésia');

INSERT INTO Vol(id, compagnieVol, avion, pilote_1, pilote_2, porteEmbarquementId, porteEmbarquementTerminal)
VALUES (1, 'Air France', 'aa307', 1, 4, 1, '2C');
INSERT INTO Vol(id, compagnieVol, avion, pilote_1, pilote_2, porteEmbarquementId, porteEmbarquementTerminal)
VALUES (2, 'Transavia', 'aa321', 1, 2, 2, '1A');
INSERT INTO Vol(id, compagnieVol, avion, pilote_1, pilote_2, porteEmbarquementId, porteEmbarquementTerminal)
VALUES (3, 'Easyjet', 'bb737', 3, 1, 3, '4');
INSERT INTO Vol(id, compagnieVol, avion, pilote_1, pilote_2, porteEmbarquementId, porteEmbarquementTerminal)
VALUES (4, 'RyanAir', 'bb707', 3, 4, 4, '1');

INSERT INTO Bagage(vol, passager_nom, passager_prenom, passager_date_naissance, nombre_bagages, poids_total_bagages)
VALUES (1, 'Boulot', 'Gille', TO_DATE('12-04-1981', 'DD-MM-YYYY'), 2, 18.2);
INSERT INTO Bagage(vol, passager_nom, passager_prenom, passager_date_naissance, nombre_bagages, poids_total_bagages)
VALUES (2, 'Chazal','Claire', TO_DATE('17-06-1978', 'DD-MM-YYYY'), 1, 10.2);
INSERT INTO Bagage(vol, passager_nom, passager_prenom, passager_date_naissance, nombre_bagages, poids_total_bagages)
VALUES (3, 'Pujadas','Antoine', TO_DATE('21-03-1967', 'DD-MM-YYYY'), 4, 52.2);
INSERT INTO Bagage(vol, passager_nom, passager_prenom, passager_date_naissance, nombre_bagages, poids_total_bagages)
VALUES (4, 'Nguyen','Etienne', TO_DATE('17-06-1985', 'DD-MM-YYYY'), 1, 8.2);

INSERT INTO Vol_Steward(vol, steward)
VALUES (1, 4);
INSERT INTO Vol_Steward(vol, steward)
VALUES (2, 4);
INSERT INTO Vol_Steward(vol, steward)
VALUES (4, 2);
INSERT INTO Vol_Steward(vol, steward)
VALUES (3, 3);

INSERT INTO VolDepart(id, destination, heure_depart, heure_embarquement, hoteDAccueil_1, hoteDAccueil_2)
VALUES (1, 'Berlin',  TO_TIMESTAMP('01-01-2023 17:30:00','DD-MM-YYYY HH24:MI:SS'), TO_TIMESTAMP('01-01-2023 17:00:00','DD-MM-YYYY HH24:MI:SS'), 2, 4);
INSERT INTO VolDepart(id, destination, heure_depart, heure_embarquement, hoteDAccueil_1, hoteDAccueil_2)
VALUES (2, 'Londres',  TO_TIMESTAMP('01-01-2023 15:30:00','DD-MM-YYYY HH24:MI:SS'), TO_TIMESTAMP('01-01-2023 15:00:00','DD-MM-YYYY HH24:MI:SS'), 1, 3);
INSERT INTO VolDepart(id, destination, heure_depart, heure_embarquement, hoteDAccueil_1, hoteDAccueil_2)
VALUES (3, 'Madrid',  TO_TIMESTAMP('01-01-2023 09:30:00','DD-MM-YYYY HH24:MI:SS'), TO_TIMESTAMP('01-01-2023 09:00:00','DD-MM-YYYY HH24:MI:SS'), 3, 1);
INSERT INTO VolDepart(id, destination, heure_depart, heure_embarquement, hoteDAccueil_1, hoteDAccueil_2)
VALUES (4, 'Istanbul',  TO_TIMESTAMP('01-01-2023 03:30:00','DD-MM-YYYY HH24:MI:SS'), TO_TIMESTAMP('01-01-2023 03:00:00','DD-MM-YYYY HH24:MI:SS'), 4, 2);


INSERT INTO VolArrive(id, provenance, heure_arrivee)
VALUES (1, 'Rome', TO_TIMESTAMP('01-01-2023 14:30:00','DD-MM-YYYY HH24:MI:SS'));
INSERT INTO VolArrive(id, provenance, heure_arrivee)
VALUES (2, 'Prague', TO_TIMESTAMP('01-01-2023 13:30:00','DD-MM-YYYY HH24:MI:SS'));
INSERT INTO VolArrive(id, provenance, heure_arrivee)
VALUES (3, 'Barcelone', TO_TIMESTAMP('01-01-2023 12:30:00','DD-MM-YYYY HH24:MI:SS'));
INSERT INTO VolArrive(id, provenance, heure_arrivee)
VALUES (4, 'Lisbone', TO_TIMESTAMP('01-01-2023 11:30:00','DD-MM-YYYY HH24:MI:SS'));

INSERT INTO Modele_Porte_Embarquement(modele, identifiant_porte, terminal_porte)
VALUES ('A307',1,'2C');
INSERT INTO Modele_Porte_Embarquement(modele, identifiant_porte, terminal_porte)
VALUES ('A307',2,'1A');
INSERT INTO Modele_Porte_Embarquement(modele, identifiant_porte, terminal_porte)
VALUES ('737',3,'4');
INSERT INTO Modele_Porte_Embarquement(modele, identifiant_porte, terminal_porte)
VALUES ('A321',4,'1');
