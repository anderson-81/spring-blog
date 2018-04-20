package com.springblog.services.functions;

import org.springframework.stereotype.Service;

@Service
public class Alert {

    public String GetAlert(int method, int result) {
        String text = "";
        String title = "";

        if (result == 1) {
            title = "Information";
            text = "Successfully ";
            if (method == 1) {
                text = text + "created.";
            }
            if (method == 2) {
                text = text + "edited.";
            }
            if (method == 3) {
                text = text + "deleted.";
            }
            if (method == 4) {
                text = text + "logged.";
            }
            if (method == 5) {
                text = text + "logged out.";
            }
        }

        if (result != 1) {
            title = "Error";
            if (method == 1) {
                text = "Author not found.";
            }
            if (method == 2) {
                text = "This post can only be edited or deleted by the author.";
            }
            if (method == 3) {
                text = "Invalid username and password.";
            }
            if (method == 4) {
                text = "Unsuccessfully logged out.";
            }
        }

        StringBuilder stb = new StringBuilder();
        
        stb.append("<script src=\"../../../resources/js/jquery.min.js\" type=\"text/javascript\"></script>");
        stb.append("<script src=\"../../../resources/js/bootstrap.bundle.min.js\" type=\"text/javascript\"></script>");

        stb.append("<div id=\"modalInfo\" class=\"modal fade\" style=\"color:black;\" role=\"dialog\">");
        stb.append("<div class=\"modal-dialog\">");
        stb.append("<div class=\"modal-content\">");
        stb.append("<div class=\"modal-header\">");
        stb.append("<button type=\"button\" class=\"close\" data-dismiss=\"modal\">&times;</button>");
        stb.append("<h4 class=\"modal-title\">");
        //stb.append(title);
        stb.append("</h4>");
        stb.append("</div>");
        stb.append("<div class=\"modal-body\">");
        stb.append("<p>");
        stb.append(text);
        stb.append("</p>");
        stb.append("</div>");
        stb.append("<div class=\"modal-footer\">");
        stb.append("<button type=\"button\" class=\"btn btn-danger\" data-dismiss=\"modal\">Ok</button>");
        stb.append("</div>");
        stb.append("</div>");
        stb.append("</div>");
        stb.append("</div>");
        stb.append("<script>$(\"#modalInfo\").modal(\"show\");</script>");
        return stb.toString();
    }
}
