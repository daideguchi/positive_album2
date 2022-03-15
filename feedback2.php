<?php
session_start();
include("functions.php");
check_session_id();

// var_dump($_GET["id"]);
// exit();

$id = $_GET["id"];

$pdo = connect_to_db();
// var_dump($id);
// exit();

$sql = "SELECT * FROM file_table WHERE id=$id";
// $sql = 'UPDATE todo_table SET is_deleted = 1,cnt=0;updated_at =now() WHERE id=:id';

// var_dump($sql);
// exit();

$stmt = $pdo->prepare($sql);

// var_dump($stmt);
// exit();

try {
  $status = $stmt->execute();
} catch (PDOException $e) {
  echo json_encode(["sql error" => "{$e->getMessage()}"]);
  exit();
}
// var_dump($sql);
// exit();
foreach($stmt as $row): 
    $img = $row['file_path'];
    $d = $row['description'];
 endforeach;

//  var_dump($img);
//   var_dump($d);

// exit();

?>
 <?php 
    ?>

<img src=./<?php echo "{$img}"?> alt="">
<img src=./<?php echo "{$save_path}" ?> alt="">
  <?php echo h("{$d}") ?>

<form action="feedback3.php" method="POST">
  <p>フィードバックコメントを入力：</p>
  <input type="text" name="feedback">
  <input type="hidden" name="id" value="<?php echo "{$id}" ?>">

  <button>決定</button>

  </form>