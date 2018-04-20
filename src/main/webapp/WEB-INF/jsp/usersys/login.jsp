<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:_layout title="Page 01">
    <jsp:attribute name="body_area">
        <div class="container cont-frm-login">
            <div class="row">
                <div class='offset-md-4 col-md-4 offset-md-4'>
                    <form action="login" method="POST">    
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
                            <label>Username</label>
                            <input type="text" class='form-control' maxlength="40" name="username" id="username" value="${user.username}">
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" class='form-control' maxlength="40" name="password" id="password" value="${user.password}">
                        </div>
                        <div class="form-group">
                            <input type="submit" class='btn btn-success pull-right' value='Login'>
                            <a href="/index" class='btn btn-secondary pull-right'>Cancel</a> 
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <link href="<c:url value = "../../../resources/css/styles/login.css"/>" rel="stylesheet" type="text/css"/>
    </jsp:attribute>
</t:_layout>
        
        


