package com.example.services;

import com.example.models.User;
import java.util.ArrayList;
import java.util.List;

public class UserService {
    // Simulación de base de datos
    private static List<User> users = new ArrayList<>();
    private static Long idCounter = 1L;
    
    static {
        // Datos de prueba
        users.add(new User(idCounter++, "admin", "admin123", "admin@example.com"));
        users.add(new User(idCounter++, "user1", "user123", "user1@example.com"));
    }
    
    public List<User> getAllUsers() {
        return new ArrayList<>(users);
    }
    
    public User getUserById(Long id) {
        return users.stream()
                .filter(u -> u.getId().equals(id))
                .findFirst()
                .orElse(null);
    }
    
    public void createUser(User user) {
        user.setId(idCounter++);
        users.add(user);
    }
    
    public void updateUser(User user) {
        for (int i = 0; i < users.size(); i++) {
            if (users.get(i).getId().equals(user.getId())) {
                users.set(i, user);
                break;
            }
        }
    }
    
    public void deleteUser(Long id) {
        users.removeIf(u -> u.getId().equals(id));
    }
    
    public User authenticate(String username, String password) {
        return users.stream()
                .filter(u -> u.getUsername().equals(username) && u.getPassword().equals(password))
                .findFirst()
                .orElse(null);
    }
}