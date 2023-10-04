<?php
$hostname = 'your_hostname';
$username = 'your_username';
$password = 'your_password';
$database = 'your_database';

$connection = mysqli_connect($hostname, $username, $password, $database);

if (!$connection) {
    die("Database connection failed: " . mysqli_connect_error());
}
?>
```
<?php
// Example query
$query = "SELECT * FROM Service_Provider";

$result = mysqli_query($connection, $query);

if (!$result) {
    die("Database query failed: " . mysqli_error($connection));
}
?>
```

<?php
while ($row = mysqli_fetch_assoc($result)) {
    echo "First Name: " . $row['Fname'] . "<br>";
    echo "Last Name: " . $row['Lname'] . "<br>";
    echo "Email: " . $row['Email'] . "<br>";
    // Display other fields as needed
    echo "<br>";
}
?>
```
<?php
mysqli_close($connection);
?>
```
