<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<t:_layout title="Page 01">
    <jsp:attribute name="body_area">
        <div ng-controller="PostController" ng-init="List()">
            <header class="masthead" style='background-image: url("../../../resources/images/intro.jpg")'>
                <div class="overlay"></div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-md-10 mx-auto">
                            <div class="site-heading">
                                <h1>SpringBlog</h1>
                                <span class="subheading">A Blog made in Spring MVC (JAVA)</span>
                                <span class="subheading">
                                    <form method="POST" ng-submit="Search()">   
                                        <fieldset ng-disabled="status">
                                            <div class="input-group">
                                                <input type="hidden" name="token" id="token" ng-model="token">
                                                <input type="text" maxlength="255" name="search" id="search" type="text" ng-model="search" class="form-control" placeholder="Search for...">
                                                <span class="input-group-btn">
                                                    <button class="btn btn-default" type="submit" value="Search">Search</button>
                                                </span>
                                            </div>
                                        </fieldset>
                                    </form>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </header>

            <!-- Main Content -->
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-md-10 mx-auto">
                        <div class="post-preview" id="divTable">
                        </div>
                        <hr>
                        <!-- Pager -->
                        <div class="clearfix">
                        </div>
                    </div>
                </div>
            </div>
            <hr>
        </div>
        <link href="../../../resources/css/styles/index.css" rel="stylesheet" type="text/css"/>
    </jsp:attribute>
</t:_layout>