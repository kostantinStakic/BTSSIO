<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Mon Portfolio</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <div class="wrapper">

    <?php

    include('nav.php');
    include('fonctions.php');

    ?>

    <!-- Section avec formulaire -->
    <section class="form-divers">
      <h2>Inscription</h2>
      <form action="#" method="post">
        <label for="name">Pseudo :</label>
        <input type="hidden" id="name" name="iduser" required value="<?php echo isset($_GET['action']) && $_GET['action'] === 'modifier' ? $_GET['iduser'] : ''; ?>">
        <input type="text" id="name" name="pseudo" required value="<?php echo isset($_GET['action']) && $_GET['action'] === 'modifier' ? $_GET['pseudo'] : ''; ?>">

        <label for="email">Email :</label>
        <input type="email" id="email" name="mail" required value="<?php echo isset($_GET['action']) && $_GET['action'] === 'modifier' ? $_GET['mail'] : ''; ?>">

        <label for="mdp">Mot de passe :</label>
        <input type="text" id="name" name="mdp" required value="<?php echo isset($_GET['action']) && $_GET['action'] === 'modifier' ? $_GET['mdp'] : ''; ?>">

        <?php echo isset($_GET['action']) && $_GET['action'] === 'modifier' ? '<button type="submit" name="modifier" value="Modifier">Modifier</button>' : '<button type="submit" name="valider" value="Valider">Valider</button>'; ?>

        
      </form>
    </section>

    <!-- Section avec tableau stylisé -->
    <section class="data-table">
      <h2>Liste des abonnés</h2>
      <table>
        <thead>
          <tr>
            <th>ID</th>
            <th>Pseudo</th>
            <th>Mail</th>
            <th>Mot de passe</th>
            <th></th>
          </tr>
        </thead>
        <tbody>

          <?php

          if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['modifier'])) {

            $iduser = $_POST['iduser'];
            $pseudo = $_POST['pseudo'];
            $mail = $_POST['mail'];
            $mdp = $_POST['mdp'];

            updateUser($pseudo, $mail, $mdp, $iduser);

            header('Location: bts1jvmag.php');
            exit();   
            
          }elseif ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['valider'])) {
            

            $pseudo = trim($_POST['pseudo']);
            $mail = trim($_POST['mail']);
            $mdp = trim($_POST['mdp']);
            
            insertUser($pseudo, $mail, $mdp);

            header('Location: bts1jvmag.php');
            exit();



          }

          if (isset($_GET['action']) && $_GET['action'] === 'supprimer') {

            $iduser = $_GET['iduser'];
            
            deleteUser($iduser);

            header('Location: bts1jvmag.php?*');
            exit();

          }



          echo getUserTableRows($host, $user, $password, $dbname);

          ?>
        </tbody>
      </table>
    </section>





    <!-- Pied de page -->
<?php

include('footer.php');

?>
  </div>
</body>
</html>
