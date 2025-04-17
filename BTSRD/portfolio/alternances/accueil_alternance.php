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

<section class="form-divers" id="section2">

  <!-- création d'un formulaire pour insertion dans la bdd -->

  <form method="post">
    
    <input type="text" name="nom" placeholder="Nom"><br>
    <input type="text" name="prenom" placeholder="Prénom"><br>
    <input type="text" name="adresse" placeholder="Adresse"><br>
    <input type="text" name="mail" placeholder="e-mail"><br>
    <input type="text" name="telephone" placeholder="+33"><br>

    <input type="submit" name="valider" value="VALIDER">

  </form>

  <h1>GESTION DES ALTERNANCES</h1><br>

  <h3>Liste des étudiants</h3>

  <table border="1">
    <tr>
      <th>identifiant</th>
      <th>Nom</th> 
      <th>Prénom</th>           
      <th>Adresse</th> 
      <th>Mail</th>
      <th>Téléphone</th>
    </tr>

    <?php

    // connexion à la bdd grace à mysqli

    $conn = new mysqli("localhost","root","","alternanceBTSRD");

    if (isset($_POST['valider'])) {

      $nom = $_POST['nom'];
      $prenom = $_POST['prenom'];
      $adresse = $_POST['adresse'];
      $mail = $_POST['mail'];
      $telephone = $_POST['telephone'];

      echo "<h1>Bonjour ".  $nom ."</h1>";


    }

    // créer la requête SQL

    $requete = "SELECT * FROM etudiant";

    // Et on va executer la requete avec QUERY()
    // ATTENTION Pas du tout sécurisé!
    // On récupère les resultats dans une variable tableau

    $lesResultats = $conn->query($requete);

    // on récupère les attributs un par un dans les 
    // variables correspondantes

    foreach ($lesResultats as $unResultat) {
      $id_etu = $unResultat["id_etu"];
      $nom_etu = $unResultat["nom_etu"];
      $prenom_etu = $unResultat["prenom_etu"];
      $adresse_etu = $unResultat["adresse_etu"];
      $mail_etu = $unResultat["mail_etu"];
      $telephone_etu = $unResultat["telephone_etu"];

      echo "<tr>

              <td>".$id_etu."</td>
              <td>".$nom_etu."</td>
              <td>".$prenom_etu."</td>
              <td>".$adresse_etu."</td>
              <td>".$mail_etu."</td>
              <td>".$telephone_etu."</td>

            </tr>";

    }

    // On affiche les résultats dans le tableau 

    ?>

  </table>

</section>

  <!-- Pied de page -->
  <?php include("../footer.php") ?>
  </div>

</body>

</html>


