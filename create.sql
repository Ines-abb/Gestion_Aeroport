
CREATE TABLE CompagnieVol(
    nom VARCHAR(40) PRIMARY KEY
);

CREATE TABLE CompagnieFabriquant(
    nom VARCHAR(40) PRIMARY KEY
);

CREATE TABLE Modele(
    nom VARCHAR(20) PRIMARY KEY,
    nb_passagers INTEGER NOT NULL CHECK(nb_passagers >= 0),
    vitesse_max FLOAT NOT NULL CHECK(vitesse_max >= 0),
    vitesse_rot_max FLOAT CHECK(vitesse_rot_max=NULL OR vitesse_rot_max>=0),
    poussee_max FLOAT CHECK (poussee_max=NULL OR poussee_max>=0),
    compagnieFabriquant VARCHAR(40) REFERENCES CompagnieFabriquant(nom) NOT NULL,
    t VARCHAR(40) NOT NULL CHECK (t = 'turbopropulseur' OR t = 'turboreacteur'),
    CHECK( NOT (t = 'turbopropulseur' AND (poussee_max IS NOT NULL) AND (vitesse_rot_max IS NULL))),
    CHECK( NOT (t = 'turboreacteur' AND (vitesse_rot_max IS NOT NULL) AND (poussee_max IS NULL)))
);

CREATE TABLE Terminal(
    nom VARCHAR(20) PRIMARY KEY,
    longitude FLOAT NOT NULL CHECK((longitude >= -180)AND(longitude <= 180)),
    latitude FLOAT NOT NULL CHECK((latitude >= -90) AND (latitude <= 90))
);

CREATE TABLE PorteEmbarquement(
    identifiant VARCHAR(20),
    terminal VARCHAR(20) REFERENCES Terminal(nom),
    PRIMARY KEY (identifiant, terminal)
);

CREATE TABLE Modele_Porte_Embarquement (
    modele VARCHAR(20) REFERENCES Modele(nom),
    identifiant_porte VARCHAR(20),
    terminal_porte VARCHAR(20),
    PRIMARY KEY (modele, identifiant_porte, terminal_porte),
    FOREIGN KEY (identifiant_porte, terminal_porte) REFERENCES PorteEmbarquement(identifiant,terminal)
);

CREATE TABLE Avion(
    identifiant VARCHAR(20) PRIMARY KEY,
    modele VARCHAR(20) NOT NULL REFERENCES Modele(nom)
);

CREATE TABLE Personne (
    nom VARCHAR(40),
    prenom VARCHAR(40),
    date_naissance DATE,
    PRIMARY KEY(nom,prenom,date_naissance)
);

CREATE TABLE Passager(
    nom VARCHAR(40),
    prenom VARCHAR(40),
    date_naissance DATE,
    adresse VARCHAR NOT NULL,
    numero_telephone VARCHAR(20) UNIQUE,
    PRIMARY KEY(nom,prenom,date_naissance),
    FOREIGN KEY(nom,prenom,date_naissance) REFERENCES Personne(nom,prenom,date_naissance) ON UPDATE CASCADE
);

CREATE TABLE PersonnelTechnique(
    id INTEGER PRIMARY KEY,
    numero_telephone VARCHAR(20) UNIQUE NOT NULL,
    nom VARCHAR(40) NOT NULL,
    prenom VARCHAR(40) NOT NULL,
    date_naissance DATE NOT NULL,
    adresse VARCHAR NOT NULL,
    terminal VARCHAR(20) REFERENCES Terminal(nom),
    FOREIGN KEY(nom,prenom,date_naissance) REFERENCES Personne(nom,prenom,date_naissance) ON UPDATE CASCADE
);

CREATE TABLE Steward(
    id INTEGER PRIMARY KEY,
    numero_telephone VARCHAR(20) UNIQUE NOT NULL,
    nom VARCHAR(40) NOT NULL,
    prenom VARCHAR(40) NOT NULL,
    date_naissance DATE NOT NULL,
    adresse VARCHAR NOT NULL,
    FOREIGN KEY(nom,prenom,date_naissance) REFERENCES Personne(nom,prenom,date_naissance) ON UPDATE CASCADE
);

