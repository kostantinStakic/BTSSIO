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

    <input type="text" name="mail">
    <input type="text" name="mdp">

    <input type="submit" name="valider" value="CONNEXION">
    
  </form> 

    <?php
    //Connexion à la bdd
    $conn = new mysqli("localhost","root","","alternancebtsd");
    
    //vérification de la connexion à la bdd
    if ($conn->connect_error) {
       die("Echec de connexion : " . $conn->connect_error);
     }

     //Vérification de la validation du formulaire
     if (isset($_POST['valider'])) {
       $mail = $_POST['mail'];
       $mdp = $_POST['mdp'];
      
      // méthode vulnérable avec mysqli et query()
      $requete = "SELECT * FROM etudiant WHERE mail_etu = '$mail' AND mdp = '$mdp'";

       // on utilise la fonction non sécurisée QUERY (pour la science)

       $lesResultats = $conn->query($requete);
       
       foreach ($lesResultats as $unResultat) {
         $nom = trim($unResultat['nom_etu']);
         $prenom = trim($unResultat['prenom_etu']);
         echo "Bonjour " . $prenom . ", connexion réussie à votre session";
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


