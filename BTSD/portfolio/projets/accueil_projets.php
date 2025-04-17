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
	<header>
<?php include('../nav.php') ?>
	</header>

		<!-- Bandeau avec image d'arrière-plan -->
		<section class="banner2">
			<div class="banner-text">
				<h1>Mes projets</h1>
				<p>Voici les travaux et projets réalisés de la première à la seconde année de BTS SIO, option SLAM</p>
			</div>
		</section>

		<!-- Section principale avec des boutons animés -->
		<section class="content">
			<h2>Bandcamp : music only</h2>

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


<?php include('../footer.php') ; ?>


	</div>
</body>
</html>
