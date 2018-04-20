<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:_layout title="Page 01">
    <jsp:attribute name="body_area">
        <div class="container cont-frm">
            <div class="row">
                <div class='offset-md-1 col-md-10 offset-md-1'>
                    <div class="form-group">
                        <h1>Edit</h1>
                    </div>
                    <div class="form-group">
                        <label for="">Author</label>
                        <input type="text" class='form-control'readonly="true" name="author_name" id="author_name" value="${post.author.name}">
                    </div>
                    <hr>    
                    <form action="/edit/update" method="POST" enctype="multipart/form-data">    
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
                            <input type="hidden" name="id" id="id" value="${post.id}">
                        </div>
                        <div class="form-group">
                            <label for="">Title</label>
                            <input type="text" maxlength="255" class='form-control' name="title" id="title" value="${post.title}">
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
                            <a href="${picture}" download="download"><img src="${picture}" alt="${post.title}" class="img-edit pull-right" id="imgPost"></a>
                            <input type="file" class='form-control' name="file" id="file"/>
                        </div>
                        <div class="form-group">
                            <a href="/show/${post.id}"  class="btn btn-secondary col-md-2 pull-right">Cancel</a>
                            <button type="button" class="btn btn-warning col-md-2 pull-right" data-toggle="modal" data-target="#modalEdit">Edit</button>
                            <button type="button" class="btn btn-danger col-md-2 pull-right" data-toggle="modal" data-target="#modalDelete">Delete</button>
                        </div>
                     
                        <div id="modalEdit" class="modal fade" role="dialog" style="color:black;">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
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
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>
                                    <div class="modal-body">
                                        <p>Do you want delete this post?</p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                                        <a href="/delete/${post.id}/${token}" class="btn btn-danger">Yes</a> 
                                    </div>
                                </div>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
        <link href="<c:url value="/resources/css/styles/form.css"/>" rel="stylesheet" type="text/css"/>    
        <script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
    </jsp:attribute>
</t:_layout>