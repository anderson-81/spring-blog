package com.springblog.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import javax.validation.executable.ExecutableType;
import javax.validation.executable.ValidateOnExecution;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.springblog.services.functions.ValidationData;
import com.springblog.models.Post;
import com.springblog.services.daos.PostDAO;
import com.springblog.services.functions.Alert;
import com.springblog.services.functions.Picture;
import com.springblog.services.security.Token;
import org.springframework.beans.factory.annotation.Autowired;

@Controller
public class PostController {

    @Autowired
    private PostDAO postDAO;

    @Autowired
    private Alert alert;

    @Autowired
    private Token tokenobj;

    @Autowired
    private Picture picture;

    @Autowired
    private ValidationData validationData;
    
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView Index(HttpSession session) {
        ModelAndView model = new ModelAndView("post/index");
        try {
            List<Post> posts = postDAO.GetPostByTitle("");
            if (posts != null) {
                Map<String, Object> datas = new HashMap<>();
                datas.put("posts", posts);
                String _token = tokenobj.GenerateToken();
                session.setAttribute("token", _token);
                datas.put("token", _token);
                model.addAllObjects(datas);
            } else {
                model.setViewName("errors/505");
            }
        } catch (Exception e) {
            model.setViewName("errors/505");
        }
        return model;
    }

    @RequestMapping(value = "/index", method = RequestMethod.POST)
    public ModelAndView Search(Post post, @RequestParam("token") String token, HttpSession session) {
        ModelAndView model = new ModelAndView("post/index");
        try {
            if (session.getAttribute("token").toString().equals(token)) {
                List<Post> posts = postDAO.GetPostByTitle(post.getTitle());
                if (posts != null) {
                    Map<String, Object> datas = new HashMap<>();
                    datas.put("posts", posts);
                    String _token = tokenobj.GenerateToken();
                    session.setAttribute("token", _token);
                    datas.put("token", _token);
                    model.addAllObjects(datas);
                } else {
                    model.setViewName("errors/505");
                }
            }else{
                model.setViewName("errors/505");
            }
        } catch (Exception e) {
            model.setViewName("errors/505");
        }
        return model;
    }

    @RequestMapping(value = "/show/{id}", method = RequestMethod.GET)
    public ModelAndView Show(@PathVariable("id") int id, HttpSession session) {
        ModelAndView model = new ModelAndView("post/show");
        try {
            Post post = postDAO.GetPostByID(id);
            if (post != null) {
                if (!"".equals(post.getTitle())) {
                    Map<String, Object> datas = new HashMap<>();
                    datas.put("post", post);
                    datas.put("picture", picture.ByteToBase64(post.getPicture()));
                    if (session.getAttribute("name") != null) {
                        datas.put("status", 1);
                    }
                    model.addAllObjects(datas);
                } else {
                    model.setViewName("errors/404");
                }
            } else {
                model.setViewName("errors/505");
            }
        } catch (Exception e) {
            model.setViewName("errors/505");
        }
        return model;
    }

    @RequestMapping(value = "/new", method = RequestMethod.GET)
    public ModelAndView New(HttpSession session) {
        ModelAndView model = new ModelAndView("post/new");
        Map<String, Object> datas = new HashMap<>();
        String token = tokenobj.GenerateToken();
        session.setAttribute("token", token);
        datas.put("token", token);
        model.addAllObjects(datas);
        return model;
    }

