<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:_layout title="Page 01">
    <jsp:attribute name="body_area">
        <div class="container cont-frm">
            <div class="row">
                <div class='offset-md-1 col-md-10 offset-md-1'>
                    <div class="form-group">
                        <h1>Create</h1>
                    </div>
                    <form action="new" method="POST" enctype="multipart/form-data">    
                        <div class="form-group">
                            <c:if test="${!empty errors}">
                                <div class="errors">
                                    <ul>
                                        <c:forEach items="${errors}" var="error" >
                                            <li>${error}</li>
                                            </c:forEach>
                                    </ul>
                                </div>
                            </c:if>
                        </div>
                        <div class="form-group">
                            <input type="hidden" name="token" id="token" value="${token}">
                        </div>
                        <div class="form-group">
                            <label for="">Title</label>
                            <input type="text" class='form-control' maxlength="255" name="title" id="title" value="${post.title}">
                        </div>
                        <div class="form-group">
                            <label for="">Briefing</label>
                            <input type="text" class='form-control' maxlength="255" name="briefing" id="briefing" value="${post.briefing}">
                        </div>
                        <div class="form-group">
                            <label for="">Text</label>
                            <textarea name="text" class='form-control' id="text" cols="30" rows="10">${post.text}</textarea>
                        </div>
                        <div class="form-group">
                            <label for="">Picture</label>
                            <input type="file" class='form-control' name="file" id="file"/>
                        </div>
                        <div class="form-group">
                            <input type="submit" class='btn btn-success col-md-2 pull-right' value="Create">   
                            <a href="/new" class='btn btn-secondary col-md-2 pull-right'>Clear</a> 
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
        <link href="<c:url value="/resources/css/styles/form.css"/>" rel="stylesheet" type="text/css"/>
    </jsp:attribute>
</t:_layout>