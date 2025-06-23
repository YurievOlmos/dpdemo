package com.example.actions;

import com.example.models.User;
import com.example.services.UserService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import java.util.List;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class UserAction extends ActionSupport implements SessionAware, ModelDriven<User> {

    private static final Logger logger = LogManager.getLogger(UserAction.class);

    private User model;
    private List<User> userList;
    private UserService userService;
    private Map<String, Object> session;


    // Default constructor
    public UserAction() {
        logger.info("UserAction initialized");
        model = new User();
        userService = new UserService();
        userList= userService.getAllUsers();
        session = new java.util.HashMap<>();
    }

    public String index() {
        if (session == null || session.get("user") == null) {
            // User is authenticated
            return "loginRedirect";
        }
        // User is not authenticated
        return SUCCESS;
    }

    // List all users
    public String list() {
        userList = userService.getAllUsers();
        return SUCCESS;
    }

    // Create a new user
    public String create() {
        model = new User(); // Initialize an empty user model
        return SUCCESS;
    }

    // Edit an existing user (pre-populate form)
    public String edit() {
        if (model.getId() != null) {
            model = userService.getUserById(model.getId());
            if (model == null) {
                addActionError("Usuario no encontrado!");
                return ERROR;
            }
        } else {
            addActionError("Se rquiere un User ID para para editar.");
            return ERROR;
        }
        return SUCCESS; // Render the edit form
    }

    // Delete a user
    public String deleteConfirm() {
        if (model.getId() == null) {
            addActionError("User ID is required to delete a user.");
            return ERROR;
        }
        return SUCCESS; // Render deleteConfirm.jsp
    }

    public String delete() {
        if (model.getId() != null) {
            userService.deleteUser(model.getId());
            addActionMessage("Usuario borrado exitosamente!");
            return SUCCESS; // Redirect to list
        } else {
            addActionError("ID de usuario inválido.");
            return ERROR;
        }
    }

    // Session methods
    public String login() {
        User authenticatedUser = userService.authenticate(model.getUsername(), model.getPassword());
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

    // Update user information
    public String update() {
        // Validate username and password
        if (model.getUsername() == null || model.getUsername().trim().isEmpty()) {
            addActionError("El nombre de usuario no puede estar vacío.");
            return INPUT; // Stay on the form
        }
        if (model.getPassword() == null || model.getPassword().trim().isEmpty()) {
            addActionError("La contraseña no puede estar vacía.");
            return INPUT; // Stay on the form
        }

        if (model.getId() == null) {
            // Create a new user
            userService.createUser(model);
            addActionMessage("Usuario creado exitosamente!");
        } else {
            // Update an existing user
            userService.updateUser(model);
            addActionMessage("Usuario actualizado exitosamente!");
        }
        return SUCCESS; // Redirect to list
    }

    // Getters and Setters
    @Override
    public User getModel() {
        return model;
    }

    public List<User> getUserList() {
        return userList;
    }

    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }
}