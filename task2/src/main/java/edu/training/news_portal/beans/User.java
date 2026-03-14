package edu.training.news_portal.beans;

import java.util.Objects;

public class User {

    private int userId;
    private String name;
    private String surname;
    private String email;
    private String role;
    private String registrationDate;

    public User() {
    }

    public User(String name) {
        this.name = name;
    }

    public User(int userId, String name, String surname, String email, String role, String registrationDate) {
        this.userId = userId;
        this.name = name;
        this.surname = surname;
        this.email = email;
        this.role = role;
        this.registrationDate = registrationDate;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getRegistrationDate() {
        return registrationDate;
    }

    public void setRegistrationDate(String registrationDate) {
        this.registrationDate = registrationDate;
    }

    @Override
    public boolean equals(Object o) {
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return Objects.equals(userId, user.userId) && Objects.equals(name, user.name) && Objects.equals(surname, user.surname) && Objects.equals(email, user.email) && Objects.equals(role, user.role) && Objects.equals(registrationDate, user.registrationDate);
    }

    @Override
    public int hashCode() {
        return Objects.hash(userId, name, surname, email, role, registrationDate);
    }

    @Override
    public String toString() {
        return "User{" +
                "userId='" + userId + '\'' +
                ", name='" + name + '\'' +
                ", surname='" + surname + '\'' +
                ", email='" + email + '\'' +
                ", role='" + role + '\'' +
                ", registrationDate='" + registrationDate + '\'' +
                '}';
    }
}
