<?php
session_start();
include("functions.php");
check_session_id();

// var_dump($_POST);
// exit();

$feedback = $_POST["feedback"];
$id = $_POST["id"];


$pdo = connect_to_db();

$sql = "UPDATE file_table SET feedback=:feedback WHERE id=:id";
  // $sql = "INSERT INTO file_table (koukai) VALUE($koukai)";

//   var_dump($sql);
//   exit();
  
$stmt = $pdo->prepare($sql);

$stmt->bindValue(':feedback', $feedback, PDO::PARAM_STR);
$stmt->bindValue(':id', $id, PDO::PARAM_STR);


try {
  $status = $stmt->execute();
} catch (PDOException $e) {
  echo json_encode(["sql error" => "{$e->getMessage()}"]);
  exit();
}

// header("Location:feedback1.php");
// exit();

?>

<a href="mypage.php">戻る</a>
