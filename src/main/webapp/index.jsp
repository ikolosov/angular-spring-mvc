<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en" ng-app="springMVC">
<head>
    <meta charset="utf-8">
    <title>Spring MVC with AngularJS</title>
    <link rel="stylesheet" href="webjars/bootstrap/3.3.5/css/bootstrap.css">
    <link rel="stylesheet" href="webjars/bootstrap/3.3.5/css/bootstrap-theme.css">
    <style>
        .indented {
            padding-top: 50px;
        }

        .inlined {
            display: inline-block;
            padding-top: 10px;
            padding-bottom: 20px;
        }

        .submit-btn {
            margin-bottom: 2px;
            margin-left: 10px;
        }
    </style>
</head>

<body class="indented">

<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title">Session Info</h4>
        </div>
        <div class="panel-body">
            <div class="inlined" ng-controller="Ctrl" ng-init="getSessionInfo()">
                <div>
                    <div><b>Session: </b>{{sessionInfo.sessionId}}</div>
                    <div><b>Created: </b>{{sessionInfo.creationTime}}</div>
                </div>
                <div>
                    <div>
                        <br>
                        <h4>Session-based custom input</h4>
                    </div>
                    <form>
                        <input ng-model="formInput">
                        <a class="submit-btn">
                            <button type="submit"
                                    ng-click="postInput()"
                                    class="btn btn-primary btn-xs">Submit
                            </button>
                        </a>
                    </form>
                </div>
                <div>
                    <br>
                    ${customInput}
                </div>
            </div>
        </div>
    </div>
    <footer class="text-muted">
        Powered by <a href="http://ikolosov.com/">&copy; ikolosov</a>
    </footer>
</div>

<script src="webjars/angularjs/1.4.1/angular.js"></script>

<script>
    angular.module('springMVC', []).controller(
            'Ctrl',
            function ($scope, $http, $window) {

                $scope.getSessionInfo = function () {
                    var respPromise = $http.get('getSessionInfo.json');
                    respPromise.success(function (data) {
                        $scope.sessionInfo = data;
                        console.log('getSessionInfo() succeeded');
                    });
                    respPromise.error(function () {
                        alert('getSessionInfo() failed');
                    });
                };

                $scope.postInput = function () {
                    var responsePromise = $http.post('postInput', $scope.formInput);
                    responsePromise.success(function () {
                        $window.location.reload();
                        console.log('postInput() succeeded');
                    });
                    responsePromise.error(function () {
                        alert('postInput() failed');
                    });
                };
            });
</script>

</body>
</html>