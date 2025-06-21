package com.example.actions;

import com.example.models.User;
import com.example.services.UserService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import java.util.List;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;

public class UserAction extends ActionSupport implements SessionAware, ModelDriven<User> {
    
    private User user = new User();
    private List<User> userList;
    private UserService userService = new UserService();
    private Map<String, Object> session;
    
    // Métodos CRUD
    public String list() {
        userList = userService.getAllUsers();
        return SUCCESS;
    }
    
    public String create() {
        userService.createUser(user);
        return SUCCESS;
    }
    
    public String edit() {
        user = userService.getUserById(user.getId());
        return INPUT;
    }
    
    public String update() {
        userService.updateUser(user);
        return SUCCESS;
    }
    
    public String delete() {
        userService.deleteUser(user.getId());
        return SUCCESS;
    }
    
    // Métodos de sesión
    public String login() {
        User authenticatedUser = userService.authenticate(user.getUsername(), user.getPassword());
        if (authenticatedUser != null) {
            session.put("user", authenticatedUser);
            return SUCCESS;
        }
        addActionError("Invalid username or password");
        return INPUT;
    }
    
    public String logout() {
        session.remove("user");
        session.clear();
        return SUCCESS;
    }
    
    // Getters y Setters
    @Override
    public User getModel() {
        return user;
    }
    
    public List<User> getUserList() {
        return userList;
    }
    
    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }
}