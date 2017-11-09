//创建srst模块
var app = angular.module('srst',['ng','ngRoute']);

//配置路由词典
app.config(function($routeProvider){
    $routeProvider
        .when('/srstStart',{
            templateUrl:'mbym/start.html'
        })
        .when('/srstMain',{
            templateUrl:'mbym/main.html',
            controller:'mainCtrl'
        })
        .when('/srstDetail/:id',{
            templateUrl:'mbym/detail.html',
            controller:'detailCtrl'
        })
        .when('/srstOrder/:mid',{
            templateUrl:'mbym/order.html',
            controller:'orderCtrl'
        })
        .when('/srstUserOrder',{
            templateUrl:'mbym/userOrder.html',
            controller:'userOrderCtrl'
        })
        //重定向到起始页
        .otherwise({
            redirectTo:'/srstStart'
        })

});

//为body创建一个控制器，封装了跳转的方法
app.controller('parentCtrl',['$scope','$location',
    function($scope,$location){
        $scope.jump = function(desPath){
            $location.path(desPath);
        }
    }
]);

app.controller('mainCtrl', ['$scope', '$http', function ($scope, $http) {

            $scope.hasMore = true;

            //  加载到代码片段，进到控制器处理函数中，发起请求拿数据
            $http
                .get('data/meal_getbypage.php?start=0')
                .success(function (data) {
                    //console.log(data);
                    $scope.mealList = data;
                });

            $scope.kw="";
            //  监听用户的输入
            $scope.$watch('kw', function() {
                console.log($scope.kw);
                if ($scope.kw) {
                    $http
                        .get('data/meal_getbykey.php?kw=' + $scope.kw)
                        .success(function (data) {
                            console.log(data);
                            //搜索是由结果的
                            if (data.length > 0) {
                                //将搜索到的结果显示在main页面的列表上
                                $scope.mealList = data;
                            }
                        })
                }
            });
            //加载更多
            $scope.loadMore = function () {
                $http
                    .get('data/meal_getbypage.php?start='
                    + $scope.mealList.length)
                    .success(function (data) {
                        if (data.length < 5) {
                            //没有更多数据：将按钮隐藏掉，显示一个提示信息
                            $scope.hasMore = false;
                        }
                        //数组拼起来保存在mealList
                        $scope.mealList = $scope.mealList.concat(data);
                    })
            }
}]);

app.controller('detailCtrl', ['$scope', '$routeParams', '$http', function ($scope, $routeParams, $http) {
            var mid = $routeParams.id;
            //console.log(mid);
            $http
                .get('data/meal_getbyid.php?id=' + mid)
                .success(function (data) {
                    //console.log(data);
                    $scope.meal = data[0];
                })
}]);

app.controller('orderCtrl', ['$scope', '$routeParams', '$http','$httpParamSerializerJQLike',
    function ($scope, $routeParams, $http,$httpParamSerializerJQLike) {

            $scope.order = {mid:$routeParams.mid,sex:1,phone:17712345678};

            $scope.submitOrder = function(){
              //获取用户输入的各个信息
               console.log($scope.order);
               //将输入的信息，发送给服务端
                var params = $httpParamSerializerJQLike($scope.order);
                console.log(params);
                $http
                    .get('data/order_add.php?' + params)
                    .success(function (data) {
                        //解析服务端返回的结果
                        //console.log(data);
                        if(data[0].msg == 'succ')
                        {
                            $scope.result = "下单成功，订单编号为"+data[0].oid;
                            sessionStorage.setItem('phone',$scope.order.phone);
                        }
                        else
                        {
                            $scope.result = "下单失败！";
                        }
                    });

           }
}]);

app.controller('userOrderCtrl',['$scope','$http',function($scope,$http){
    //获取手机号
    var phone = sessionStorage.getItem('phone');
    console.log(phone);
    //发起网络请求
    $http.get('data/order_getbyphone.php?phone='+phone)
        .success(function(data){
            //将服务器返回的订单列表保存在$scope中的orderlist
            $scope.orderList = data;
        })
}]);