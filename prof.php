<?php
session_start();
include("functions.php");
check_session_id();

var_dump($_POST);
exit();
