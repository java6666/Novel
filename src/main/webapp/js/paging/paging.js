var app=angular.module("page_mail",[]);
app.controller("paging",function ($scope,$http,$rootScope) {
    $scope.oneLi="1";
    $scope.twoLi="2";
    $scope.threeLi="3";
    $scope.fourLi="4";
    $scope.fiveLi="5";
    $scope.words="";
    $scope.foo=function (name,id) {
        $scope.username=name;
        $scope.id=id;
    };
    $scope.$watch('$viewContentLoaded', function() {
        $scope.oneClass="active";
        $scope.paging(-1,"/html_main/main.html");
    });
    $scope.paging=function(num,include,serUrl,novelId) {
        if(serUrl!=undefined){
            $scope.service=serUrl;
        }
        $rootScope.includeMod=include;
        $scope.currentPage="";
        switch (parseInt(num)){
            case -1:$scope.currentPage=$scope.oneLi;
                break;
            case -2:$scope.currentPage=$scope.twoLi;
                break;
            case -3:$scope.currentPage=$scope.threeLi;
                break;
            case -4:$scope.currentPage=$scope.fourLi;
                break;
            case -5:$scope.currentPage=$scope.fiveLi;
                break;
            default:$scope.currentPage=num;
                break;
        }
        var url=$scope.service+"?currentPage="+$scope.currentPage+"&words="+$scope.words+"&novelId="+novelId;
        $http.post(url).then(function (data) {
            $scope.obj1=data.data[2];
            $scope.obj2=data.data[3];
            if ($scope.currentPage==1&&$scope.currentPage==data.data[1].lastPage){
                $scope.one="display:none";
                $scope.pre="display:none";
                $scope.next="display:none";
            }else if($scope.currentPage==1){
                $scope.pre="display:none";
                $scope.next="";
            }else if ($scope.currentPage==data.data[1].lastPage){
                $scope.pre="";
                $scope.next="display:none";
            }else {
                $scope.pre="";
                $scope.next="";
            }
            if(parseInt(data.data[1].lastPage)<=5||parseInt(data.data[1].pageNum)<3){
                switch (data.data[1].pageNum){
                    case 1:$scope.oneClass="active";
                        $scope.twoClass="";
                        $scope.threeClass="";
                        $scope.fourClass="";
                        $scope.fiveClass="";
                        break;
                    case 2:$scope.oneClass="";
                        $scope.twoClass="active";
                        $scope.threeClass="";
                        $scope.fourClass="";
                        $scope.fiveClass="";
                        break;
                    case 3:$scope.oneClass="";
                        $scope.twoClass="";
                        $scope.threeClass="active";
                        $scope.fourClass="";
                        $scope.fiveClass="";
                        break;
                    case 4:$scope.oneClass="";
                        $scope.twoClass="";
                        $scope.threeClass="";
                        $scope.fourClass="active";
                        $scope.fiveClass="";
                        break;
                    case 5:$scope.oneClass="";
                        $scope.twoClass="";
                        $scope.threeClass="";
                        $scope.fourClass="";
                        $scope.fiveClass="active";
                        break;
                }
                switch (parseInt(data.data[1].lastPage)){
                    case 1:$scope.two="display:none";
                    case 2:$scope.three="display:none";
                    case 3:$scope.four="display:none";
                    case 4:$scope.five="display:none";
                        break;
                }
                $scope.list=data.data[0];
            }else {
                var res=parseInt(data.data[1].lastPage)-parseInt(data.data[1].pageNum);
                switch(res){
                    case 1:$scope.five="display:none";
                        $scope.four="";
                        break;
                    case 0:$scope.four="display:none";
                        $scope.five="display:none";
                        break;
                    default:$scope.five="";
                        $scope.four="";
                }
                $scope.oneClass="";
                $scope.twoClass="";
                $scope.threeClass="active";
                $scope.fourClass="";
                $scope.fiveClass="";
                $scope.oneLi=parseInt(data.data[1].pageNum)-2;
                $scope.twoLi=parseInt(data.data[1].pageNum)-1;
                $scope.threeLi=data.data[1].pageNum;
                $scope.fourLi=parseInt(data.data[1].pageNum)+1;
                $scope.fiveLi=parseInt(data.data[1].pageNum)+2;
                $scope.list=data.data[0];
            }
        })
    }
});
