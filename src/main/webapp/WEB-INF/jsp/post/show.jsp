<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<t:_layout title="Page 01">
    <jsp:attribute name="body_area">
        <div ng-controller="PostController" ng-init="Show(0)"  ng-show="post.title !== undefined" style="display:none;" id="divShow">
            <!-- Page Header -->
            <header class="masthead" style="background-image: url({{picture}});">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-md-10 mx-auto">
                            <div class="post-heading">
                                <h1>{{post.title}}</h1>
                                <h5 class="subheading">{{post.briefing}}</h5>
                                <span class="meta">Posted by {{author}} on {{post.datepost}} </span> 
                                <span class="meta" ng-show="post.dateupdate !== undefined"> and uptaded on {{post.dateupdate}}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </header>

            <!-- Post Content -->
            <article>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-md-10 mx-auto">
                           <p>{{post.text}}</p>
                        </div>
                        <div class="col-lg-8 col-md-10 mx-auto">
                            <div class="clearfix">
                                <a href="/index" class="btn btn-secondary float-right col-md-2" href="#">Back</a>
                                <button value="button" ng-click="Show(1)" class="btn btn-warning float-right col-md-2" ng-show="logged">Edit</button>
                            </div>    
                        </div>
                    </div>
                </div>
            </article>
        </div>
        <link href="../../../resources/css/styles/index.css" rel="stylesheet" type="text/css"/>
    </jsp:attribute>
</t:_layout>