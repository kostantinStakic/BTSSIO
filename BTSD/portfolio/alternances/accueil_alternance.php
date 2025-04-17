<?php
mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
// Déclaration des variables utiles (bonnes pratiques)
$host = "localhost";
$user = "root";
$password = "123";
$dbname = "alternancebtsd";
$motif = '/^[A-Za-z0-9.-_]+@[A-Za-z0-9.-_]+\.[FRfrCOMcomORGorgnetNETGOUVgouv]{2,4}$/';

// LES FONCTIONS

function selectEtudiant($mail,$mdp,$conn,$motif)
{

  if ($conn == null) {
    return null;
  }

  if (preg_match($motif, $mail)) {

 // méthode avec preparation et execution de la requete
 $requete = "SELECT * FROM etudiant WHERE mail_etu = ? AND mdp = ?";

 // on utilise la fonction sécurisée prepare pour préparer la requete afin de la dissocier du SQL

 $stmt = $conn->prepare($requete);

 // on associe les variables (avec leur type)
 // au type attendu dans la bdd

 $stmt->bind_param("ss",$mail,$mdp);

 // on peut maintenant executer la requete

 $stmt->execute();

 // on récupère les résultats dans un tableau

 $lesResultats = $stmt->get_result();

 return $lesResultats;

  }else{
    echo "Format du mail invalide";
  }
}

?>

<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Gestion Alternance</title>
  <link rel="stylesheet" type="text/css" href="../style.css">
</head>

<body>
  <div class="wrapper">
    <!-- Barre de navigation fixe -->

  <?php include("../nav.php") ?>

  <body>
    

  <section class="form-divers" id="section2">
  <h3>Liste des étudiants</h3>
  <form method="post">

    <input type="text" name="mail" placeholder="email">
    <input type="text" name="mdp" placeholder="Mot de passe">

    <input type="submit" name="valider" value="CONNEXION">
    
  </form> 

    <?php

    try{
      $conn = new mysqli($host,$user,$password,$dbname);
    }catch(msqli_sql_exception $e)
    {
      echo "Erreur de connexion : " . $e->getMessage();
      $conn = null;
    }
    
     //Vérification de la validation du formulaire
     if (isset($_POST['valider'])) {
       $mail = htmlspecialchars(trim($_POST['mail']));
       $mdp = htmlspecialchars(trim($_POST['mdp']));

       // on appelle la fonction selectEtudiant() et on récupère les resultats dans une variable

       $lesResultats = selectEtudiant($mail,$mdp,$conn,$motif);

       // on parcourt le tableau et on affiche les résultats
       if ($lesResultats) {
        foreach ($lesResultats as $unResultat) {
         $nom = trim($unResultat['nom_etu']);
         $prenom = trim($unResultat['prenom_etu']);
         echo "Bonjour " . $prenom . ", connexion réussie à votre session";
       }
       }


     }

    ?>

  </section>

  </body>    

    <!-- Pied de page -->
<?php include("../footer.php") ?>
  </div>
</body>
</html>


