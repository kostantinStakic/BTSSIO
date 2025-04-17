<?php
// activation des options de levée d'erreur et d'exception
// permet d'activer try catch
mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
// on importe la connexion à la bdd définit dans BDD.php
include('../bdd.php');

// on teste la connexion à la bdd
try {
  $conn = new mysqli($host,$user,$password,$dbname);
  $conn->set_charset("utf8"); // bonne pratique
  echo "Connexion réussie !";
// on récupère le message d'erreur sans afficher le fatal error
} catch (mysqli_sql_exception $e) {
  echo "Erreur de connexion : " . $e->getMessage();
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
    
   <section class="form-divers" id="section2">

   </section>

    <!-- Pied de page -->
<?php include("../footer.php") ?>
  </div>
</body>
</html>


