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
    <!-- Barre de navigation fixe -->
<?php
include('nav.php');
?>

    <!-- Bandeau avec image d'arrière-plan -->
    <section class="banner">
      <div class="banner-text">
        <h1>Bienvenue sur mon portfolio</h1>
        <p>Découvrez mes projets et mon parcours en BTS SIO à l'école IRIS</p>
      </div>
    </section>

    <!-- Section principale avec des boutons animés -->
    <section class="content">
      <h2>Mes projets</h2>
      <div class="buttons">
        <a href="bts1jvmag.php" class="btn">
    <div class="image-container">
        <img src="../images/projet1.png" alt="Abonnement">
        <div class="overlay">Abonnements magasines</div>
    </div>
	</a>
        <a href="alternances/accueil_alternance.php" class="btn">
	<div class="image-container">
          <img src="../images/projet2.png" alt="PROJET 2">
        <div class="overlay">Gestion des Alternances</div>
    </div>
	</a>
        <!-- Autres boutons -->
      </div>
    </section>

    <section class="mini-cv">
  <h2>Mes compétences</h2>
  <p>Voici un aperçu de mes compétences acquises durant le BTS SIO.</p>

  <div class="skills">
    <div class="skill">
      <span>Développement Web (HTML/CSS/JS)</span>
      <div class="progress-bar">
        <div class="progress" style="width: 85%;">85%</div>
      </div>
    </div>
    
    <div class="skill">
      <span>PHP / MySQL</span>
      <div class="progress-bar">
        <div class="progress" style="width: 75%;">75%</div>
      </div>
    </div>
    
    <div class="skill">
      <span>Python</span>
      <div class="progress-bar">
        <div class="progress" style="width: 80%;">80%</div>
      </div>
    </div>
    
    <div class="skill">
      <span>Administration Réseau</span>
      <div class="progress-bar">
        <div class="progress" style="width: 70%;">70%</div>
      </div>
    </div>
    
    <div class="skill">
      <span>Cybersécurité</span>
      <div class="progress-bar">
        <div class="progress" style="width: 65%;">65%</div>
      </div>
    </div>
    
    <div class="skill">
      <span>Gestion de Projet (ITIL, SCRUM)</span>
      <div class="progress-bar">
        <div class="progress" style="width: 60%;">60%</div>
      </div>
    </div>
  </div>
</section>


    <!-- Section avec formulaire -->
    <section class="form-divers" id="section2">
      <h2>Contactez-moi</h2>
      <form action="#" method="post">
        <label for="name">Nom :</label>
        <input type="text" id="name" name="name" required>

        <label for="email">Email :</label>
        <input type="email" id="email" name="email" required>

        <label for="message">Message :</label>
        <textarea id="message" name="message" rows="5" required></textarea>

        <button type="submit">Envoyer</button>
      </form>
    </section>

    

    <!-- Pied de page -->
<?php

include('footer.php');

?>
  </div>
</body>
</html>
