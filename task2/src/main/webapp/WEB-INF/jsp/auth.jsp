<%--
  Created by IntelliJ IDEA.
  User: viacheslau.mitkevich
  Date: 23.09.2025
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Авторизация - Новостной портал</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f5f5f5;
            color: #333;
            line-height: 1.6;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .container {
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 15px;
        }

        /* Шапка сайта */
        header {
            background-color: #1a73e8;
            color: white;
            padding: 15px 0;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
            cursor: pointer;
        }

        .nav-menu {
            display: flex;
            gap: 20px;
        }

        .nav-link {
            color: white;
            text-decoration: none;
            padding: 5px 10px;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        .nav-link:hover, .nav-link.active {
            background-color: rgba(255,255,255,0.2);
        }

        .auth-buttons {
            display: flex;
            gap: 15px;
        }

        .btn {
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .btn-login {
            background-color: transparent;
            border: 1px solid white;
            color: white;
        }

        .btn-register {
            background-color: white;
            color: #1a73e8;
        }

        .btn:hover {
            opacity: 0.9;
            transform: translateY(-2px);
        }

        /* Основной контент */
        .main-content {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px 0;
        }

        .auth-container {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 450px;
            padding: 40px;
        }

        .auth-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .auth-header h1 {
            font-size: 28px;
            color: #1a73e8;
            margin-bottom: 10px;
        }

        .auth-header p {
            color: #666;
            font-size: 16px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #333;
        }

        .form-group input {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
            transition: border-color 0.3s;
        }

        .form-group input:focus {
            border-color: #1a73e8;
            outline: none;
        }

        .form-submit {
            width: 100%;
            padding: 14px;
            background-color: #1a73e8;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .form-submit:hover {
            background-color: #0d62d9;
        }

        .form-footer {
            text-align: center;
            margin-top: 25px;
            font-size: 14px;
            color: #666;
        }

        .form-footer a {
            color: #1a73e8;
            text-decoration: none;
            font-weight: 500;
        }

        .form-footer a:hover {
            text-decoration: underline;
        }

        .divider {
            display: flex;
            align-items: center;
            margin: 25px 0;
        }

        .divider::before,
        .divider::after {
            content: "";
            flex: 1;
            border-bottom: 1px solid #ddd;
        }

        .divider span {
            padding: 0 15px;
            color: #666;
            font-size: 14px;
        }

        .social-login {
            display: flex;
            gap: 15px;
            margin-top: 20px;
        }

        .social-btn {
            flex: 1;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            background-color: white;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            font-weight: 500;
            transition: background-color 0.3s;
        }

        .social-btn:hover {
            background-color: #f9f9f9;
        }

        .social-btn.google {
            color: #DB4437;
        }

        .social-btn.facebook {
            color: #4267B2;
        }

        /* Подвал */
        footer {
            background-color: #333;
            color: white;
            padding: 30px 0;
            margin-top: 40px;
        }

        .footer-content {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
        }

        .footer-section {
            flex: 1;
            min-width: 250px;
            margin-bottom: 20px;
        }

        .footer-section h3 {
            font-size: 18px;
            margin-bottom: 15px;
        }

        .footer-section ul {
            list-style: none;
        }

        .footer-section ul li {
            margin-bottom: 8px;
        }

        .footer-section a {
            color: #ddd;
            text-decoration: none;
        }

        .footer-section a:hover {
            color: white;
            text-decoration: underline;
        }

        .copyright {
            text-align: center;
            margin-top: 20px;
            padding-top: 20px;
            border-top: 1px solid #555;
            font-size: 14px;
            color: #aaa;
        }


        /* Адаптивность */
        @media (max-width: 768px) {
            .header-content {
                flex-direction: column;
                gap: 15px;
            }

            .nav-menu {
                flex-wrap: wrap;
                justify-content: center;
            }

            .auth-container {
                padding: 30px 20px;
            }
        }

        /* Класс для оповещения об ошибке аутентификации */
        .auth-error {
            display: flex;
            align-items: center;
            gap: 12px;
            background-color: #ffebee;
            border: 1px solid #f44336;
            border-radius: 8px;
            padding: 16px 20px;
            margin-bottom: 20px;
            color: #c62828;
            font-weight: 500;
            animation: slideIn 0.3s ease-out;
            box-shadow: 0 2px 8px rgba(244, 67, 54, 0.15);
            position: relative;
        }

        .auth-error::before {
            content: '⚠️';
            font-size: 18px;
            flex-shrink: 0;
        }

        .auth-error.hidden {
            display: none;
        }

        .auth-error.fade-out {
            animation: fadeOut 0.3s ease-in forwards;
        }
    </style>
</head>
<body>
<!-- Шапка сайта -->
<header>
    <div class="container">
        <div class="header-content">
            <div class="logo" data-route="/news/index">Новостной портал</div>
            <nav class="nav-menu">
                <a href="#" class="nav-link" data-route="/news/index">Главная</a>
                <a href="#" class="nav-link" data-route="/news/category?cat=politics">Политика</a>
                <a href="#" class="nav-link" data-route="/news/category?cat=economy">Экономика</a>
                <a href="#" class="nav-link" data-route="/news/category?cat=technology">Технологии</a>
                <a href="#" class="nav-link" data-route="/news/category?cat=sports">Спорт</a>
            </nav>
            <div class="auth-buttons">
                <button class="btn btn-login" data-route="/Controller?command=page_auth">Войти</button>
                <button class="btn btn-register" data-route="Controller?command=page_registration">Зарегистрироваться</button>
            </div>
        </div>
    </div>
</header>

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

<!-- Подвал -->
<footer>
    <div class="container">
        <div class="footer-content">
            <div class="footer-section">
                <h3>О нас</h3>
                <p>Новостной портал предоставляет актуальные новости из разных сфер жизни.</p>
            </div>
            <div class="footer-section">
                <h3>Категории</h3>
                <ul>
                    <li><a href="#" data-route="/news/category?cat=politics">Политика</a></li>
                    <li><a href="#" data-route="/news/category?cat=economy">Экономика</a></li>
                    <li><a href="#" data-route="/news/category?cat=technology">Наука и технологии</a></li>
                    <li><a href="#" data-route="/news/category?cat=sports">Спорт</a></li>
                    <li><a href="#" data-route="/news/category?cat=culture">Культура</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h3>Контакты</h3>
                <ul>
                    <li>Email: info@newsportal.ru</li>
                    <li>Телефон: +7 (495) 123-45-67</li>
                    <li>Адрес: Москва, ул. Примерная, д. 1</li>
                </ul>
            </div>
        </div>
        <div class="copyright">
            &copy; 2023 Новостной портал. Все права защищены.
        </div>
    </div>
</footer>

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