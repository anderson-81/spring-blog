<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:_layout title="Page 01">
    <jsp:attribute name="body_area">
        <div class="container cont-frm" ng-controller="PostController" id="divCreate" style="display:none;">
            <div class="row">
                <div class='offset-md-1 col-md-10 offset-md-1'>
                    <div class="form-group">
                        <h1>Create</h1>
                    </div>
                    <form enctype="multipart/form-data" ng-submit="Create()" ng-init="Reset()" method="POST">
                        <fieldset ng-disabled="status">
                            <div class="form-group" ng-show="errors.length > 0">
                                <div id="errors" class="errors" ng-show="errors.length > 0"><ul><li ng-repeat="error in errors">{{error}}</li></ul></div> 
                            </div>
                            <div class="form-group">
                                <input type="hidden" name="token" id="token" ng-model="token">
                            </div>
                            <div class="form-group">
                                <label for="">Title</label>
                                <input type="text" class='form-control' maxlength="255" name="title" id="title" ng-model="post.title">
                            </div>
                            <div class="form-group">
                                <label for="">Briefing</label>
                                <input type="text" class='form-control' maxlength="255" name="briefing" id="briefing" ng-model="post.briefing">
                            </div>
                            <div class="form-group">
                                <label for="">Text</label>
                                <textarea name="text" class='form-control' id="text" cols="30" rows="10" ng-model="post.text"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="">Picture</label>
                                <input type="file" ngf-select ng-model="post.picture" name="picture" id="picture" ngf-accept="'image/*'" class="form-control" style="cursor:pointer;">
                            </div>
                            <div class="form-group">
                                <button type="submit" class='btn btn-success col-md-2 pull-right'>Create</button>   
                                <button type="button" class='btn btn-secondary col-md-2 pull-right' ng-click="Reset()">Clean</button>   
                            </div>
                        </fieldset>    
                    </form>
                </div>
            </div>
        </div>
        <link href="../../../resources/css/styles/form.css" rel="stylesheet" type="text/css"/>
    </jsp:attribute>
</t:_layout>