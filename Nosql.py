import pymongo
from datetime import datetime
MONGO_URI = 'mongodb://localhost'
MONGO_DB = 'test'
print("Bienvenue sur notre base de donnée de gestion d'aeroport")

client = pymongo.MongoClient(MONGO_URI)
db = client[MONGO_DB]



while True:
    print("Veuillez choisir ce que voulez faire :")
    print("1. Voir la liste de vols")
    print("2. Ajouter un passager à un vol")
    print("3. Supprimer un passager d'un vol")
    print("4. Voir le résultat des requêtes 1 et 3")
    print("5. Quitter")

    choix = input("Entrez le numéro de l'action que vous souhaitez faire : ")
    #Voir la liste de vols
    if choix == "1" :
        print("Voici la liste des vols : ")
        if(db['Vol'].find() == None):
            print("Il n'y a pas de vol")
        else :
            for vol in db['Vol'].find({},{ "id": 1 , "_id":0}):
                print(vol['id'])
            vol_select  = input('Sélectionnez un vol id (le code entre les apostrophes) pour voir les informations associées : ')
            query = {"id": vol_select}
            for vol_info in db['Vol'].find(query):
                print(f"Vol ID: {vol_info['id']} | Compagnie: {vol_info['compagnie']} | Avion: {vol_info['avion']['id']} - {vol_info['avion']['modele']['nom']}")
                print(f"Départ: {vol_info['provenance']} -> Destination: {vol_info['destination']}")
                print(f"Heure Départ: {vol_info['heureDepart'].strftime('%Y-%m-%d %H:%M')} | Heure Embarquement: {vol_info['heureEmbarquement'].strftime('%Y-%m-%d %H:%M')} | Heure Arrivée: {vol_info['heureArrivee'].strftime('%Y-%m-%d %H:%M')}")
                print("Pilotes:")
                print(f"  1. {vol_info['pilote_1']['prenom']} {vol_info['pilote_1']['nom']} | Tel: {vol_info['pilote_1']['tel']}")
                print(f"  2. {vol_info['pilote_2']['prenom']} {vol_info['pilote_2']['nom']} | Tel: {vol_info['pilote_2']['tel']}")

                print("Passagers:")
                for passager in vol_info['passagers']:
                    print(f"  - {passager['prenom']} {passager['nom']} | Tel: {passager['tel']} | Bagages: {passager['bagage']['nombre']} pièces, {passager['bagage']['poidsTotal']} kg")


    #Ajouter un passager à un vol (avec ses bagages)
    if choix == "2" :
        print("Choisir quel passager voulez-vous ajouter : ")
        for passager in db['Vol'].find({},{ "passagers.nom": 1, "passagers.prenom": 1, "passagers.ddn": 1, "passager.tel":1, "_id":0 }):
            print(passager,'\n')
        nom = input("Entrez le nom du passager que vous voulez ajouter : ")
        prenom = input("Entrez le prenom du passager que vous voulez ajouter : ")
        date_naissance = input("Entrez la de date naissance du passager que vous voulez ajouter (YYYY-MM-DD) : ")
        tel = input("Entrez Tel :")
        date_naissance = date_naissance.split('-')
        date_naissance = datetime(int(date_naissance[0]), int(date_naissance[1]), int(date_naissance[2]), 0, 0)
        print("Choisir dans quel vol voulez-vous ajouter le passager : ")
        for vol in db['Vol'].find({},{ "id": 1, "_id":0  }):
            print(vol,'\n')
        num_vol = input("Entrez le numéro de vol : ")
        if(db['Vol'].find_one({"passagers.nom":nom,"passagers.prenom":prenom,"passagers.ddn":date_naissance, "_id":0 })):
            if(db['Vol'].find_one({"id":num_vol})):
                if(db['Vol'].find_one({"id":num_vol,"passagers.nom":nom,"passagers.prenom":prenom,"passagers.ddn":date_naissance,  "_id":0 })):
                    print(db['Vol'].find_one({"id":num_vol,"passagers.nom":nom,"passagers.prenom":prenom,"passagers.ddn":date_naissance,  "_id":0 }))
                    print("Le passager est déjà dans ce vol")
                else:
                    nb_bagages = input("Entrez le nombre des bagages : ")
                    poids_total_bagages = input("Entrez les poids totals des bagages : ")
                    db['Vol'].update_one({"id":num_vol},{"$push":{"passagers":{"nom":nom,"prenom":prenom,"ddn":date_naissance,"tel":tel,"bagage":{"nombre":nb_bagages,"poidsTotal":poids_total_bagages}}}})
                    print(f"Le passager {nom} {prenom} a bien été ajouté au vol {num_vol}")
            else:
                print(f"Le vol {num_vol} existe pas")
        else :
            print(f"Le passager {nom} {prenom} qui est né le {date_naissance} n'existe pas")
    #Supprimer un passager d'un vol
    if choix == "3" :
        print("Choisir quel passager voulez-vous supprimer : ")
        for passager in db['Vol'].find({},{ "passagers.nom": 1, "passagers.prenom": 1, "passagers.ddn": 1 , "_id":0 }):
            print(passager,'\n')
        nom = input("Entrez le nom du passager que vous voulez supprimer : ")
        prenom = input("Entrez le prenom du passager que vous voulez supprimer : ")
        date_naissance = input("Entrez la de date naissance du passager que vous voulez supprimer (YYYY-MM-DD) : ")
        #date_format = "%Y-%m-%d"
        #date_naissance = datetime.strptime(date_naissance, date_format)
        date_naissance = date_naissance.split('-')
        date_naissance = datetime(int(date_naissance[0]), int(date_naissance[1]), int(date_naissance[2]), 0, 0)
        print("Choisir dans quel vol voulez-vous supprimer le passager : ")
        for vol in db['Vol'].find({},{ "id": 1, "_id":0 }):
            print(vol,'\n')
        num_vol = input("Entrez le numéro de vol : ")
        if(db['Vol'].find_one({"id":num_vol})):
            if(db['Vol'].find_one({"id":num_vol,"passagers.nom":nom,"passagers.prenom":prenom,"passagers.ddn":date_naissance})):
                result = db['Vol'].update_one({"id":num_vol},{"$pull":{"passagers":{"nom":{"$eq" : nom},"prenom":{"$eq" : prenom},"ddn":{"$eq" : date_naissance}}}})
                print(f"Le passager {nom} {prenom} a bien été supprimé du vol {num_vol}")
            else:
                print(f"Le passager {nom} {prenom} qui est né le {date_naissance} n'existe pas dans le vol {num_vol}")
        else:
            print(f"Le vol {num_vol} existe pas")
    #Voir le résultat des requêtes 1 et 3
    if choix == "4" :
        print("Voici les 2 requêtes : ")
        print("Istanbul")
        print("10 Compagnies")
        type_requete = input("Entrez le type de requête : ")
        #le poids des bagages venant et partant pour Istanbul
        if type_requete == "Istanbul":
            query = [
                {
                    "$match":{
                        "$or" :[
                            {"provenance":"Istanbul"},
                            {"destination":"Istanbul"}
                        ]
                    }
                },
                {
                    "$group":{
                        "_id":None,
                        "poids_total_bagages":{"$sum":"$passagers.bagage.poidsTotal"}
                    }
                }
            ]
            for poids in db['Vol'].aggregate(query):
                print(poids)


        #les 10 compagnies ayant le plus de passagers
        if type_requete == "10 Compagnies":
            query = [
                {
                    "$match":{
                        "destination":{"$exists":True}
                    }
                },
                {
                    "$group":{
                        "_id":"$compagnie",
                        "nombre_passagers":{"$sum": {"$size" :"$passagers"}}
                    }
                },
                {
                    "$sort":{"nombre_passagers":-1}
                },
                {
                    "$limit":10
                }
            ]
            for compagnie in db['Vol'].aggregate(query):
                print(compagnie)
    if choix == "5" :
        break
