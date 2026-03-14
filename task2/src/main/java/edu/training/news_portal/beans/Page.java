package edu.training.news_portal.beans;

import java.io.Serializable;
import java.util.List;

public class Page<T> implements Serializable {
    private static final long serialVersionUID = 1L;

    private List<T> content;
    private int page;
    private int size;
    private long totalItems;

    public Page(List<T> content) {
        this.content = content;
    }

    public Page(List<T> content, int page, int size, long totalItems) {
        this.content = content;
        this.page = page;
        this.size = size;
        this.totalItems = totalItems;
    }

    public List<T> getContent() {
        return content;
    }

    public int getPage() {
        return page;
    }

    public int getSize() {
        return size;
    }

    public long getTotalItems() {
        return totalItems;
    }

    public int getTotalPages() {
        return (int) Math.max(1, (totalItems + size - 1) / size);
    }

    public boolean hasNext() {
        return page < getTotalPages();
    }

    public boolean hasPrevious() {
        return page > 1;
    }
}

