<?php
//orderҳ����ύ���û����ݲ��뵽���ݿ���

header('Content-Type:application/json');

@$userName = $_REQUEST['user_name'];
@$sex = $_REQUEST['sex'];
@$phone = $_REQUEST['phone'];
@$addr = $_REQUEST['addr'];
@$mid = $_REQUEST['mid'];

if(empty($userName) || empty($sex) || empty($phone) || empty($addr) ||  empty($mid))
{
  echo '[]';
  return;
}

$orderTime = time()*1000;

require('init.php');

$sql = "INSERT INTO sr_order VALUES(NULL,'$phone','$userName','$sex','$orderTime','$addr','$mid')";
$result = mysqli_query($conn,$sql);

$output = [];
if($result){//ִ�гɹ�
  $arr['msg'] = 'succ';
  $arr['oid'] = mysqli_insert_id($conn);
  $output[] = $arr;
}
else
{
  $arr['msg'] = 'error';
  $output[] = $arr;
}

echo json_encode($output);


?>