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