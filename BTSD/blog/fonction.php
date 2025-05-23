<?php
    // variables d'environnement et les options PHP
    $hostname = "localhost";
    $user = "root";
    $password = "";
    $dbname = "blogd";

    // connexion à la bdd
    $connect = new mysqli($hostname, $user, $password, $dbname);

    function connexion_User($connect, $mail, $mdp)

    {
        if ($connect == null) {
            return null;
            echo "problème de connexion à la bdd";
        }

        //création de la requête 
        $requete = "select * from auteur where mail = '$mail' and mdp ='$mdp' ";

        //Execution de la requête avec query()
        // !!!!! methode vulnérable : injection sql avec "' or 1 = 1 -- "
        $resultat = $connect->query($requete);

        return $resultat;
    }

    function selectWhereIdAut($connect, $id)

    {
        if ($connect == null) {
            return null;
        }

        //création de la requête 
        $requete = "select * from auteur where idaut = '$id'";

        //Execution de la requête avec query()
        // !!!!! methode vulnérable
        $resultat = $connect->query($requete);

        return $resultat;
    }
?>