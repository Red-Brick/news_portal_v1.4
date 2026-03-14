<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Личный кабинет - Новостной портал</title>
</head>
<body>
<!-- HEADER -->
<%@ include file="/WEB-INF/jspf/headerUser.jspf" %>

<!-- Основной контент -->
<main class="dashboard">
    <div class="container">
        <!-- Сообщения об успехе/ошибке --><!--
        <c:if test="${not empty successMessage}">
            <div class="message success">${successMessage}</div>
        </c:if>
        <c:if test="${not empty errorMessage}">
            <div class="message error">${errorMessage}</div>
        </c:if>-->

        <div class="dashboard-header">
            <h1 class="section-title">Личный кабинет</h1>
            <a href="Controller?command=PAGE_CREATE_NEWS" class="create-news-btn">Создать новость</a>
        </div>

        <!-- Блок профиля пользователя -->
        <div class="profile-section">
            <div class="profile-header">
                <div class="profile-avatar">
                </div>
                <div style="flex: 1;">
                    <h2 style="font-size: 24px; margin-bottom: 5px;">${sessionScope.user.name} ${sessionScope.user.surname}</h2>
                    <p style="color: #666;">Пользователь</p>
                </div>
            </div>

            <div class="profile-details">
                <div class="detail-item">
                    <span class="detail-label">Email</span>
                    <span class="detail-value">${sessionScope.user.email != null ? sessionScope.user.email : 'не указан'}</span>
                </div>
                <div class="detail-item">
                    <span class="detail-label">Дата регистрации</span>
                    <span class="detail-value">
                        ${sessionScope.user.registrationDate}
                    </span>
                </div>
                <div class="detail-item">
                    <span class="detail-label">Роль</span>
                    <span class="detail-value">${sessionScope.user.role}</span>
                </div>
            </div>
        </div>

        <!-- Список новостей пользователя -->
        <div class="news-section">
            <h3>Мои новости</h3>
            <c:choose>
                <c:when test="${empty sessionScope.listNews}">
                    <table class="news-table">
                        <tr>
                            <td colspan="6" class="empty-news">
                                <p>У вас пока нет созданных новостей</p>
                                <a href="Controller?command=PAGE_CREATE_NEWS" class="create-link">Создать первую новость</a>
                            </td>
                        </tr>
                    </table>
                </c:when>
                <c:otherwise>
                    <table class="news-table">
                        <thead>
                        <tr>
                            <th>Новость</th>
                            <th>Категория</th>
                            <th>Статус</th>
                            <th>Дата создания</th>
                            <th>Действия</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="news" items="${sessionScope.listNews}">
                            <tr>
                                <td>
                                    <div class="news-title">
                                        <a href="Controller?command=PAGE_CREATE_NEWS">${news.title}</a>
                                    </div>
                                    <c:if test="${not empty news.brief}">
                                        <div class="news-meta-small">${news.brief}</div>
                                    </c:if>
                                </td>
                                <td>
                                    <span class="news-category-badge">${news.category}</span>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${news.status == 'ACTIVE'}">
                                            <span class="status-badge status-active">Активен</span>
                                        </c:when>
                                        <c:when test="${news.status == 'CREATE'}">
                                            <span class="status-badge status-create">Создан</span>
                                        </c:when>
                                        <c:when test="${news.status == 'DRAFT'}">
                                            <span class="status-badge status-draft">Черновик</span>
                                        </c:when>
                                        <c:when test="${news.status == 'DELETE'}">
                                            <span class="status-badge status-delete">Удален</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="status-badge status-unknown">Неизвестный статус</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                        <span class="news-meta-small">
                                            ${news.created_at}
                                        </span>
                                </td>
                                <td>
                                    <div class="action-buttons">
                                        <form action="Controller?command=PAGE_EDIT_NEWS" method="post">
                                            <button type="submit" name="newsId" value="${news.id}" class="action-btn edit-btn">Редактировать</button>
                                        </form>
                                        <form action="Controller?command=DO_DELETE_NEWS" method="post" onsubmit="return confirm('Вы уверены, что хотите удалить эту новость?');">
                                            <button type="submit" name="newsId" value="${news.id}" class="action-btn delete-btn">Удалить</button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:otherwise>
            </c:choose>
            <div class="parent">
                <!-- Стрелка "Назад" (влево) -->
                <a href="Controller?command=PAGE_USER_HOME&page=${sessionScope.page > 0 ? sessionScope.page - 1 : 0}"
                   class="pagination-arrow">
                    ← Назад
                </a>

                <!-- Стрелка "Вперед" (вправо) -->
                <a href="Controller?command=PAGE_USER_HOME&page=${sessionScope.page + 1}"
                   class="pagination-arrow">
                    Вперед →
                </a>
            </div>
        </div>
    </div>
</main>

<!-- Минимальный JavaScript только для подтверждения удаления -->
<script>
    // Функция для подтверждения удаления
    document.querySelectorAll('.delete-form').forEach(form => {
        form.addEventListener('submit', function(e) {
            if (!confirm('Вы уверены, что хотите удалить эту новость?')) {
                e.preventDefault();
            }
        });
    });
</script>

<!-- FOOTER -->
<%@ include file="/WEB-INF/jspf/footer.jspf" %>

</body>
</html>