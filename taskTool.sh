#Ajouter une tâche

addTask(){
	read -p "Donner une description de la tâche" "description"
	
	#comptage de ligne
	nbr_ligne=$(wc -l < tasks.txt)
	
	ID=$(( nbr_ligne + 1 ))

	echo "$ID;$description;0" >> tasks.txt

	git add tasks.txt
	git commit -m "feat: ajout fonction ajouter_tâche"
	


}

#Supprimer Tâche

rmvTask(){
	read -p "Indiquer l'ID de la tâche à supprimer" "ID_removeTask"
	> temp.txt
	#parcourir les lignes
    
	while read  ligne
	do
		id_ligne=$(echo "$ligne" | cut -d ';' -f1)

        	if [ "$id_ligne" != "$ID_removeTask" ]
        	then
            		echo "$ligne" >> temp.txt
       		fi
	done < tasks.txt

	mv temp.txt tasks.txt
	
	git add tasks.txt
	git commit -m "feat : ajout fonction supprimer_tâche"
	
}


#Marquer Tâche terminé

doneTask(){
	read -p "Indiquer l'ID de la tâche terminé" "ID_doneTask"
	 #parcourir les lignes
     > temp.txt
            while read ligne
            do
                id_ligne=$(echo "$ligne" | cut -d ';' -f1)
                desc=$(echo "$ligne" | cut -d ';' -f2)
                statut=$(echo "$ligne" | cut -d ';' -f3)

                if [ "$id_ligne" = "$ID_doneTask" ]; then
                    echo "$id_ligne;$desc;1" >> temp.txt
                else
                    echo "$ligne" >> temp.txt
                fi
            done < tasks.txt

         mv temp.txt tasks.txt

         git add tasks.txt
         git commit -m "feat : ajout fonction marquer_treminée"


}

#Afficher tâches
afficher_taches() {
    # Vérifier que le fichier existe
    if [ ! -f tasks.txt ]; then
        echo "Le fichier tasks.txt n'existe pas."
        return 1
    fi


    echo "==========================="
    echo "       LISTE DES TACHES     "
    echo "==========================="

    # Parcourir le fichier ligne par ligne
    while read ligne
    do
        # Séparer les champs
        id=$(echo "$ligne" | cut -d ';' -f1)
        desc=$(echo "$ligne" | cut -d ';' -f2)
        statut=$(echo "$ligne" | cut -d ';' -f3)

        # Afficher selon le statut
        if [ "$statut" = "1" ]; then
            echo "[TERMINEE] $id - $desc"
        else
            echo "[EN COURS] $id - $desc"
        fi
    done < tasks.txt

   
    git add tasks.txt
    git commit -m "feat: ajout fonction afficher_taches"
}

