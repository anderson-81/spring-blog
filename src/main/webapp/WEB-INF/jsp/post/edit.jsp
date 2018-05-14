<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:_layout title="Page 01">
    <jsp:attribute name="body_area">
         <div class="container cont-frm" ng-controller="PostController"  ng-init="Show(0)" id="divEdit" style="display:none;">
            <div class="row">
                <div class='offset-md-1 col-md-10 offset-md-1'>
                    <div class="form-group">
                        <h1>Edit</h1>
                    </div>
                    <div class="form-group">
                        <label for="">Author</label>
                        <input type="text" class='form-control'readonly="true" name="author_name" id="author_name" ng-model="author">
                    </div>
                    <hr>    
                     <form enctype="multipart/form-data" method="POST" ng-submit="Update()">
                        <fieldset ng-disabled="status">
                                <div class="form-group" ng-show="errors.length > 0">
                                    <div id="errors" class="errors" ng-show="errors.length > 0"><ul><li ng-repeat="error in errors">{{error}}</li></ul></div> 
                                </div>
                                <div class="form-group">
                                    <input type="hidden" name="token" id="token" ng-model="token">
                                </div>
                                <div class="form-group">
                                    <input type="hidden" name="id" id="id" ng-model="post.id">
                                </div>
                                <div class="form-group">
                                    <label for="">Title</label>
                                    <input type="text" maxlength="255" class='form-control' name="title" id="title" ng-model="post.title">
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
                                    <img src="{{picture}}" alt="{{post.title}}" class="img-edit pull-right" id="imgPost">
                                    <input type="file" ngf-select ng-model="post.picture" name="picture" id="picture" ngf-accept="'image/*'" class="form-control" style="cursor:pointer;">
                                </div>
                                <div class="form-group">
                                    <a href="/show/{{post.id}}"  class="btn btn-secondary col-md-2 pull-right">Cancel</a>
                                    <button type="button" class="btn btn-warning col-md-2 pull-right" data-toggle="modal" data-target="#modalEdit">Edit</button>
                                    <button type="button" class="btn btn-danger col-md-2 pull-right" data-toggle="modal" data-target="#modalDelete">Delete</button>
                                </div>
                        </fieldset>    
                     
                        <div id="modalEdit" class="modal fade" role="dialog" style="color:black;">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h3>Question</h3>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>
                                    <div class="modal-body">
                                        <p>Do you want edit this post?</p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                                        <button type="submit" class="btn btn-warning">Yes</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="modalDelete" class="modal fade" role="dialog" style="color:black;">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h3>Question</h3>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>
                                    <div class="modal-body">
                                        <p>Do you want delete this post?</p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                                        <button type="button" class="btn btn-danger" data-dismiss="modal" ng-click="Delete()">Ok</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
        <link href="../../../resources/css/styles/form.css" rel="stylesheet" type="text/css"/>                    
    </jsp:attribute>
</t:_layout>