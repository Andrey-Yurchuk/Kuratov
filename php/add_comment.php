<?php

$servername = "localhost";
$username = "admin";
$password = "StrongPassword123!";
$dbname = "cards";

$name = $_POST['name'];
$email = $_POST['email'];
$comment = $_POST['comment'];

// Валидация данных
if (empty($name) || empty($email) || empty($comment)) {
    die("Пожалуйста, заполните все поля");
}

if (strlen($name) > 50) {
    die("Имя не должно превышать 50 символов");
}

if (strpos($name, ' ') !== false) {
    die("Имя не должно содержать пробелы");
}

if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    die("Пожалуйста, введите корректный email");
}

if (strlen($comment) > 500) {
    die("Комментарий не должен превышать 500 символов");
}

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$stmt = $conn->prepare("INSERT INTO cards (name, email, comments) VALUES (?, ?, ?)");
$stmt->bind_param("sss", $name, $email, $comment);

if ($stmt->execute()) {
    $new_comment = ['name' => $name, 'email' => $email, 'comment' => $comment];
    echo json_encode($new_comment);
} else {
    echo "Error: " . $conn->error;
}

$conn->close();