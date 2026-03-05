#!/bin/sh

#fonction 1
initialiser_base() {
	if [ ! -f "tasks.txt" ]; then
	   touch tasks.txt
	   echo "fichier tasks.txt cree avec succes"
	else
	   echo "Le Fichier task.txt existe deja"
	fi

	git add tasks.txt 2>/dev/null || true
	git commit -m "feat: ajout fonction initialiser_base" 2>/dev/null || echo "Aucun changement a committer"
}

	#Fonction pour initialiser la base de donnees
	initialiser_base() {
		if [ .f "tasks.txt" ]; then
		    echo "La base de donnees tasks.txt existe deja"
		else
		    touch tasks.txt
		    echo "base de donnees tasks.txt creer avec succes"
		fi
}

#fonction 2
afficher_toutes_tache() {
	if [ -f "tasks.txt" ]; then
	    echo "=== Liste des taches ==="
	    cat tasks.txt
	else
	    echo "Erreur : Base non initialisee"
	fi
}

source fonctions_taches.sh

echo "Tache 1" > tasks.txt
echo "taches 2" >> tasks.txt

git add fonctions_taches.sh
git commit -m 'feat : ajout fonction afficher_toutes_taches'


#Fonction 4
restoreData() {
    # Vérifier que le fichier de backup existe
    if [ -f tasks_backup.txt ]; then
        # Copier le backup vers tasks.txt
        cp tasks_backup.txt tasks.txt
        echo "Base restaurée depuis la sauvegarde"

        # Commit Git
        git add tasks.txt
        git commit -m "feat: ajout fonction restaurer_base"
    else
        echo "Aucune sauvegarde disponible"
    fi
}



#!/bin/sh

initialiser_base() {
	local fichier="tasks.txt"

	# Vérification avec chemin absolu pour plus de fiabilité
	if [ -e "$fichier" ]; then
		echo "Le fichier $fichier existe déjà dans le répertoire courant"
		return 0
	fi  # Correction: ajout du 'fi' manquant

	# Tentative de création avec vérification 
	if touch "$fichier" 2>/dev/null; then
		echo "Fichier $fichier créé avec succès"

		# Vérification que le fichier est bien créé
		if [ -f "$fichier" ]; then
			echo "Permissions : $(ls -l "$fichier" | cut -d' ' -f1)"  # Correction: -l au lieu de _l
		fi 
	else 
		echo "Erreur : impossible de créer $fichier"
		echo "Vérifiez vos permissions dans ce répertoire" 
		return 1
	fi
	
	# Git avec gestion d'erreur améliorée
	if git rev-parse --git-dir > /dev/null 2>&1; then 
		git add "$fichier"  # Correction: suppression du 'S' en trop
		git commit -m "feat: ajout fonction initialiser_base" || \
			echo "Aucun changement détecté pour le commit"
	else
		echo "Répertoire non versionné avec git (commit ignoré)"
	fi
}

# Suppression de la deuxième fonction en double

# Appel de la fonction
initialiser_base

	
# appel de la fonction
sauvegarder_base
 
	sauvegarder_base() {
	if [-f"tasks.txt"];then
		cp tasks.txt tasks_backup.txt

		echo"Sauvegarde créer:tasks_backup.txt"

		git add tasks_backup.txt
		git commit-m"feat:ajout fonction sauvegarder_base"
	else
		echo"Erreur:tasks.txt n'existe pas"
		return 1 
	fi
}



# appel de la fonction
supprimer_base 

	supprimer_base() {

 	 if[-f"tasks.txt"];then
	   echo"Le fichier tasks.txt va etre supprimé"

	   echo "Etes-vous sur de vouloir supprimer tasks.txt?(oui ou non)"


	   if["$reponse" ="oui"] || ["$reponse" ="o"] || ["$reponse" ="O"] || ["$reponse" ="OUI"];then

	   rm tasks.txt
	   echo"Fichier tsks.txt supprimer tasks avec succès"


	   git add tasks.txt
	   git commit -m "feat:ajout fonction supprimer_base"
	   echo"Commiteffectué
	 else
           echo "Suppression annulée"
	 fi
	else 
	  echo"Erreur:tasks.txt n'existe pas"
	 fi
}
