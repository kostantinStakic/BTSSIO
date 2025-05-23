<?php
	include("fonction.php");

	$id = $_GET['id'];
	$resultat = selectWhereIdAut($connect, $id);

	foreach ($resultat as $auteur) {
		$pseudo = $auteur['pseudo'];
		echo $id;
	}
?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>BLOG</title>
</head>
<body>
<!--	
	<script type="text/javascript">
		alert("tu payes ou tu crèves");
	</script>
-->
<br>
<a href="index.php">retour</a>
</body>
</html>