CREATE TABLE Pilote(
    id INTEGER PRIMARY KEY,
    numero_telephone VARCHAR(20) UNIQUE NOT NULL,
    nom VARCHAR(40) NOT NULL,
    prenom VARCHAR(40) NOT NULL,
    date_naissance DATE NOT NULL,
    adresse VARCHAR NOT NULL,
    FOREIGN KEY(nom,prenom,date_naissance) REFERENCES Personne(nom,prenom,date_naissance) ON UPDATE CASCADE
);

CREATE TABLE HoteDAccueil(
    id INTEGER PRIMARY KEY,
    numero_telephone VARCHAR(20) UNIQUE NOT NULL,
    nom VARCHAR(40) NOT NULL,
    prenom VARCHAR(40) NOT NULL,
    date_naissance DATE NOT NULL,
    adresse VARCHAR NOT NULL,
    FOREIGN KEY(nom,prenom,date_naissance) REFERENCES Personne(nom,prenom,date_naissance) ON UPDATE CASCADE
);

CREATE TABLE Vol (
    id VARCHAR(20) PRIMARY KEY,
    compagnieVol VARCHAR(40) NOT NULL REFERENCES CompagnieVol(nom),
    avion VARCHAR(20) NOT NULL REFERENCES Avion(identifiant),
    pilote_1 INTEGER NOT NULL REFERENCES Pilote(id) ON UPDATE CASCADE,
    pilote_2 INTEGER NOT NULL REFERENCES Pilote(id) ON UPDATE CASCADE,
    porteEmbarquementId VARCHAR(20) NOT NULL,
    porteEmbarquementTerminal VARCHAR(20) NOT NULL ,
    FOREIGN KEY(porteEmbarquementId,porteEmbarquementTerminal) REFERENCES PorteEmbarquement(identifiant,terminal),
    CHECK (pilote_1 <> pilote_2)
);

CREATE TABLE Bagage(
    vol VARCHAR(20) REFERENCES Vol(id),
    passager_nom VARCHAR(40),
    passager_prenom VARCHAR(40),
    passager_date_naissance DATE,
    nombre_bagages INTEGER CHECK(nombre_bagages >= 0),
    poids_total_bagages FLOAT CHECK(poids_total_bagages>=0),
    PRIMARY KEY (vol, passager_nom, passager_prenom, passager_date_naissance),
    FOREIGN KEY (passager_nom, passager_prenom, passager_date_naissance) REFERENCES Passager(nom, prenom, date_naissance) ON UPDATE CASCADE
);

CREATE table Vol_Steward(
    vol VARCHAR(20) REFERENCES Vol(id),
    steward INTEGER REFERENCES Steward(id) ON UPDATE CASCADE,
    PRIMARY KEY (vol, steward)
);

CREATE TABLE VolDepart(
    id VARCHAR(20) REFERENCES Vol(id),
    destination VARCHAR(40) NOT NULL,
    heure_depart TIMESTAMP NOT NULL,
    heure_embarquement TIMESTAMP NOT NULL,
    hoteDAccueil_1 INTEGER NOT NULL REFERENCES HoteDAccueil(id) ON UPDATE CASCADE,
    hoteDAccueil_2 INTEGER NOT NULL REFERENCES HoteDAccueil(id) ON UPDATE CASCADE,
    PRIMARY KEY (id),
    CHECK((hoteDAccueil_1<>hoteDAccueil_2)AND(heure_depart>heure_embarquement))
);

CREATE TABLE VolArrive(
    id VARCHAR(20) REFERENCES Vol(id),
    provenance VARCHAR(40) NOT NULL,
    heure_arrivee TIMESTAMP NOT NULL,
    PRIMARY KEY (id)
);
