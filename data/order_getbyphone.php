<?php
 //userOrder页面获取当前用户的订单信息  order_getbyphone.php
 //跨表查询

header('Content-Type:application/json');

@$phone = $_REQUEST['phone'];

require('init.php');

$sql = "SELECT sr_order.oid,sr_order.order_time,sr_order.user_name,sr_order.mid,sr_meal.img_sm
FROM sr_meal,sr_order WHERE sr_order.phone=$phone AND sr_order.mid=sr_meal.mid";
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