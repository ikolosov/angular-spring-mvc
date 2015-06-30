<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html ng-app>
<head>
    <title>Spring MVC with AngularJS</title>
</head>
<body>

<div ng-controller="getSessionInfo">
    <h4>Session Info:</h4>

    <p>Session ID: {{sessionInfo.sessionId}}</p>

    <p>Creation timestamp: {{sessionInfo.creationTime}}</p>

</div>

<div>
    <h4>Session-based Custom Input</h4>

    <form action="postInput" method="post">
        <input name="customInput" type="text" title="Custom Input: ">
        <input type="submit">
    </form>
    <br>
    ${customInput}
</div>

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.25/angular.min.js"></script>
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