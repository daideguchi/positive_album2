<?php
session_start();
include("functions.php");
check_session_id();


$pdo = connect_to_db();

// $sql = 'SELECT * FROM todo_table ORDER BY deadline ASC';
$sql = 'SELECT * FROM todo_table WHERE is_deleted = 0 ORDER BY deadline ASC ';


$stmt = $pdo->prepare($sql);

try {
  $status = $stmt->execute();
} catch (PDOException $e) {
  echo json_encode(["sql error" => "{$e->getMessage()}"]);
  exit();
}

$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
$output = "";
foreach ($result as $record) {
  $output .= "
    <tr>
      <td>{$record["deadline"]}</td>
      <td>{$record["todo"]}</td>
      <td><a href='todo_edit.php?id={$record["id"]}'>edit</a></td>
      <td><a href='todo_delete.php?id={$record["id"]}'>delete</a></td>
    </tr>
  ";
}

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
  <canvas id='canvas' width='300' height='300'></canvas>  <!-- 絵を描くcanvas要素 -->
<br><br>
  <label><input  id="chooser" type="file" accept="image/*">プロフィール画像を設定する</label>   <!-- ファイル選択ダイアログ（カメラも使える） -->
  <script>
 
// canvas要素に描画するためのお決まりの2行
var canvas  = document.getElementById("canvas");        // canvas 要素の取得
var context = canvas.getContext("2d");                  // 描画用部品を取得
 
// ファイルを読む（カメラを使う）準備
var chooser = document.getElementById("chooser");       // ファイル選択用 input 要素の取得
var reader  = new FileReader();                         // ファイルを読む FileReader オブジェクトを作成
var image   = new Image();                              // 画像を入れておく Image オブジェクトを作成
// ファイルを読み込む処理
chooser.addEventListener("change", () => {              // ファイル選択ダイアログの値が変わったら
    var file = chooser.files[0];                        // ファイル名取得
    reader.readAsDataURL(file);                         // FileReader でファイルを読み込む
});
reader.addEventListener("load", () => {                 // FileReader がファイルの読み込みを完了したら
    image.src = reader.result;                          // Image オブジェクトに読み込み結果を入れる
});
image.addEventListener("load", () => {                  // Image オブジェクトに画像が入ったら
    context.drawImage(image, 0, 0, 300, 300);           // 画像を canvas に描く（Image, Left, Top, Width, Height）
});
 
</script>
  <h2>あなたのトータルスコア</h2>

    <br>
        <a href="CloudVision.php">ワークを開始する</a>
    <br>
    <a href="todo_logout.php">ログアウトする</a>
    <br>
    <br>



          <a href="./react_native/app/sotusei/web-build/index.html">test</a>

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
  