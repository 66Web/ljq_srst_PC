<?php
//detail页面根据id获取详情

header('Content-Type:application/json');

@$id = $_REQUEST['id'];
if(empty($id))
{
  echo '[]';
  return;
}

require('init.php');

$sql = "SELECT mid,name,price,img_lg,material,detail  FROM sr_meal WHERE mid = $id";
$result = mysqli_query($conn,$sql);

 $output = [];
 $row = mysqli_fetch_assoc($result);
 if(!$row){
       echo '[]';
 }else{
       $output[] = $row;
       echo json_encode($output);
 }

?>