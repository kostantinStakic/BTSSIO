<?php
include("bdd.php");
//connexion à la bdd avec l'extension mysqli()
// la classe mysqli(hostname,user,password,dbname)
$bdd = new mysqli($hostname,$user,$password,$dbname);

?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>BLOG</title>
</head>
<body>
	<form method="get">
		<input type="text" name="mail">
		<input type="text" name="mdp">
		<input type="reset" value="ANNULER">
		<input type="submit" name="login" value="LOGIN">
	</form>

	<table>
		<tr>
			<td><img src="images/riff.jpeg" width="400"></td>
			<td style="vertical-align: top;">
				<span style="font-weight: 900;">
				Titre
				</span>
				<p>Publication, bla bla bla ....
				</p>
			</td>
		</tr>
	</table>

</body>
</html>