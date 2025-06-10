<?php
//inclure la page bdd.php
include("bdd.php");
$conn = new mysqli($hostname, $username, $password, $dbname);
// Vérification de la connexion
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if (isset($_GET['valider'])) {
    // sécurisation de la recupération des données
    // saisies, grace à la fonction htmlspecialchars()
    // le programme interprete les balises html comme du code et ne permet plus les injections de type xss (javascript)
    $mail = htmlspecialchars(trim($_GET['mail']));
    $mdp = htmlspecialchars(trim($_GET['mdp']));
    
    //le pire des trucs
    $requete = "select * from auteur where mail=? and mdp=?";

    //on va preparer notre quete
    //class = moule constitué d'attributs de class
    //objet = instanciation de class
    //méthodes = fonctions au sein de la class
    $stmt = $conn->prepare($requete);

    //on va associer les données saisies aux types 
    //correspondants des attributs de la bdd
    $stmt->bind_param("ss",$mail,$mdp);

    //on va executer la requete
    $stmt->execute();
    $resultat = $stmt->get_result();

    foreach ($resultat as $auteur) {
        $id = $auteur["id_aut"];
      
        header("Location: connexion.php?id=" . $id);      
    }

}

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blog</title>
</head>
<body>


    <!-- formulaire de connexion d'un auteur -->
    <form method="get">
        <input type="text" name="mail" placeholder="mail">
        <input type="text" name="mdp" placeholder="Mot de passe">
        <input type="submit" name="valider" value="connexion">  
    </form>

    <h1>Blog des rappeurs westcoast</h1>

    <?php
    echo "  <table border='1'>
                <tr>
                    <td><img src='images/riffraff.jpeg' width='200'></td>
                    <td>TITRE + ARTICLE</td>
                </tr>
            </table>";
    ?>


</body>
</html>