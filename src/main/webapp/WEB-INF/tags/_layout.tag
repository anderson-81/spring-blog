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

        <link  href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet" type="text/css"/>
        <link href="<c:url value="/resources/fonts/font-awesome.css"/>" rel="stylesheet" type="text/css"/>
        <link  href="<c:url value="/resources/css/clean-blog.min.css"/>" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="/index">SpringBlog</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fa fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <% if (session.getAttribute("name") != null) {%>
                        <li class="nav-item">
                            <a class="nav-link" href="/new">Create</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" data-toggle="modal" data-target="#modalLogout">Logout</a>
                        </li>
                        <% } else {%>
                        <li class="nav-item">
                            <a class="nav-link" href="/login">Login</a>
                        </li>
                        <% }%>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    ${alert}
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div id="modalLogout" class="modal fade" role="dialog" style="color:black;">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="modal-body">
                                    <p>Do you want to logout?</p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                                    <a class="btn btn-danger" href="/logout">Yes</a>
                                </div>
                            </div>
                        </div>
                    </div>            
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
        <script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
        <script src="<c:url value="/resources/js/bootstrap.bundle.min.js"/>"></script>
        <script src="<c:url value="/resources/js/jquery.dataTables.min.js"/>" type="text/javascript"></script>
        <script src="<c:url value="/resources/js/clean-blog.min.js"/>"></script>
        <script src="<c:url value="/resources/js/tablepost.js"/>"></script>
    </body>
</html>




