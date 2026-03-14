<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 28.09.2025
  Time: 18:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ошибка - Новостной портал</title>
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
        .error-content {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 60px 0;
            text-align: center;
        }

        .error-icon {
            font-size: 120px;
            color: #ff6b6b;
            margin-bottom: 30px;
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }

        .error-code {
            font-size: 120px;
            font-weight: bold;
            color: #1a73e8;
            margin-bottom: 10px;
            line-height: 1;
        }

        .error-title {
            font-size: 32px;
            margin-bottom: 20px;
            color: #333;
        }

        .error-message {
            font-size: 18px;
            color: #666;
            max-width: 600px;
            margin-bottom: 40px;
            line-height: 1.6;
        }

        .error-actions {
            display: flex;
            gap: 15px;
            flex-wrap: wrap;
            justify-content: center;
            margin-bottom: 40px;
        }

        .btn-primary {
            background-color: #1a73e8;
            color: white;
            padding: 12px 24px;
            text-decoration: none;
            border-radius: 4px;
            font-weight: 600;
            transition: background-color 0.3s;
        }

        .btn-primary:hover {
            background-color: #0d62d9;
        }

        .btn-secondary {
            background-color: #f5f5f5;
            color: #333;
            padding: 12px 24px;
            text-decoration: none;
            border-radius: 4px;
            font-weight: 600;
            border: 1px solid #ddd;
            transition: background-color 0.3s;
        }

        .btn-secondary:hover {
            background-color: #e9e9e9;
        }

        .error-details {
            background-color: white;
            border-radius: 8px;
            padding: 20px;
            max-width: 800px;
            width: 100%;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
            text-align: left;
            margin-top: 20px;
        }

        .error-details summary {
            font-weight: 600;
            cursor: pointer;
            padding: 10px;
            background-color: #f8f9fa;
            border-radius: 4px;
        }

        .error-details pre {
            background-color: #f8f9fa;
            padding: 15px;
            border-radius: 4px;
            overflow-x: auto;
            margin-top: 15px;
            font-size: 14px;
            line-height: 1.4;
        }

        .suggestions {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            max-width: 800px;
            width: 100%;
            margin-top: 40px;
        }

        .suggestion-card {
            background-color: white;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
            text-align: left;
        }

        .suggestion-card h3 {
            color: #1a73e8;
            margin-bottom: 10px;
            font-size: 18px;
        }

        .suggestion-card p {
            color: #666;
            font-size: 14px;
            line-height: 1.5;
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

            .error-code {
                font-size: 80px;
            }

            .error-title {
                font-size: 24px;
            }

            .error-message {
                font-size: 16px;
            }

            .error-actions {
                flex-direction: column;
                align-items: center;
            }

            .btn-primary, .btn-secondary {
                width: 100%;
                max-width: 300px;
            }
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
                <button class="btn btn-register" data-route="/auth/register">Зарегистрироваться</button>
            </div>
        </div>
    </div>
</header>

<!-- Основной контент -->
<main class="error-content">
    <div class="container">
        <div class="error-icon">⚠️</div>
        <div class="error-code" id="errorCode">404</div>
        <h1 class="error-title" id="errorTitle">Страница не найдена</h1>
        <p class="error-message" id="errorMessage">
            К сожалению, запрашиваемая страница не существует или была перемещена.
            Проверьте правильность адреса или вернитесь на главную страницу.
        </p>

        <div class="error-actions">
            <a href="#" class="btn-primary" data-route="/news/index">На главную</a>
            <a href="#" class="btn-secondary" onclick="history.back()">Вернуться назад</a>
            <a href="#" class="btn-secondary" data-route="/user/dashboard">Личный кабинет</a>
        </div>

        <div class="suggestions">
            <div class="suggestion-card">
                <h3>Популярные разделы</h3>
                <p>Посетите самые популярные разделы нашего портала с актуальными новостями</p>
            </div>
            <div class="suggestion-card">
                <h3>Поиск по сайту</h3>
                <p>Воспользуйтесь поиском, чтобы найти интересующую вас информацию</p>
            </div>
            <div class="suggestion-card">
                <h3>Техническая поддержка</h3>
                <p>Если проблема повторяется, свяжитесь с нашей технической поддержкой</p>
            </div>
        </div>

        <details class="error-details">
            <summary>Техническая информация</summary>
            <pre id="errorDetails">
Запрошенный URL: <span id="currentUrl"></span>
Время ошибки: <span id="errorTime"></span>
Код ошибки: <span id="errorCodeDetail"></span>
                </pre>
        </details>
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
    // Получение параметров ошибки из URL
    const urlParams = new URLSearchParams(window.location.search);
    const errorCode = urlParams.get('code') || '404';
    const errorType = urlParams.get('type') || 'not_found';

    // Соответствие кодов ошибок заголовкам и сообщениям
    const errorMessages = {
        '400': {
            title: 'Неверный запрос',
            message: 'Сервер не может обработать ваш запрос из-за синтаксической ошибки. Проверьте правильность введенных данных.'
        },
        '401': {
            title: 'Требуется авторизация',
            message: 'Для доступа к этой странице необходимо войти в систему. Пожалуйста, авторизуйтесь.'
        },
        '403': {
            title: 'Доступ запрещен',
            message: 'У вас нет прав для доступа к этой странице. Обратитесь к администратору для получения доступа.'
        },
        '404': {
            title: 'Страница не найдена',
            message: 'К сожалению, запрашиваемая страница не существует или была перемещена. Проверьте правильность адреса или вернитесь на главную страницу.'
        },
        '500': {
            title: 'Внутренняя ошибка сервера',
            message: 'На сервере произошла непредвиденная ошибка. Мы уже работаем над ее устранением. Пожалуйста, попробуйте позже.'
        },
        '503': {
            title: 'Сервис временно недоступен',
            message: 'Сервер временно не может обработать запрос. Это может быть связано с техническими работами или высокой нагрузкой. Пожалуйста, попробуйте позже.'
        }
    };

    // Установка информации об ошибке
    document.addEventListener('DOMContentLoaded', function() {
        const errorInfo = errorMessages[errorCode] || errorMessages['404'];

        document.getElementById('errorCode').textContent = errorCode;
        document.getElementById('errorTitle').textContent = errorInfo.title;
        document.getElementById('errorMessage').textContent = errorInfo.message;
        document.getElementById('errorCodeDetail').textContent = errorCode;
        document.getElementById('currentUrl').textContent = window.location.href;
        document.getElementById('errorTime').textContent = new Date().toLocaleString('ru-RU');

        // Обработка кликов по ссылкам с data-route
        document.addEventListener('click', function(e) {
            const target = e.target.closest('[data-route]');
            if (target) {
                e.preventDefault();
                const route = target.getAttribute('data-route');
                // В реальном приложении здесь была бы навигация по маршруту
                if (route === '/news/index') {
                    window.location.href = '/';
                } else {
                    alert('Переход по маршруту: ' + route);
                }
            }
        });
    });

    // Дополнительная функция для показа/скрытия технических деталей
    function toggleDetails() {
        const details = document.querySelector('.error-details');
        details.open = !details.open;
    }
</script>
</body>
</html>