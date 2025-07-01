<table>
	<tr>
		<th>Nom</th>
		<th>Prénom</th>
		<th>Mail</th>
	</tr>

<?php


foreach ($lesEtudiants as $unEtudiant) {
	$nom = $unEtudiant["nom_etu"];
	$prenom = $unEtudiant["prenom_etu"];
	$mail = $unEtudiant["mail_etu"];

	echo "	<tr>
				<td>" . $nom . "</td>
				<td>" . $prenom . "</td>
				<td>" . $mail . "</td>
			</tr>";
}

?>

</table>