<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Создание новости - Новостной портал</title>
</head>
<body>
    <!-- HEADER -->
    <%@ include file="/WEB-INF/jspf/header.jspf" %>
    <!-- Основной контент -->
    <main class="create-news-page">
        <div class="container">
            <div class="news-form-container">
                <div class="form-header">
                    <h1>Создание новости</h1>
                    <p>Заполните форму ниже, чтобы опубликовать новость</p>
                </div>

                <!-- Сообщения об ошибках -->
                <c:if test="${not empty errorMessage}">
                    <div class="auth-error" style="margin-bottom: 20px;">
                            ${errorMessage}
                    </div>
                </c:if>

                <form action="Controller?command=DO_ADD_NEWS" method="post">
                    <!-- Заголовок новости -->
                    <div class="form-group">
                        <label for="title">Заголовок новости *</label>
                        <input type="text" id="title" name="title" class="form-control"
                               value="${sessionScope.news.title}" placeholder="Введите заголовок новости" required maxlength="200">
                        <div class="char-counter" id="titleCounter">0/200</div>
                    </div>
                    <!-- Заголовок новости -->
                    <div class="form-group">
                        <label for="brief">Краткое описание</label>
                        <textarea class="form-control" id="brief" name="brief" rows="3" required placeholder="Краткое описание новости (отображается в списке новостей)" maxlength="500">${sessionScope.news.brief}</textarea>
                        <div class="char-counter" id="titleCounter">0/500</div>
                    </div>


                    <!-- Полный текст новости -->
                    <div class="form-group">
                        <label for="content_path">Полный текст новости *</label>
                        <textarea id="content_path" name="content_path" class="form-control"
                                  rows="10" placeholder="Введите полный текст новости" required maxlength="10000">${sessionScope.news.content_path}</textarea>
                        <div class="char-counter" id="contentCounter">0/10000</div>
                    </div>

                    <!-- Категория и изображение в одной строке -->
                    <div class="form-row">
                        <div class="form-group">
                            <label for="categoryId">Категория *</label>
                            <select id="categoryId" name="categoryId" class="form-control" required>
                                <option value="">Выберите категорию</option>
                                <option value="1">technologi</option>
                                <option value="2">technologi2</option>
                                <option value="3">technologi3</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="image">Изображение</label>
                            <input type="text" id="image" name="image" class="form-control" accept="image/*">
                        </div>
                    </div>

                    <!-- Дополнительные опции -->
                    <div class="form-group">
                        <label for="status">Статус *</label>
                        <select id="status" name="status" class="form-control" required>
                            <option value="">Выберите выберите</option>
                            <option value="DRAFT" <c:if test="${sessionScope.news.status == 'DRAFT'}">selected</c:if>>Ожидает</option>
                            <option value="ACTIVE" <c:if test="${sessionScope.news.status == 'ACTIVE'}">selected</c:if>>Опубликовать</option>
                            <option value="CREATE" <c:if test="${sessionScope.news.status == 'CREATE'}">selected</c:if>>Скрыть</option>
                        </select>
                    </div>

                    <!-- Кнопки действий -->
                    <div class="form-actions">
                        <a href="Controller?command=PAGE_USER_HOME&page=0" class="btn-cancel">Отмена</a>
                        <button type="submit" class="btn-submit">Создать новость</button>
                    </div>
                </form>

                <div class="form-footer">
                    <p>* Обязательные поля для заполнения</p>
                </div>
            </div>
        </div>
    </main>

    <!-- FOOTER -->
    <%@ include file="/WEB-INF/jspf/footer.jspf" %>

    <!-- Минимальный JavaScript для счетчиков символов и предпросмотра изображения -->
    <script>
        // Счетчики символов
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

        // Добавляем обработчики для всех полей
        document.addEventListener('DOMContentLoaded', function() {
            // Заголовок
            const titleInput = document.getElementById('title');
            if (titleInput) {
                titleInput.addEventListener('input', function() {
                    updateCounter('title', 'titleCounter', 200);
                });
                updateCounter('title', 'titleCounter', 200);
            }

            // Краткое описание
            const shortDescInput = document.getElementById('shortDescription');
            if (shortDescInput) {
                shortDescInput.addEventListener('input', function() {
                    updateCounter('shortDescription', 'shortDescCounter', 500);
                });
                updateCounter('shortDescription', 'shortDescCounter', 500);
            }

            // Полный текст
            const contentInput = document.getElementById('content');
            if (contentInput) {
                contentInput.addEventListener('input', function() {
                    updateCounter('content', 'contentCounter', 10000);
                });
                updateCounter('content', 'contentCounter', 10000);
            }

            // Предпросмотр изображения
            const imageInput = document.getElementById('image');
            const imagePreview = document.getElementById('imagePreview');
            const previewImg = imagePreview.querySelector('img');

            if (imageInput) {
                imageInput.addEventListener('change', function() {
                    if (this.files && this.files[0]) {
                        const reader = new FileReader();

                        reader.onload = function(e) {
                            previewImg.src = e.target.result;
                            imagePreview.style.display = 'block';
                        }

                        reader.readAsDataURL(this.files[0]);
                    } else {
                        imagePreview.style.display = 'none';
                        previewImg.src = '#';
                    }
                });
            }
        });
    </script>

</body>
</html>
