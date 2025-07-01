<?php
include("modeles/modele.php");

/**
 * 
 */
class Controleur
{

	private $unModele;
	
	public function __construct()
	{
		$this->unModele = new Modele();
	}

	public function selectAllEtudiants()
	{
		$lesEtudiants = $this->unModele->selectAllEtudiants();
		return $lesEtudiants;
	}


}
?>