    @ValidateOnExecution(type = ExecutableType.NONE)
    @RequestMapping(value = "/new", method = RequestMethod.POST)
    public ModelAndView Save(Post post, @RequestParam CommonsMultipartFile file, HttpSession session, @RequestParam("token") String token) {
        ModelAndView model = new ModelAndView();
        if (session.getAttribute("token").toString().equals(token)) {
            try {
                Map<String, Object> datas = new HashMap<>();
                if (file.getBytes().length > 0) {
                    post.setPicture(file.getBytes());
                }
                List<String> errors = validationData.ValidationPost(post);
                if (errors.isEmpty()) {
                    int result = postDAO.InsertPost(post, Integer.parseInt(session.getAttribute("id").toString()));
                    if (result != -1) {
                        datas.put("alert", alert.GetAlert(1, result));
                        datas.put("posts", postDAO.GetPostByTitle(""));
                        model.setViewName("post/index");
                    }
                    if (result == -1) {
                        model.setViewName("errors/505");
                    }
                } else {
                    datas.put("errors", errors);
                    datas.put("post", post);
                    token = tokenobj.GenerateToken();
                    session.setAttribute("token", token);
                    datas.put("token", token);
                    model.setViewName("post/new");
                }
                model.addAllObjects(datas);
            } catch (NumberFormatException e) {
                model.setViewName("errors/505");
            }
        } else {
            model.setViewName("errors/505");
        }
        return model;
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public ModelAndView Edit(@PathVariable("id") int id, HttpSession session) {
        ModelAndView model = new ModelAndView();
        Map<String, Object> datas = new HashMap<>();
        try {
            Post post = postDAO.GetPostByID(id);
            if (post != null) {
                if (!"".equals(post.getTitle())) {
                    if (post.getAuthor().getId() == Integer.parseInt(session.getAttribute("id").toString())) {
                        String token = tokenobj.GenerateToken();
                        session.setAttribute("token", token);
                        datas.put("token", token);
                        datas.put("post", post);
                        datas.put("picture", picture.ByteToBase64(post.getPicture()));
                        model.setViewName("post/edit");
                    } else {
                        datas.put("alert", alert.GetAlert(2, 2));
                        datas.put("post", post);
                        datas.put("picture", picture.ByteToBase64(post.getPicture()));
                        model.setViewName("post/show");
                    }
                } else {
                    model.setViewName("errors/404");
                }
            } else {
                model.setViewName("errors/505");
            }
        } catch (NumberFormatException e) {
            model.setViewName("errors/505");
        }
        model.addAllObjects(datas);
        return model;
    }

    @ValidateOnExecution(type = ExecutableType.NONE)
    @RequestMapping(value = "/edit/update", method = RequestMethod.POST)
    public ModelAndView Update(Post post, @RequestParam CommonsMultipartFile file, HttpSession session, @RequestParam("token") String token) {
        ModelAndView model = new ModelAndView();
        Map<String, Object> datas = new HashMap<>();
        if (session.getAttribute("token").toString().equals(token)) {
            try {
                Post post_return = postDAO.GetPostByID(post.getId());
                if (post_return != null) {
                    if (!"".equals(post_return.getTitle())) {
                        post.setPicture(post_return.getPicture());
                        if (file.getBytes().length > 0) {
                            post.setPicture(file.getBytes());
                        }
                        post.setAuthor(post_return.getAuthor());
                        post.setDatePost(post_return.getDatePost());
                        List<String> errors = validationData.ValidationPost(post);
                        if (errors.isEmpty()) {
                            int result = postDAO.EditPost(post, Integer.parseInt(session.getAttribute("id").toString()));
                            if (result != -1) {
                                datas.put("alert", alert.GetAlert(2, result));
                                datas.put("posts", postDAO.GetPostByTitle(""));
                                model.setViewName("post/index");
                            }
                            if (result == -1) {
                                model.setViewName("errors/505");
                            }
                        } else {
                            datas.put("errors", errors);
                            datas.put("post", post);
                            token = tokenobj.GenerateToken();
                            session.setAttribute("token", token);
                            datas.put("token", token);
                            model.setViewName("post/edit");
                        }
                    } else {
                        model.setViewName("errors/404");
                    }
                } else {
                    model.setViewName("errors/505");
                }
            } catch (NumberFormatException e) {
                model.setViewName("errors/505");
            }
        } else {
            model.setViewName("errors/505");
        }
        model.addAllObjects(datas);
        return model;
    }

    @RequestMapping(value = "/delete/{id}/{token}", method = RequestMethod.GET)
    public ModelAndView Delete(@PathVariable("id") int id, @PathVariable("token") String token, HttpSession session) {
        ModelAndView model = new ModelAndView();
        Map<String, Object> datas = new HashMap<>();
        if (session.getAttribute("token").toString().equals(token)) {
            try {
                Post post = postDAO.GetPostByID(id);
                if (post != null) {
                    if (!"".equals(post.getText())) {
                        int result = postDAO.DeletePost(post, Integer.parseInt(session.getAttribute("id").toString()));
                        if (result != -1) {
                            datas.put("alert", alert.GetAlert(3, result));
                            datas.put("posts", postDAO.GetPostByTitle(""));
                            model.setViewName("post/index");
                        }
                        if (result == -1) {
                            model.setViewName("errors/505");
                        }
                    } else {
                        model.setViewName("errors/404");
                    }
                } else {
                    model.setViewName("errors/505");
                }
            } catch (NumberFormatException e) {
                model.setViewName("errors/505");
            }
        } else {
            model.setViewName("errors/505");
        }
        model.addAllObjects(datas);
        return model;
    }
}
