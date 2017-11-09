<?php
//main页面根据关键词的信息从sr_meal搜索原材料或者名称返回显示给买家

header('Content-Type:application/json');

@$kw = $_REQUEST['kw'];
if(empty($kw))
{
  echo '[]';
  return;
}

require('init.php');

$sql = "SELECT mid,name,price,img_sm,material FROM sr_meal WHERE name LIKE '%$kw%' OR material LIKE '%$kw%'";
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