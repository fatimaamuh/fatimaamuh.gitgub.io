<?php
include 'config.php';

// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Establish a connection to the database
    $servername = "your_servername";  // Your MySQL server name
    $username = "your_username";     // Your MySQL username
    $password = "your_password";     // Your MySQL password
    $dbname = "b_lkhidma_db";        // Your database name

    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Prepare and bind the INSERT SQL statement
    $stmt = $conn->prepare("INSERT INTO Customer (Fname, Email, Phone, Area, Pass) VALUES (?, ?, ?, ?, ?)");
    $stmt->bind_param("sssss", $fname, $email, $phone, $area, $password);

    // Set parameters and execute
    $fname = $_POST['username'];
    $email = $_POST['email'];
    $phone = $_POST['phone'];
    $area = $_POST['area'];
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT); // Hash the password

    // Attempt to execute the prepared statement
    if ($stmt->execute()) {
        echo "New record created successfully";
    } else {
        echo "Error: " . $stmt->error;
    }

    $stmt->close();
    $conn->close();
}
?>
