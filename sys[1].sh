#!/bin/bash

echo "BIENVENUE SUR MON PROJET SYS"
echo "***************************"
echo "je suis TCHOPYANG ROBERT matricule 14A353FS en LICENCE 3 AR"
echo "***************************"
echo "CHOISISEZ  L'OPTION A EXECUTER"
echo "***************************"
echo " 1 - INFORMATIONS SUR LES UTILISATEURS ENREGISTRER IL Y A 3 JOURS"
echo "***************************"
echo " 2- ACQUISITION ET INSTALLATION DE XAMPP "
echo "***************************"
echo " 3- ARCHIVAGE DES ELEMENTS DU REPERTOIRE PERSONNEL MODIFIER PAR LE SUDOER IL Y A 2 JOURS"
echo "***************************"
echo " 4 - INFORMATIONS  D'UTILISATION DU DISQUE,MEMOIRE,PROCESSUS,SWAP  "
echo "***************************"
echo " 5 - QUITER   "
echo "***************************"

echo " FAITE VOTRE CHOIX " 
read -r choix
case $choix in 
    1) cut -d : -f 1 /etc/passwd>tt
	sleep 5
	ls /home>fil
	sleep 5
	while read line 
	do
		while read line1
		do	
		if [ $line == $line1 ] ; then 
		echo $line1>user1
		fi
		done<fil
	done<tt
	find /home/* -type d -ctime 3 -print>userx

	while read line1
	do
	   while read user
	   do 
	      if [ $line1 == '/home/'$user ] ; then
		echo " $user a ete cree il ya 2jour">end1.txt
	      fi

	  done<user1 
	done<userx  ;;
    2) 
	   #télechargement de xampp#
	     wget http://sourceforge.net/projects/xampp/files/XAMPP%20Linux/1.8.3/xampp-linux-1.8.3-2-installer.run/download
	     #wget http://sourceforge.net/projects/xampp/files/XAMPP%20Linux/1.8.3/xampp-linux-x64-1.8.3-2-installer.run/download
	   
	   #installation de xampp
		sudo chmod +x xampp-linux-x64-1.8.3-2-installer.run
		#sudo ./xampp-linux-x64-1.8.3-2-installer.run	
		
	   #lancement de xampp
		sudo /opt/lampp/lampp start ;;
    3)   ;;
    4)  
      free -m | awk 'NR==2{printf "Memory Usage: %s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }'
	 df -h | awk '$NF=="/"{printf "Disk Usage: %d/%dGB (%s)\n", $3,$2,$5}'
	 top -bn1 | grep load | awk '{printf "CPU Load: %.2f\n", $(NF-2)}'
		;;
    5)  exit;;
    *)   ;;
esac

