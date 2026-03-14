<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page isELIgnored="false" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Авторизация - Новостной портал</title>

</head>

<body>
<!-- HEADER -->
<%@ include file="/WEB-INF/jspf/header.jspf" %>
<!-- Основной контент -->
<main class="main-content">
    <div class="position-absolute top-50 start-50 translate-middle">
        <div class="auth-container">
            <div class="auth-header">
                <h1>Вход в аккаунт</h1>
                <p>Введите свои данные для входа в систему</p>
            </div>
            <c:if test="${param.authError == 'true'}">
                <div class="auth-error">Неверный логин или пароль</div>
            </c:if>
            <c:if test="${param.after_reg == 'true'}">
                <div class="auth-error">Ваша регистрация прошла успешна</div>
            </c:if>

            <form action="Controller?command=do_auth" method="post">
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" placeholder="Введите ваш email" required>
                </div>

                <div class="form-group">
                    <label for="password">Пароль</label>
                    <input type="password" id="password" name="password" placeholder="Введите ваш пароль" required>
                </div>

                <button type="submit" class="form-submit">Войти</button>
            </form>

            <div class="form-footer">
                <p>Нет аккаунта? <a href="Controller?command=page_registration">Зарегистрироваться</a></p>
            </div>

            <div class="divider">
                <span>или войдите с помощью</span>
            </div>

            <div class="social-login">
                <button class="social-btn google">
                    <svg width="18" height="18" viewBox="0 0 18 18" xmlns="http://www.w3.org/2000/svg">
                        <path d="M16.51 8H8.98v3h4.3c-.18 1-.74 1.48-1.6 2.04v2.01h2.6a7.8 7.8 0 0 0 2.38-5.88c0-.57-.05-.66-.15-1.18z" fill="#4285F4"/>
                        <path d="M8.98 17c2.16 0 3.97-.72 5.3-1.94l-2.6-2a4.8 4.8 0 0 1-7.18-2.54H1.83v2.07A8 8 0 0 0 8.98 17z" fill="#34A853"/>
                        <path d="M4.5 10.52a4.8 4.8 0 0 1 0-3.04V5.41H1.83a8 8 0 0 0 0 7.18l2.67-2.07z" fill="#FBBC05"/>
                        <path d="M8.98 4.18c1.17 0 2.23.4 3.06 1.2l2.3-2.3A8 8 0 0 0 1.83 5.4L4.5 7.49a4.77 4.77 0 0 1 4.48-3.3z" fill="#EA4335"/>
                    </svg>
                    Google
                </button>
                <button class="social-btn facebook">
                    <svg width="18" height="18" viewBox="0 0 18 18" xmlns="http://www.w3.org/2000/svg">
                        <path d="M18 9a9 9 0 1 0-10.4 8.87V11.6H5.3V9h2.3V7.02c0-2.27 1.35-3.5 3.4-3.5.98 0 1.82.07 2.07.1v2.4h-1.42c-1.1 0-1.32.52-1.32 1.3V9h2.68l-.43 2.6h-2.25v5.27A9 9 0 0 0 18 9z" fill="#4267B2"/>
                    </svg>
                    Facebook
                </button>
            </div>
        </div>
    </div>
</main>

<!-- FOOTER -->
<%@ include file="/WEB-INF/jspf/footer.jspf" %>
<script>
    // Обработка формы входа
    document.getElementById('loginForm').addEventListener('submit', function(e) {
        e.preventDefault();

        const email = document.getElementById('email').value;
        const password = document.getElementById('password').value;

        // Простая проверка (в реальном приложении здесь был бы запрос к серверу)

    });

    // Обработка кликов по ссылкам с data-route
    document.addEventListener('click', function(e) {
        const target = e.target.closest('[data-route]');
        if (target) {
            e.preventDefault();
            const route = target.getAttribute('data-route');
            // В реальном приложении здесь была бы навигация по маршруту
            alert('Переход по маршруту: ' + route);
        }
    });
</script>
</body>
</html>