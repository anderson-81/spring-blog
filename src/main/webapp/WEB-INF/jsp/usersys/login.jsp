<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:_layout title="Page 01">
    <jsp:attribute name="body_area">
        <div class="container cont-frm-login" ng-controller="LoginController" style="display:none;" id="divLogin">
            <div class="row">
                <div class='offset-md-4 col-md-4 offset-md-4'>
                    <form ng-submit="Login()" ng-init="Reset()" method="POST">
                        <fieldset ng-disabled="status">
                            <div class="form-group" ng-show="errors.length > 0">
                                <div id="errors" class="errors" ng-show="errors.length > 0"><ul><li ng-repeat="error in errors">{{error}}</li></ul></div> 
                            </div>
                            <div class="form-group">
                                <input type="hidden" name="token" ng-model="token" id="token">
                            </div>
                            <div class="form-group">
                                <label>Username</label>
                                <input type="text" class='form-control' maxlength="40" name="username" id="username" ng-model="usersys.username">
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <input type="password" class='form-control' maxlength="40" name="password" id="password" ng-model="usersys.password">
                            </div>
                            <div class="form-group">
                                <button type="submit" class='btn btn-success pull-right'>Login</button>
                                <a href="/index" class='btn btn-secondary pull-right'>Cancel</a> 
                            </div>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
        <link href="../../../resources/css/styles/login.css" rel="stylesheet" type="text/css"/>
    </jsp:attribute>
</t:_layout>




