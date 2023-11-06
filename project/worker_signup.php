
<?php
include 'config.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $conn = new mysqli($servername, $username, $password, $dbname);

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $stmt = $conn->prepare("INSERT INTO Service_Provider (Fname, Email, Phone, Area, Pass) VALUES (?, ?, ?, ?, ?)");
    $stmt->bind_param("sssss", $fname, $email, $phone, $area, $password);

    $fname = $_POST['username'];
    $email = $_POST['email'];
    $phone = $_POST['phone'];
    $area = $_POST['area'];
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);

    if ($stmt->execute()) {
        echo "New record created successfully";
    } else {
        echo "Error: " . $stmt->error;
    }

    $stmt->close();
    $conn->close();
}
?>
