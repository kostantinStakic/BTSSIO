<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Injection SQL</title>
</head>
<body>

	<form method="post">
		Mail : <br>
		<input type="text" name="mail"><br>
		Mot de passe : <br>
		<input type="text" name="mdp"><br><br>
		<input type="submit" name="valider" value="VALIDER"><br>
	</form>


	<?php 
	// connexion à la bdd
	$conn = new mysqli("localhost","root","","logintest");

	if (isset($_POST['valider'])) {
		$mail = $_POST['mail'];
		$mdp = $_POST['mdp'];

		// création de la requête 

		$requete = "SELECT * FROM user WHERE mail = '$mail'
		AND mdp = '$mdp'";

		// on envoie la requête avec QUERY(), la méthode 
		// vulnérable

		$conn->query($requete);

		$lesResultats = $conn->get_result();

		foreach ($lesResultats as $unResultat) {
			echo "Connexion à la session de : " . $unResultat['mail'];
		}
	}

	?>



</body>
</html>