<?php
session_start();
include("functions.php");
check_session_id();

$files = getAllFile();

// var_dump($files);
// exit();

// $username = $_SESSION["username"];

// $pdo = connect_to_db();

// $sql = 'SELECT * FROM `file_table` WHERE 1';
// $sql = 'SELECT * FROM file_table WHERE is_deleted = 0 ORDER BY deadline ASC ';


// $stmt = $pdo->prepare($sql);

// var_dump($stmt);
// exit();


// try {
//   $status = $stmt->execute();
// } catch (PDOException $e) {
//   echo json_encode(["sql error" => "{$e->getMessage()}"]);
//   exit();
// }
// var_dump($status);
// exit();


//GETの形式で送る（id）を飛ばすイメージ
// $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
// $output1 = "";
// $output2 = "";


//foreachで繰り返して画面に表示させるところ
// foreach ($result as $record) {
//   $output1 .= "
//     <tr>
//       <td>{$record["deadline"]}</td>
//       <td>{$record["todo"]}</td>
//       <td>
//         <a href='todo_edit.php?id={$record["id"]}'>edit</a>
//       </td>
//       <td>
//         <a href='todo_delete.php?id={$record["id"]}'>delete</a>
//       </td>
//     </tr>
//   ";
// }
// var_dump($output1);
// exit();


?>

<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>DB連携型todoリスト（一覧画面）</title>
</head>

<body>
  <h1>ようこそ、<?=  $_SESSION["username"]?>さん</h1>
 
 <!-- <div id="prof">
 </div>
 <a href="prof_setting.php">プロフィール画像を設定する</a> -->

</script>
  <!-- <h2>あなたのトータルスコア</h2> -->

    <br>
        <a href="CloudVision.php">ワークを開始する</a>
    <br>
    <a href="todo_logout.php">ログアウトする</a>
    <br>
    <br>

    <h2>登録されたアルバム</h2>
<div>
  <?php foreach($files as $file): ?>
    <img src="<?php echo "{$file["file_path"]}" ?>" alt=""> 
    <?php $output1 ?>
    <a href='todo_delete.php?id=<?php echo "{$file["id"]}" ?>'>delete</a>
    <p><?php echo h("{$file["description"]}") ?></p>

  <?php endforeach ?>
     <? 
    var_dump($file);
    exit();?>

</div>

          <!-- <a href="./react_native/app/sotusei/web-build/index.html">test</a> -->

</body>

</html>

<style>
  img{
    width: 30%;
    height: 30%;
  }

  body{
    background-color: #f5deb3;
  }

  #canvas{
    border: 3px solid #01751a;
  }

label {
    padding: 10px 40px;
    color: #ffffff;
    background-color: #384878;
    cursor: pointer;
}

input[type="file"] {
    display: none;
}
  
#prof{
      border: 3px solid #01751a;
      width: 300px;
      height: 300px;
}