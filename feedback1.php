<?php
session_start();
include("functions.php");
check_session_id();

// var_dump($_SESSION);
// exit();


$feedback =feedback_select();
$username = $_SESSION["username"];

// var_dump($feedback);
// exit();



?>
<h1>画像を一つ選んでポジティブなコメントでフィードバックしてあげましょう！
</h1>
  <?php foreach($feedback as $feed): ?>

    <img src="<?php echo "{$feed["file_path"]}" ?>" alt=""> 
    <a href='feedback2.php?id=<?php echo "{$feed["id"]}" ?>'>選択</a>
    <div><?php echo h("{$feed["description"]}") ?></div>
    </div>

  <?php endforeach ?>




<a href="mypage.php">戻る</a>