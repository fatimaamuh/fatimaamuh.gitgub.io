<?php
$hostname = "your_servername";  // Your MySQL server name
$db_user = "your_username";     // Your MySQL username
$db_pass = "your_password";     // Your MySQL password
$database = "b_lkhidma_db";     // Your database name

$connection = mysqli_connect($hostname, $db_user, $db_pass, $database);

// Check connection
if (mysqli_connect_errno()) {
    echo "Failed to connect to MySQL: " . mysqli_connect_error();
    exit();
}
?>
