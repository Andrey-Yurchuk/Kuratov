<?php

$servername = "localhost";
$username = "admin";
$password = "StrongPassword123!";
$dbname = "cards";

$name = $_POST['name'];
$email = $_POST['email'];
$comment = $_POST['comment'];

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$stmt = $conn->prepare("INSERT INTO cards (name, email, comments) VALUES (?, ?, ?)");
$stmt->bind_param("sss", $name, $email, $comment);

if ($stmt->execute()) {
    $new_comment = array('name' => $name, 'email' => $email, 'comment' => $comment);
    echo json_encode($new_comment);
} else {
    echo "Error: " . $conn->error;
}

$conn->close();