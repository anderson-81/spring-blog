<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<t:_layout title="Page 01">
    <jsp:attribute name="body_area">
        <header class="masthead" style='background-image: url("<c:url value="/resources/images/intro.jpg"></c:url>")'>
                <div class="overlay"></div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-md-10 mx-auto">
                            <div class="site-heading">
                                <h1>SpringBlog</h1>
                                <span class="subheading">A Blog made in Spring MVC (JAVA)</span>
                                <span class="subheading">
                                    <form action="index" method="POST">   
                                        <div class="input-group">
                                            <input type="hidden" name="token" id="token" value="${token}">
                                        <input type="text" maxlength="255" name="title" id="title" type="text" class="form-control" placeholder="Search for...">
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" type="submit" value="Search">Search</button>
                                        </span>
                                    </div>
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
                    <div class="post-preview">
                        <c:if test="${!empty posts}">
                            <table data-page-length='5'>
                                <thead>
                                    <tr>
                                        <th style="display:none;"></th>
                                        <th></th>
                                    </tr>
                                </thead>    
                                <tbody>
                                    <c:forEach var="post" items="${posts}">
                                        <tr>
                                            <td style="display:none;">
                                               ${post.id}
                                            </td>
                                            <td>
                                                <a href="/show/${post.id}">
                                                    <h2 class="post-title">
                                                        ${post.title}
                                                    </h2>
                                                </a>
                                                <h6 class="post-subtitle">
                                                    ${post.briefing}
                                                </h6>

                                                <p class="post-meta">Posted by 
                                                    <a>${post.author.name}</a>
                                                    on <fmt:formatDate type = "both" dateStyle = "short" timeStyle = "short" value = "${post.datePost}" />
                                                    <c:if test="${!empty post.dateUpdate}">
                                                        and edited on <fmt:formatDate type = "both" dateStyle = "short" timeStyle = "short" value = "${post.dateUpdate}" />
                                                    </c:if>
                                                </p>
                                                <hr>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>  
                        </c:if>
                        <c:if test="${empty posts}">
                            <h1>No posts.</h1>
                        </c:if>
                    </div>
                    <hr>
                    <!-- Pager -->
                    <div class="clearfix">
                    </div>
                </div>
            </div>
        </div>
        <hr>
        <link href="<c:url value = "/resources/css/styles/index.css"/>" rel="stylesheet" type="text/css"/>
        
    </jsp:attribute>
</t:_layout>