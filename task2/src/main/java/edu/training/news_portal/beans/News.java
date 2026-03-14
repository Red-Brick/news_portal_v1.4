package edu.training.news_portal.beans;

import java.io.Serializable;
import java.util.Objects;

public class News implements Serializable {
    private static final long serialVersionUID = 1L;


    private int id;
    private int userId;
    private String image;
    private String title;
    private String status;
    private String content;
    private String category;
    private String date;
    private String brief;
    private String created_at;
    private String update_at;
    private String authorName;
    private String authorSurname;

    public News(){
    }

    public News(String image, String title, String status, String content, String category, String date, String brief, String created_at, String update_at) {
        this.userId = userId;
        this.image = image;
        this.title = title;
        this.status = status;
        this.content = content;
        this.category = category;
        this.date = date;
        this.brief = brief;
        this.created_at = created_at;
        this.update_at = update_at;
    }

    public News(int id, String title, String brief, String content) {
        this.id = id;
        this.title = title;
        this.status = brief;
        this.content = content;
    }

    public News(int id, String image, String title, String status, String content, String category, String date) {
        this.id = id;
        this.image = image;
        this.title = title;
        this.status = status;
        this.content = content;
        this.category = category;
        this.date = date;
    }

    public News(int id, String image, String title, String status, String content, String category, String date, String brief, String created_at, String update_at) {
        this.id = id;
        this.image = image;
        this.title = title;
        this.status = status;
        this.content = content;
        this.category = category;
        this.date = date;
        this.brief = brief;
        this.created_at = created_at;
        this.update_at = update_at;
    }

    public News(int id, String image, String title, String status, String content, String category, String date, String brief, String created_at, String update_at, String authorName, String authorSurname) {
        this.id = id;
        this.image = image;
        this.title = title;
        this.status = status;
        this.content = content;
        this.category = category;
        this.date = date;
        this.brief = brief;
        this.created_at = created_at;
        this.update_at = update_at;
        this.authorName = authorName;
        this.authorSurname = authorSurname;
    }



    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getBrief() {
        return brief;
    }

    public void setBrief(String brief) {
        this.brief = brief;
    }

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }

    public String getUpdate_at() {
        return update_at;
    }

    public void setUpdate_at(String update_at) {
        this.update_at = update_at;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public String getAuthorSurname() {
        return authorSurname;
    }

    public void setAuthorSurname(String authorSurname) {
        this.authorSurname = authorSurname;
    }

    @Override
    public boolean equals(Object o) {
        if (o == null || getClass() != o.getClass()) return false;
        News news = (News) o;
        return id == news.id && Objects.equals(image, news.image) && Objects.equals(title, news.title) && Objects.equals(status, news.status) && Objects.equals(content, news.content) && Objects.equals(category, news.category) && Objects.equals(date, news.date) && Objects.equals(brief, news.brief) && Objects.equals(created_at, news.created_at) && Objects.equals(update_at, news.update_at) && Objects.equals(authorName, news.authorName) && Objects.equals(authorSurname, news.authorSurname);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, image, title, status, content, category, date, brief, created_at, update_at, authorName, authorSurname);
    }

    @Override
    public String toString() {
        return "News{" +
                "id=" + id +
                ", image='" + image + '\'' +
                ", title='" + title + '\'' +
                ", status='" + status + '\'' +
                ", content='" + content + '\'' +
                ", category='" + category + '\'' +
                ", date='" + date + '\'' +
                ", brief='" + brief + '\'' +
                ", created_at='" + created_at + '\'' +
                ", update_at='" + update_at + '\'' +
                ", authorName='" + authorName + '\'' +
                ", authorSurname='" + authorSurname + '\'' +
                '}';
    }
}
