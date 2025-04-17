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
<?php include('../nav.php'); ?>

		<!-- Bandeau avec image d'arrière-plan -->
		<section class="banner2">
			<div class="banner-text">
				<h1>Option : SLAM</h1>
				<p>Voici les travaux et projets réalisés de la première à la seconde année de BTS SIO, option SLAM</p>
			</div>
		</section>

		<!-- Section principale avec des boutons animés -->
		<section class="content">
			<h2>Mon travail</h2>
			<div class="buttons">
				<a href="" class="btn">
		<div class="image-container">
				<img src="../images/projet1.png" alt="alternatives">
				<div class="overlay">Les alternatives</div>
		</div>
	</a>
				<a href="" class="btn">
	<div class="image-container">
					<img src="../images/projet2.png" alt="boucles">
				<div class="overlay">Les boucles</div>
		</div>
	</a>
				<a href="" class="btn">
	<div class="image-container">
					<img src="../images/projet2.png" alt="tableaux">
				<div class="overlay">Les tableaux</div>
		</div>
	</a>
				<a href="" class="btn">
	<div class="image-container">
					<img src="../images/projet2.png" alt="fonctions">
				<div class="overlay">Les fonctions</div>
		</div>
	</a>
				<a href="fichiers.php" class="btn">
	<div class="image-container">
					<img src="../images/projet2.png" alt="fichiers">
				<div class="overlay">Les fichiers</div>
		</div>
	</a>
				<!-- Autres boutons -->
			</div>
		</section>

		<section class="content">
			<h2>Les langages utilisés</h2>
			<div class="buttons">
				<a href="" class="btn">
		<div class="image-container">
				<img src="../images/projet1.png" alt="PHP">
				<div class="overlay">PHP</div>
		</div>
	</a>
				<a href="" class="btn">
	<div class="image-container">
					<img src="../images/projet2.png" alt="C">
				<div class="overlay">Langage C</div>
		</div>
	</a>
				<a href="" class="btn">
	<div class="image-container">
					<img src="../images/projet2.png" alt="SQL">
				<div class="overlay">SQL</div>
		</div>
	</a>
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

<?php include('../footer.php')?>

	</div>
</body>
</html>
