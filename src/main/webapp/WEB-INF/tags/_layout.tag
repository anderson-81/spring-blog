<!DOCTYPE html>
<%@attribute name="title"%>
<%@attribute name="body_area" fragment="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <%@tag description="put the tag description here" pageEncoding="UTF-8"%>
        <%@attribute name="message"%>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>SpringBlog</title>
        <link href="../../resources/css/vendor/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../resources/fonts/font-awesome.css" rel="stylesheet" type="text/css"/>
        <link href="../../resources/css/vendor/clean-blog.min.css" rel="stylesheet" type="text/css"/>
        <script src="../../resources/js/vendor/jquery.min.js" type="text/javascript"></script>
        <script src="../../resources/js/vendor/angular.min.js" type="text/javascript"></script>
        <script src="../../resources/js/vendor/ng-file-upload.js" type="text/javascript"></script>
        <script src="../../resources/js/vendor/ng-file-upload-shim.js" type="text/javascript"></script>
        <script src="../../resources/js/app.js" type="text/javascript"></script>
        <script src="../../resources/js/scripts/services/services.js" type="text/javascript"></script>
        <script src="../../resources/js/scripts/functions/alert.js" type="text/javascript"></script>
        <script src="../../resources/js/scripts/controllers/LoginController.js" type="text/javascript"></script>
        <script src="../../resources/js/scripts/controllers/PostController.js" type="text/javascript"></script>
        <link rel="icon" type="image/png" href="../../resources/images/favicon.png" />
    </head>
    <body ng-app="SpringBlog">
        <!-- Navigation -->
        <div ng-controller="LoginController">
            <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
                <div class="container">
                    <a class="navbar-brand" href="/index">SpringBlog</a>
                    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                        Menu
                        <i class="fa fa-bars"></i>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarResponsive">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="/new" ng-show="logged">Create</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-toggle="modal" data-target="#modalLogout" ng-show="logged">Logout</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/login" ng-show="!logged">Login</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <!-- Modal Logout -->
                        <div id="modalLogout" class="modal fade forget-modal" role="dialog" style="color:black;">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h3>Question</h3>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>
                                    <div class="modal-body">
                                        <p>Do you want to logout?</p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                                        <button type="button" class="btn btn-danger" data-dismiss="modal" ng-click="Logout()">Yes</button>
                                    </div>
                                </div>
                            </div>
                        </div> 
                        <!-- Modal Logout -->
                    </div>
                </div>    
            </div>  
        </div>

        <div class="container">
            <div class="row">
                <div class="col-md-12" id="divModalInfo">
                    <!-- Modal Info -->
                    <div id="modalInfo" class="modal fade" role="dialog" style="color:black;">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h3 id="titleModal"></h3>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="modal-body">
                                    <p id="messageModal"></p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Ok</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Modal Info -->
                </div>
            </div>
        </div>   

        <jsp:invoke fragment="body_area"/>

        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-md-10 mx-auto">
                        <ul class="list-inline text-center">
                            <li class="list-inline-item">
                                <a href="#">
                                    <span class="fa-stack fa-lg">
                                        <i class="fa fa-circle fa-stack-2x"></i>
                                        <i class="fa fa-twitter fa-stack-1x fa-inverse"></i>
                                    </span>
                                </a>
                            </li>
                            <li class="list-inline-item">
                                <a href="#">
                                    <span class="fa-stack fa-lg">
                                        <i class="fa fa-circle fa-stack-2x"></i>
                                        <i class="fa fa-facebook fa-stack-1x fa-inverse"></i>
                                    </span>
                                </a>
                            </li>
                            <li class="list-inline-item">
                                <a href="#">
                                    <span class="fa-stack fa-lg">
                                        <i class="fa fa-circle fa-stack-2x"></i>
                                        <i class="fa fa-github fa-stack-1x fa-inverse"></i>
                                    </span>
                                </a>
                            </li>
                        </ul>
                        <p class="copyright text-muted">Copyright &copy; Your Website 2018</p>
                    </div>
                </div>
            </div>
        </footer>
        <script src="../../resources/js/vendor/bootstrap.bundle.min.js" type="text/javascript"></script>
        <script src="../../resources/js/vendor/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="../../resources/js/vendor/clean-blog.min.js" type="text/javascript"></script>
        <script src="../../resources/js/scripts/configs/tablepost.js" type="text/javascript"></script>
    </body>
</html>