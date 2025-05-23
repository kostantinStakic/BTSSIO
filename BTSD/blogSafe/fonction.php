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
        $requete = "select * from auteur where mail =? and mdp =? ";

        //on va preparer et executer nos requetes
        //pour empecher les attaques de injections SQL
        
        //preparation de la requete
        $stmt = $connect->prepare($requete);

        //association avec les types de variables attendues
        $stmt->bind_param("ss",$mail,$mdp);

        //execution
        $stmt->execute();

        //recupération du ou des résultats
        $resultat = $stmt->get_result();

        return $resultat;
    }

    function selectWhereIdAut($connect, $id)
    {
        if ($connect == null) {
            return null;
        }

        //création de la requête 
        $requete = "select * from auteur where idaut = ?";

        //preparation de la requete
        $stmt = $connect->prepare($requete);

        //association avec les types de variables attendues
        $stmt->bind_param("i",$id);

        //execution
        $stmt->execute();

        //recupération du ou des résultats
        $resultat = $stmt->get_result();

        return $resultat;
    }

    function selectAllArticles($connect)
    {
        if ($connect == null) {
            return null;
        }

        //création de la requête 
        $requete = "select * from auteur,article where auteur.idaut = article.idaut";

        //preparation de la requete
        $stmt = $connect->prepare($requete);

        //execution
        $stmt->execute();

        //recupération du ou des résultats
        $resultat = $stmt->get_result();

        return $resultat;
    }

    function insertArticle($connect,$titre,$contenu,$urlimage,$idaut)
    {
        if ($connect == null) {
            return null;
        }
        //création de la requête 
        $requete = "insert into article values(null,?,?,?,?)";

        //preparation de la requete
        $stmt = $connect->prepare($requete);

        $stmt->bind_param("sssi",$titre,$contenu,$urlimage,$idaut);

        //execution
        $stmt->execute();
    }

    function deleteArticle($connect,$idart)
    {
        if ($connect == null) {
            return null;
        }
        //création de la requête 
        $requete = "delete from article where idart=?";

        //preparation de la requete
        $stmt = $connect->prepare($requete);

        $stmt->bind_param("i",$idart);

        //execution
        $stmt->execute();
    }


?>