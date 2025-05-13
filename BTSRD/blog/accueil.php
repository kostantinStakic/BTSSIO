<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blog</title>
</head>
<body>
    <?php
    // Connexion a la base de données avec mysqli()
    $hostname = "localhost";
    $username = "root";
    $password = "root";
    $dbname = "blog";
    $conn = new mysqli($hostname, $username, $password, $dbname);
    // Vérification de la connexion
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    ?>

    <table>
        <tr>
            <td><img src="images/" alt=""></td>
        </tr>
    </table>
</body>
</html>