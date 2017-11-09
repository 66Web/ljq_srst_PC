<?php
 //main页面的分页查询  每次读5条数据，从0开始

 header('Content-Type:application/json');

 $start = $_REQUEST['start'];
 $count = 5;

 require('init.php');

 $sql = "SELECT mid,name,price,img_sm,material FROM sr_meal LIMIT $start,$count";
 $result = mysqli_query($conn,$sql);

 $output = [];
 while(true)
 {
    $row = mysqli_fetch_assoc($result);
    if(!$row){
      break;
    }
    $output[] = $row;
 }

 echo json_encode($output);
?>