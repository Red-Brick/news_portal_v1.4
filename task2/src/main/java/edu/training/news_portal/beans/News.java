package edu.training.news_portal.beans;

import java.util.Objects;

public class News {

    private int id;
    private String image;
    private String title;
    private String excerpt;
    private String content;
    private String category;
    private String dats;

    public News(){

    }
    public News(int id, String title, String brief, String content) {
        this.id = id;
        this.title = title;
        this.excerpt = brief;
        this.content = content;
    }

    public News(int id, String image, String title, String excerpt, String content, String category, String dats) {
        this.id = id;
        this.image = image;
        this.title = title;
        this.excerpt = excerpt;
        this.content = content;
        this.category = category;
        this.dats = dats;
    }

    public String getDats() {
        return dats;
    }

    public void setDats(String dats) {
        this.dats = dats;
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

    public String getExcerpt() {
        return excerpt;
    }

    public void setExcerpt(String excerpt) {
        this.excerpt = excerpt;
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

    @Override
    public boolean equals(Object o) {
        if (o == null || getClass() != o.getClass()) return false;
        News news = (News) o;
        return id == news.id && Objects.equals(image, news.image) && Objects.equals(title, news.title) && Objects.equals(excerpt, news.excerpt) && Objects.equals(content, news.content) && Objects.equals(category, news.category);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, image, title, excerpt, content, category);
    }

    @Override
    public String toString() {
        return "News{" +
                "id=" + id +
                ", image='" + image + '\'' +
                ", title='" + title + '\'' +
                ", excerpt='" + excerpt + '\'' +
                ", content='" + content + '\'' +
                ", category='" + category + '\'' +
                ", dats='" + dats + '\'' +
                '}';
    }
}
