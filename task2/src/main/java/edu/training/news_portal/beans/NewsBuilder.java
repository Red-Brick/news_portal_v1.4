package edu.training.news_portal.beans;

public class NewsBuilder {

    private String image;
    private String title;
    private String status;
    private String content;
    private String category;
    private String date;
    private String brief;
    private String created_at;
    private String update_at;

    public NewsBuilder() {}

    public NewsBuilder setImage(String image) {
        this.image = image;
        return this;
    }

    public NewsBuilder setTitle(String title) {
        this.title = title;
        return this;
    }

    public NewsBuilder setStatus(String status) {
        this.status = status;
        return this;
    }

    public NewsBuilder setContent(String content) {
        this.content = content;
        return this;
    }

    public NewsBuilder setCategory(String category) {
        this.category = category;
        return this;
    }

    public NewsBuilder setDate(String date) {
        this.date = date;
        return this;
    }

    public NewsBuilder setBrief(String brief) {
        this.brief = brief;
        return this;
    }

    public NewsBuilder setCreated_at(String created_at) {
        this.created_at = created_at;
        return this;
    }

    public NewsBuilder setUpdate_at(String update_at) {
        this.update_at = update_at;
        return this;
    }

    public News build() {
        // Возвращаем сразу объект News без id, id будет присвоен БД
        News news = new News(image, title, status, content, category, date, brief, created_at, update_at);
        return news;
    }

}
