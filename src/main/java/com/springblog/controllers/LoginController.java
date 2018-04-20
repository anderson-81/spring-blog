package com.springblog.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.springblog.services.daos.UserDAO;
import com.springblog.services.functions.ValidationData;
import com.springblog.models.UserSys;
import com.springblog.services.daos.PostDAO;
import com.springblog.services.functions.Alert;
import com.springblog.services.security.Token;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {
    
    @Autowired
    private UserDAO userDAO;
    
    @Autowired 
    private PostDAO postDAO;
    
    @Autowired
    private Token tokenobj;
    
    @Autowired
    private Alert alert;
    
    @Autowired
    private ValidationData validationData;
    
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView Login(HttpSession session) {
        ModelAndView model = new ModelAndView();
        Map<String, Object> datas = new HashMap<>();
        try {
            String token = tokenobj.GenerateToken();
            session.setAttribute("token", token);
            datas.put("token", token);
            model.setViewName("usersys/login");
        } catch (Exception e) {
            model.setViewName("errors/505");
        }
        return model;
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView Authenticate(UserSys usersys, HttpSession session, @RequestParam("token") String token) {
        ModelAndView model = new ModelAndView();
        Map<String, Object> datas = new HashMap<>();
        if (session.getAttribute("token").toString().equals(token)) {
            try {
                List<String> errors = validationData.ValidationUser(usersys);
                if (errors.isEmpty()) {
                    UserSys usersys_return = userDAO.Login(usersys);
                    if (usersys_return != null) {
                        session.setAttribute("id", usersys_return.getAuthor().getId());
                        session.setAttribute("name", usersys_return.getAuthor().getName());
                        datas.put("alert", alert.GetAlert(4, 1));
                        datas.put("posts", postDAO.GetPostByTitle(""));
                        model.setViewName("post/index");
                    } else {
                        datas.put("alert", alert.GetAlert(3, 3));
                        model.setViewName("usersys/login");
                    }
                } else {
                    datas.put("errors", errors);
                    model.setViewName("usersys/login");
                }
            } catch (Exception e) {
                model.setViewName("errors/505");
            }
        } else {
            model.setViewName("errors/505");
        }
        model.addAllObjects(datas);
        return model;
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public ModelAndView Logout(HttpSession session) {
        ModelAndView model = new ModelAndView();
        Map<String, Object> datas = new HashMap<>();
        try {
            session.invalidate();
            datas.put("alert", alert.GetAlert(5, 1));
            datas.put("posts", postDAO.GetPostByTitle(""));
            model.setViewName("post/index");
        } catch (Exception e) {
            model.setViewName("errors/505");
        }
        model.addAllObjects(datas);
        return model;
    }
}
