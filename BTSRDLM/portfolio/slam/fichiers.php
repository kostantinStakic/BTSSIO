<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Mon Portfolio</title>
  <link rel="stylesheet" href="../style.css">
</head>
<body>
  <div class="wrapper">
    <!-- Barre de navigation fixe -->
    <?php include('../nav.php') ?>
  


    
    <!-- Section avec formulaire -->
    <section class="form-divers" id="section2">
  
      <h2>Les fichiers</h2>
      <form method="post">

        <label for="message">Message :</label>
        <textarea id="message" name="texte" rows="5" required></textarea>

        <button type="submit">Valider</button>
      </form>
  
    
  

    <?php
    if ($_SERVER['REQUEST_METHOD'] === 'POST' && !empty($_POST['texte'])) {
        /*
        on utilise la fonction trim() pour supprimer 
        les espaces eventuels en début et en fin du texte*/
        $texte = trim($_POST['texte'] . "\n");

        //ouverture du fichier
        $fichier = fopen("fichier.txt", "a");
        //on écrit dans le fichier ainsi ouvert
        fwrite($fichier, $texte);
        /*
        on ferme ensuite fichier afin de ne pas 
        saturer notre espace mémoire(optimisation)
        */
        fclose($fichier);
        header('Location: fichier.php');
        exit();
        

        
      }

        echo "<pre>";
        $fichier = fopen("fichier.txt", "r");
        while (!feof($fichier)) {
        $caractere = fgetc($fichier) ;
        echo $caractere;
        }
        echo "</pre>";
        fclose($fichier);



    

    ?>  
</section>    
<footer>
  <div class="footer-content">
    <p>&copy; 2025 Mon Portfolio. Tous droits réservés.</p>

  </div>
</footer>
  </div>
</body>
</html>
