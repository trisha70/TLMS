package com.User;

/**
 * Model class for the Admin user.
 * This class is required to resolve the 'Admin cannot be resolved to a type' error 
 * in admin_routine_view.jsp and other Admin-specific JSPs.
 * * It extends the base User class (assuming a base User class exists for common properties).
 * If no base User class exists, it acts as a standalone model.
 */
public class Admin {

    // Properties (assuming these are standard admin login credentials/details)
    private int id;
    private String name;
    private String email;
    private String password;

    // Default Constructor
    public Admin() {
        super();
    }

    // Parameterized Constructor (for setting details upon retrieval/creation)
    public Admin(int id, String name, String email, String password) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
    }

    // --- Getters and Setters ---
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
