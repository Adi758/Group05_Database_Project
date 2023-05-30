package com.history.blackpeople.Model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class Users {
    
    
    private String firstName;
    private String lastName;
    @Id
    private String email;
    private String password;
    private String userType;

    public String getFirstName() {
        return firstName;
    }
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    public String getLastName() {
        return lastName;
    }
    public void setLastName(String lastName) {
        this.lastName = lastName;
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
    public String getUserType() {
        return userType;
    }
    public void setUserType(String userType) {
        this.userType = userType;
    }
    @Override
    public String toString() {
        return "users [firstName=" + firstName + ", lastName=" + lastName + ", email=" + email + ", password="
                + password + ", userType=" + userType + "]";
    }

}
