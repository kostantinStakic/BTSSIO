<?php
/**
 * 
 */
class Modele
{

	//attributs de classe
	private $pdo;
	
	public function __construct()
	{
		$this->pdo = null;

		try {

			$this->pdo = new PDO("mysql:host=localhost;dbname=alternancebtsjv", "root","");
			
		} catch (Exception $e) {
			
			echo "Erreur de connexion";
		}

	}

	//les méthodes

	public function selectAllEtudiants()
	{
		//verifier si la connexion a bien eu lieu ou pas
		if ($this->pdo == null) {
			return null;
		}else{
			//requete en pdo
			$requete = "select * from etudiant";
			$stmt = $this->pdo->prepare($requete);
			$stmt->execute();

			return $stmt->fetchAll();

		}

		


	}

}
?>