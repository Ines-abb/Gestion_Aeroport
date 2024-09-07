# Gestion de l'Aéroport Brice de Nice

## Introduction

Le projet "Gestion de l'Aéroport Brice de Nice" vise à développer une base de données robuste pour gérer les terminaux, vols, personnels et passagers de l'aéroport. Ce projet inclut la conception d'un modèle UML détaillé, la création d'une application Python pour l'interaction avec la base de données, ainsi que l'utilisation de bases de données SQL et NoSQL pour répondre aux différents besoins de gestion.

## Objectifs

L'objectif principal de ce projet est de créer une base de données efficace qui permet de :

- Gérer les informations sur les terminaux et les portes d'embarquement.
- Suivre les détails des avions, y compris leurs modèles et caractéristiques.
- Enregistrer et gérer les informations sur les vols, y compris les horaires, les destinations, les pilotes, les stewards et les passagers.
- Assurer le suivi des membres du personnel et de leurs rôles au sein de l'aéroport.

## Conception du Système

### Modèle UML

Le modèle UML a été conçu pour représenter les entités suivantes :

- **Terminal** : Contient un nom, une localisation GPS (longitude et latitude), et plusieurs portes d'embarquement.
- **Porte d'Embarquement** : Dessert un ou plusieurs modèles d'avions.
- **Avion** : Identifié par un identifiant, possède un modèle (avec des attributs comme le nombre de passagers, la vitesse maximale, le nom, et la compagnie de fabrication), et est soit à turbopropulseurs, soit à turboréacteurs.
- **Vol** : Identifié par un code unique, géré par une compagnie, et classé comme vol départ ou vol arrivée, avec des informations sur les horaires, les pilotes, les stewards et les passagers.
- **Passager** : Contient des informations personnelles telles que nom, prénom, date de naissance, adresse, et optionnellement un numéro de téléphone.
- **Personnel** : Inclut des pilotes, des stewards, des hôtes d'accueil et du personnel technique, avec des informations comme l'identifiant unique, le nom, prénom, date de naissance, adresse et numéro de téléphone.

### Technologies Utilisées

- **Langage de Programmation** : Python pour le développement de l'application.
- **Base de Données SQL** : Utilisée pour la gestion des données relationnelles.
- **Base de Données NoSQL** : Utilisée pour gérer les données non structurées et les besoins spécifiques du projet.

## Fonctionnalités

L'application développée permet de :

- Interagir avec les bases de données SQL et NoSQL pour la gestion des informations aéroportuaires.
- Réaliser des requêtes spécifiques pour obtenir des informations clés, telles que :

    1. **Poids des bagages** : Calculer le poids total des bagages pour les vols en départ et en arrivée à destination de Istanbul.
    2. **Nombre moyen de stewards** : Calculer le nombre moyen de stewards sur les vols opérés par les avions de modèle A307.
    3. **Top 10 des compagnies** : Identifier les 10 compagnies ayant eu le plus de passagers sur les vols en partance de l'aéroport.



