<?php
  session_start();
  include("fonction.php");

  if (isset($_GET['valider'])) {
  
    $mail = $_GET['mail'];
    $mdp = $_GET['mdp'];

    $resultat = connexion_User($connect, $mail, $mdp);

    if (!$resultat)
      echo "utilisateur inconnu";
    else{
      foreach ($resultat as $auteur) {
        header("Location: accueil.php?id=".$auteur['idaut']);
        exit();
      }
    }
  }
?>

<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta charset="utf-8">
  <title>BLOG</title>
</head>
<body>
  <form method="get">
    <input type="text" name="mail" placeholder="mail">
    <input type="text" name="mdp" placeholder="Mot de passe">
    <input type="submit" name="valider" value="login">
  </form><br>

  <!-- affichage des articles du blog -->
  <?php
  $resultat = selectAllArticles($connect);

  foreach ($resultat as $article) {

    $titre = $article["titre"];
    $contenu = $article["contenu"];
    $pseudo = $article["pseudo"];
    $image = $article["urlimage"];

      echo "  <table border='1'>
            <tr>
              <td><img src='".$image."' width='150'></td>
              <td style='vertical-align: top;' width='500'>
                <span style='font-weight: 900;'>".$titre."</span>
                <p>".$contenu."</p>
                <p style='text-align:right;'><i>".$pseudo."</i></p>
              </td>
            </tr>
          </table>
        ";
  }

  ?>

</body>
</html>