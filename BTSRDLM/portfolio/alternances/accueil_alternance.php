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

    <h2>GESTION DES ALTERNANCES</h2><br>

    <h3>Inscription d'un étudiant</h3>

    <form method="post">
      <input type="text" name="nom" placeholder="Nom">
      <input type="text" name="prenom" placeholder="Prénom">
      <input type="text" name="adresse" placeholder="N° voie, nom de voie">
      <input type="text" name="mail" placeholder="exemple@exemple.com">
      <input type="text" name="telephone" placeholder="+33">

      <input type="submit" name="valider" value="INSCRIPTION">
    </form>

    <h3>Liste des étudiants</h3>

    <table border="1">
      
          <tr>
            <th>Identifiant</th>
            <th>Nom</th>
            <th>Prénom</th>
            <th>Adresse</th>
            <th>Mail</th>
            <th>Téléphone</th>
          </tr>

    <!-- connexion à la base de données -->
    <?php 

    $conn = new mysqli("localhost","root","","BTS1RD");
    
    // Création de la requête SQL pour afficher tous les étudiants

    $requete = "SELECT * FROM etudiant";

    // Méthode non sécurisée pour envoyer la requête avec la fonction QUERY()

    $lesEtudiants = $conn->query($requete);

    // on récupère puis on parcourt les résultats, pour chaque lignes
    // existantes on récupère dans chaque variable les attributs d'un étudiant
    

    foreach ($lesEtudiants as $unEtudiant) {
      $id_etu = $unEtudiant["id_etu"];
      $nom = $unEtudiant["nom_etu"];
      $prenom = $unEtudiant["prenom_etu"];
      $adresse = $unEtudiant["adresse_etu"];
      $mail = $unEtudiant["mail_etu"];
      $telephone = $unEtudiant["telephone_etu"]; 
      $niveau = $unEtudiant["niveau"];

      // on affiche chaque enregistrement dans le tableau

      echo "<tr>
              <td>" . $id_etu . "</td>
              <td>" . $nom . "</td>
              <td>" . $prenom . "</td>
              <td>" . $adresse . "</td>
              <td>" . $mail . "</td>
              <td>" . $telephone . "</td>
              <td>" . $niveau . "</td>
            </tr>";
      // On finit une itération puis on recommence s'il reste encore des enregistrements
      // puis une nouvelle ligne du tableau s'affiche
      // si c'est la fin, le tableau se ferme
    }

    ?>



    </table>

   </section>

    <!-- Pied de page -->
<?php include("../footer.php") ?>
  </div>
</body>
</html>


