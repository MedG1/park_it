Les étapes d'avancement du code : 

Pendant chaque étape j'ai réalisé en même temps le style et la mise en forme des différentes composantes (boutons, cards,rectangles,textes etc..).

1)développement de la page "parking_selection.dart" : 
-réalisation du bouton de triage (sort by).
-dans components,réaliser le modèle de la barre de sélection "selection_card.dart"
-ajouter les variables de la distance,places vides dans l'affichage du modèle.
-afficher le modèle sous forme d'une liste (ListView.separated) en précisant le nombre de parking affichés et leurs nom.
2) développement de la page "reservation_page.dart" :
-indiquer au début le nom du parking à réserver aligné à gauche.
-créer la zone oû on va afficher la position du parking dans google maps.
-créer et positionner des boutons qui indiquent les détails sur la réservation (prix,distance,places vides..)
-dans components,créer le bouton qui répresente les places vides dans un parking. et le mettre en couleur vert. Le nom du fichier est "spot_card.dart"
-même chose pour "occ_spot_card.dart" dans components qui s'agit d'un bouton en rouge représentant les places occupés.
-dans "reservation_page.dart" ,afficher les boutons crées "spot_card.dart" et "occ_spot_card.dart" et les trier selon l'ordre et l'état du parking en prenant en compte l'espacement entre les places du parking.
3) créer la barrière de confirmation dans le fichier "confirmation.dart", qui s'affiche lorsqu'on clique sur une place du parking : 
-choisir la forme et la taille de container
-demander le code confidentiel et créer textfield pour taper le code confidentiel. 
