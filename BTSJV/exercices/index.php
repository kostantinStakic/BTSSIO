<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Injection SQL</title>
</head>
<body>

	<form method="post">
		<input type="text" name="mail"><br>
		<input type="text" name="mdp"><br>
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

		$lesResultats = $conn->query($requete);

		foreach ($lesResultats as $unResultat) {
			echo "Connexion à la session de : " . $unResultat["mail"];
		}
	}

	?>



</body>
</html>