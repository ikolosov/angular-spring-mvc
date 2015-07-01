<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en" ng-app>
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
            <div class="inlined">
                <div ng-controller="getSessionInfo">
                    <div>Session ID: {{sessionInfo.sessionId}}</div>
                    <div>Creation timestamp: {{sessionInfo.creationTime}}</div>
                </div>
                <div>
                    <div>
                        <h4>Session-based Custom Input</h4>
                    </div>
                    <form action="postInput" method="post">
                        <input name="customInput" type="text" title="Custom Input: ">
                        <a class="submit-btn">
                            <button type="submit"
                                    class="btn btn-primary btn-xs">Submit Input
                            </button>
                        </a>
                    </form>
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
<script src="webjars/angularjs/1.4.1/angular-route.js"></script>
<script src="webjars/angular-ui-bootstrap/0.13.0/ui-bootstrap-tpls.js"></script>

<script>
    function getSessionInfo($scope, $http) {
        $http.get('getSessionInfo.json').
                success(function (data) {
                    $scope.sessionInfo = data;
                });
    }
</script>

</body>
</html>