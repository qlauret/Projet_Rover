# Projet_Rover
projet du groupe E, exercice Rover
Suivre le schéma des dépendances fait en cours.

Potentiel répartition des tâches:

Mission Control 
1- Il convertis les commandes de l’opérateur par des instructions simple 
2- Il envoie ses instructions via la Communication. 
3- Il attend une ou plusieurs réponse depuis la Communication. 
4- Cartographie la planète selon la réponse reçu 

Rover 
1- Il attend une ou plusieurs instructions depuis la Communication. 
2- Execute la ou les instructions 
3- Renvoie à chaque instructions des informations via la Communication. 

Topologie 
1- Gère ses obstacles 
2- Gère la position du Rover. 
	-vérifie si l’instruction du Rover est possible ou non 
	-renvoie les informations aux Rover 
3- 

Communication 
1- Mettre end place l’Adapter (socket, TCP, port) 2- Créer 2 interfaces qui communiqueront entre elles via l’Adapter (sender, receiver) 
3- Permettre de faire transiter les informations
