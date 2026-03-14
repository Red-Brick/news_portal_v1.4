<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Создание новости - Новостной портал</title>
</head>
<body>
<!-- HEADER -->
<%@ include file="/WEB-INF/jspf/header.jspf" %>

<!-- Основной контент -->
<main class="edit-news-page">
    <div class="container">
        <div class="news-form-container">
            <div class="form-header">
                <h1>
                    Редактирование новости
                    <span class="edit-badge">ID: ${sessionScope.news.id}</span>
                </h1>
                <p>Измените информацию в форме ниже</p>
            </div>

            <!-- Информация о новости -->
            <div class="news-id-info">
                <strong>Редактирование:</strong>
            </div>

            <!-- Сообщения об ошибках -->
            <c:if test="${not empty sessionScope.errorMessage}">
                <div class="auth-error" style="margin-bottom: 20px;">
                        ${sessionScope.errorMessage}
                </div>
            </c:if>

            <form action="Controller?command=DO_EDIT_NEWS" method="post">
                <!-- Скрытое поле для ID новости -->
                <input type="hidden" name="newsId" value="${sessionScope.news.id}">

                <!-- Заголовок новости -->
                <div class="form-group">
                    <label for="title">Заголовок новости *</label>
                    <input type="text" id="title" name="title" class="form-control"
                           value="${sessionScope.news.title}" placeholder="Введите заголовок новости" required maxlength="200">
                </div>

                <!-- Краткое описание -->
                <div class="form-group">
                    <label for="brief">Краткое описание</label>
                    <textarea class="form-control" id="brief" name="brief" rows="3"
                              required placeholder="Краткое описание новости (отображается в списке новостей)"
                              maxlength="500">${sessionScope.news.brief}</textarea>
                </div>

                <!-- Полный текст новости -->
                <div class="form-group">
                    <label for="content_path">Полный текст новости *</label>
                    <textarea id="content_path" name="content_path" class="form-control"
                              rows="10" placeholder="Введите полный текст новости"
                              required maxlength="10000">${sessionScope.news.content}</textarea>
                </div>

                <!-- Категория и изображение в одной строке -->
                <div class="form-row">
                    <div class="form-group">
                        <label for="categoryId">Категория *</label>
                        <select id="categoryId" name="categoryId" class="form-control" required>
                            <option value="">Выберите категорию</option>
                            <option value="1" ${sessionScope.news.category}>technologi</option>
                            <option value="2" ${sessionScope.news.category}>technologi2</option>
                            <option value="3" ${sessionScope.news.category}>technologi3</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="image">Изображение</label>
                        <input type="text" id="image" name="image" class="form-control"
                               value="${sessionScope.news.image}" placeholder="URL изображения">

                        <!-- Текущее изображение (если есть) -->
                        <c:if test="${not empty sessionScope.news.image}">
                            <div class="current-image">
                                <p><strong>Текущее изображение:</strong></p>
                                <img src="${sessionScope.news.image}" alt="Превью" >
                            </div>
                        </c:if>
                    </div>
                </div>

                <!-- Статус новости -->
                <div class="form-group">
                    <label for="status">Статус *</label>
                    <select id="status" name="status" class="form-control" required>
                        <option value="">Выберите статус</option>
                        <option value="DRAFT" ${sessionScope.news.status == 'DRAFT' ? 'selected' : ''}>Черновик</option>
                        <option value="ACTIVE" ${sessionScope.news.status == 'ACTIVE' ? 'selected' : ''}>Опубликовано</option>
                        <option value="CREATE" ${sessionScope.news.status == 'CREATE' ? 'selected' : ''}>Создано</option>
                        <option value="DELETE" ${sessionScope.news.status == 'DELETE' ? 'selected' : ''}>Удалено</option>
                    </select>
                </div>

                <!-- Кнопки действий -->
                <div class="form-actions">
                    <a href="Controller?command=PAGE_USER_HOME&page=0" class="btn-cancel">Отмена</a>
                    <button type="submit" class="btn-submit">Сохранить изменения</button>
                </div>
            </form>

            <!-- Дополнительная секция с опасными действиями -->
            <div style="margin-top: 30px; padding-top: 20px; border-top: 1px solid #ddd;">
                <h3>Опасная зона</h3>
                <form action="Controller?command=DO_DELETE_NEWS" method="post"
                      onsubmit="return confirm('Вы уверены, что хотите удалить эту новость? Это действие нельзя отменить.');">
                    <input type="hidden" name="newsId" value="${sessionScope.news.id}">
                    <button type="submit" style="background-color: #dc3545; color: white; padding: 8px 16px; border: none; border-radius: 4px; cursor: pointer;">
                        Удалить новость
                    </button>
                </form>
            </div>

            <div class="form-footer">
                <p>* Обязательные поля для заполнения</p>
            </div>
        </div>
    </div>
</main>

<!-- FOOTER -->
<%@ include file="/WEB-INF/jspf/footer.jspf" %>

<!-- JavaScript для счетчиков символов -->
<script>
    function updateCounter(inputId, counterId, maxLength) {
        const input = document.getElementById(inputId);
        const counter = document.getElementById(counterId);

        if (input && counter) {
            const length = input.value.length;
            counter.textContent = length + '/' + maxLength;

            if (length > maxLength * 0.9) {
                counter.classList.add('warning');
            } else {
                counter.classList.remove('warning');
            }
        }
    }

    document.addEventListener('DOMContentLoaded', function() {
        // Заголовок
        const titleInput = document.getElementById('title');
        if (titleInput) {
            titleInput.addEventListener('input', function() {
                updateCounter('title', 'titleCounter', 200);
            });
        }

        // Краткое описание
        const briefInput = document.getElementById('brief');
        if (briefInput) {
            briefInput.addEventListener('input', function() {
                updateCounter('brief', 'briefCounter', 500);
            });
        }

        // Полный текст
        const contentInput = document.getElementById('content_path');
        if (contentInput) {
            contentInput.addEventListener('input', function() {
                updateCounter('content_path', 'contentCounter', 10000);
            });
        }
    });
</script>
</body>
</html>
