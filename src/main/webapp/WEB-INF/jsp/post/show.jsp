<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<t:_layout title="Page 01">
    <jsp:attribute name="body_area">
        <!-- Page Header -->
        <header class="masthead" style="background-image: url(${picture});">
            <div class="overlay"></div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-md-10 mx-auto">
                        <div class="post-heading">
                            <h1>${post.title}</h1>
                            <h5 class="subheading">${post.briefing}</h5>
                            <span class="meta">Posted by ${post.author.name} on <fmt:formatDate type = "both" dateStyle = "short" timeStyle = "short" value = "${post.datePost}" /> </span> 
                            <c:if test="${!empty post.dateUpdate}">
                                <span class="meta"> and uptaded on <fmt:formatDate type = "both" dateStyle = "short" timeStyle = "short" value = "${post.dateUpdate}" /></span>
                            </c:if>
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
                        <p>${post.text}</p>
                    </div>
                    <div class="col-lg-8 col-md-10 mx-auto">
                        <div class="clearfix">
                            <a href="/index" class="btn btn-secondary float-right col-md-2" href="#">Back</a>
                            <c:if test="${!empty name}">
                                 <a href="/edit/${post.id}" class="btn btn-warning float-right col-md-2" href="#">Edit</a>
                            </c:if>
                        </div>    
                    </div>
                </div>
            </div>
        </article>
        <link href="<c:url value = "/resources/css/styles/index.css"/>" rel="stylesheet" type="text/css"/>
    </jsp:attribute>
</t:_layout>