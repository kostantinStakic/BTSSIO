<?php

include('bdd.php');

function getUserTableRows($host, $user, $password, $dbname) {
    // Établir la connexion à la base de données
    $bdd = new mysqli($host, $user, $password, $dbname);

    // Vérification de la connexion
    if ($bdd->connect_error) {
        die("Erreur de connexion : " . $bdd->connect_error);
    }

    // Définition de la requête SQL pour récupérer tous les utilisateurs
    $select = "SELECT * FROM user";

    // Préparation de la requête SQL
    $stmt = $bdd->prepare($select);
    if (!$stmt) {
        die("Erreur lors de la préparation de la requête : " . $bdd->error);
    }

    // Exécution de la requête préparée
    $stmt->execute();

    // Récupération des résultats sous forme d'objet
    $lesResultats = $stmt->get_result();

    // Initialisation d'une variable pour stocker le code HTML
    $html = '';

    // Parcours de chaque résultat pour générer une ligne du tableau
    foreach ($lesResultats as $unResultat) {
        $html .= "
        <tr>
            <td>" . htmlspecialchars($unResultat['iduser']) . "</td>
            <td>" . htmlspecialchars($unResultat['pseudo']) . "</td>
            <td>" . htmlspecialchars($unResultat['mail']) . "</td>
            <td>" . htmlspecialchars($unResultat['mdp']) . "</td>
            <td>
                <a href='bts1jvmag.php?action=modifier&iduser=" . urlencode($unResultat['iduser']) .
                    "&pseudo=" . urlencode($unResultat['pseudo']) .
                    "&mail=" . urlencode($unResultat['mail']) .
                    "&mdp=" . urlencode($unResultat['mdp']) . "'>
                    <img src='../images/modifier.png' width='20px'></a>
                <a href='bts1jvmag.php?action=supprimer&iduser=" . urlencode($unResultat['iduser']) . "'>
                    <img src='../images/supprimer.png' width='20px'></a>
            </td>
        </tr>";
    }

    // Fermeture du statement et de la connexion
    $stmt->close();
    $bdd->close();

    // Retourne le code HTML généré
    return $html;
}

function insertUser($pseudo, $mail, $mdp) {
    // Nettoyage des entrées : supprime les espaces superflus
    $pseudo = trim($pseudo);
    $mail = trim($mail);
    $mdp = trim($mdp);

    // Établir la connexion à la base de données
    $bdd = new mysqli("localhost", "root", "", "btsjvlogin");

    // Vérifier si la connexion a échoué
    if ($bdd->connect_error) {
        die("Échec de la connexion : " . $bdd->connect_error);
    }

    // Préparer la requête SQL d'insertion avec des espaces réservés pour les paramètres
    $query = "INSERT INTO user VALUES (NULL, ?, ?, ?)";
    $stmt = $bdd->prepare($query);

    // Vérifier si la préparation a échoué
    if (!$stmt) {
        die("Erreur lors de la préparation de la requête : " . $bdd->error);
    }

    // Lier les paramètres aux espaces réservés :
    // "sss" indique que les trois paramètres sont des chaînes de caractères
    $stmt->bind_param("sss", $pseudo, $mail, $mdp);

    // Exécuter la requête préparée
    if (!$stmt->execute()) {
        die("Erreur lors de l'exécution de la requête : " . $stmt->error);
    }

    // Fermer le statement et la connexion pour libérer les ressources
    $stmt->close();
    $bdd->close();

    // Retourner true pour indiquer que l'insertion s'est déroulée correctement
    return true;
}

function deleteUser($iduser) {
    // Établir la connexion à la base de données
    $bdd = new mysqli("localhost", "root", "", "btsjvlogin");

    // Vérifier la connexion
    if ($bdd->connect_error) {
        die("Erreur de connexion : " . $bdd->connect_error);
    }

    // Définir la requête SQL de suppression avec un espace réservé pour l'identifiant
    $delete = "DELETE FROM user WHERE iduser = ?";

    // Préparer la requête
    $stmt = $bdd->prepare($delete);
    if (!$stmt) {
        die("Erreur lors de la préparation de la requête : " . $bdd->error);
    }

    // Lier le paramètre : "i" indique un entier
    $stmt->bind_param("i", $iduser);

    // Exécuter la requête
    if (!$stmt->execute()) {
        die("Erreur lors de l'exécution de la requête : " . $stmt->error);
    }

    // Fermeture du statement et de la connexion
    $stmt->close();
    $bdd->close();

    // Retourner true pour indiquer le succès de la suppression
    return true;
}

function updateUser($pseudo, $mail, $mdp, $iduser) {
    // Connexion à la base de données "nomdelabdd"
    $mysqli = new mysqli("localhost", "root", "", "btsjvlogin");

    // Vérifier la connexion
    if ($mysqli->connect_error) {
        die("Erreur de connexion : " . $mysqli->connect_error);
    }

    // Définition de la requête SQL avec espaces réservés
    $update = "UPDATE user SET pseudo = ?, mail = ?, mdp = ? WHERE iduser = ?";

    // Préparation de la requête
    $stmt = $mysqli->prepare($update);

    // Liaison des paramètres : "ssi" indique string, string, integer
    $stmt->bind_param("sssi", $pseudo, $mail, $mdp, $iduser);

    // Exécution de la requête préparée
    $stmt->execute();

    // Fermeture du statement et de la connexion
    $stmt->close();
    $mysqli->close();

}
?>


