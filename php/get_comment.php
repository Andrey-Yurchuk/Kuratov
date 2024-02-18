<?php

$servername = "localhost";
$username = "admin";
$password = "StrongPassword123!";
$dbname = "cards";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$stmt = $conn->prepare("SELECT name, email, comments FROM cards");
$stmt->execute();
$stmt->store_result();
$stmt->bind_result($name, $email, $comments);

$data = [];

while ($stmt->fetch()) {
    $data[] = ['name' => $name, 'email' => $email, 'comment' => $comments];
}

echo json_encode($data);

$conn->close();