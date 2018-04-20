<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Error 404</title>
        <link  href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet" type="text/css"/>
        <link  href="<c:url value="/resources/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css"/>
        <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
        <link  href="<c:url value="/resources/css/clean-blog.min.css"/>" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="offset-md-2 col-md-8 offset-md-2">
                    <div class="form-group">
                        <img class="img-fluid" src="<c:url value="/resources/images/404.png"/>" alt="404">
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="offset-md-4 col-md-4 offset-md-4">
                    <div class="form-group text-center">
                        <a href="/index" class="btn btn-secondary">Return</a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>