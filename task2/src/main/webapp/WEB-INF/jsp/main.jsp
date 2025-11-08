<%@page isELIgnored="false" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Новостной портал</title>
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

        /* Формы входа и регистрации */
        .auth-forms {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.5);
            z-index: 1000;
            justify-content: center;
            align-items: center;
        }

        .auth-form {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            width: 90%;
            max-width: 400px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }

        .form-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .form-header h2 {
            font-size: 22px;
        }

        .close-btn {
            background: none;
            border: none;
            font-size: 24px;
            cursor: pointer;
            color: #666;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: 500;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
        }

        .form-submit {
            width: 100%;
            padding: 12px;
            background-color: #1a73e8;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            margin-top: 10px;
        }

        .form-footer {
            text-align: center;
            margin-top: 15px;
            font-size: 14px;
        }

        .form-footer a {
            color: #1a73e8;
            text-decoration: none;
            cursor: pointer;
        }

        /* Контент страниц */
        .page-content {
            display: none;
            padding: 30px 0;
            min-height: 60vh;
        }

        .page-content.active {
            display: block;
        }

        .section-title {
            font-size: 28px;
            margin-bottom: 20px;
            color: #333;
            border-bottom: 2px solid #1a73e8;
            padding-bottom: 10px;
        }

        /* Новостная лента */
        .news-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 25px;
            margin-top: 20px;
        }

        .news-card {
            background-color: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
            cursor: pointer;
        }

        .news-card:hover {
            transform: translateY(-5px);
        }

        .news-image {
            width: 100%;
            height: 180px;
            object-fit: cover;
        }

        .news-content {
            padding: 20px;
        }

        .news-category {
            display: inline-block;
            background-color: #e8f0fe;
            color: #1a73e8;
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 12px;
            font-weight: 600;
            margin-bottom: 10px;
        }

        .news-title {
            font-size: 18px;
            margin-bottom: 10px;
            line-height: 1.4;
        }

        .news-excerpt {
            color: #666;
            font-size: 14px;
            margin-bottom: 15px;
        }

        .news-meta {
            display: flex;
            justify-content: space-between;
            font-size: 12px;
            color: #999;
        }

        /* Страница новости */
        .news-detail {
            background-color: white;
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
        }

        .news-detail-image {
            width: 100%;
            max-height: 400px;
            object-fit: cover;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        .news-detail-content {
            line-height: 1.8;
        }

        .news-detail-content h1 {
            font-size: 32px;
            margin-bottom: 15px;
            color: #333;
        }

        .news-detail-meta {
            display: flex;
            gap: 20px;
            margin-bottom: 20px;
            color: #666;
            font-size: 14px;
        }

        .back-button {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #1a73e8;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        .back-button:hover {
            background-color: #0d62d9;
        }

        /* Страница профиля */
        .profile-info {
            background-color: white;
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
            max-width: 600px;
            margin: 0 auto;
        }

        .profile-avatar {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            background-color: #e8f0fe;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 40px;
            color: #1a73e8;
            margin: 0 auto 20px;
        }

        .profile-field {
            margin-bottom: 15px;
            padding-bottom: 15px;
            border-bottom: 1px solid #eee;
        }

        .profile-label {
            font-weight: 600;
            color: #666;
            margin-bottom: 5px;
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

            .news-grid {
                grid-template-columns: 1fr;
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
                <a class="btn btn-login" href="Controller?command=page_auth">Войти</a>
                <a class="btn btn-register" href="Controller?command=page_registration">Зарегистрироваться</a>
            </div>
        </div>
    </div>
</header>

<!-- Форма входа -->
<div class="auth-forms" id="loginForm">
    <div class="auth-form">
        <div class="form-header">
            <h2>Вход в аккаунт</h2>
            <button class="close-btn" id="closeLogin">&times;</button>
        </div>
        <form id="loginFormData">
            <div class="form-group">
                <label for="loginEmail">Email</label>
                <input type="email" id="loginEmail" required>
            </div>
            <div class="form-group">
                <label for="loginPassword">Пароль</label>
                <input type="password" id="loginPassword" required>
            </div>
            <button type="submit" class="form-submit">Войти</button>
        </form>
        <div class="form-footer">
            Нет аккаунта? <a id="switchToRegister">Зарегистрироваться</a>
        </div>
    </div>
</div>

<!-- Форма регистрации -->
<div class="auth-forms" id="registerForm">
    <div class="auth-form">
        <div class="form-header">
            <h2>Регистрация</h2>
            <button class="close-btn" id="closeRegister">&times;</button>
        </div>
        <form id="registerFormData">
            <div class="form-group">
                <label for="registerName">Имя</label>
                <input type="text" id="registerName" required>
            </div>
            <div class="form-group">
                <label for="registerEmail">Email</label>
                <input type="email" id="registerEmail" required>
            </div>
            <div class="form-group">
                <label for="registerPassword">Пароль</label>
                <input type="password" id="registerPassword" required>
            </div>
            <div class="form-group">
                <label for="registerConfirmPassword">Подтвердите пароль</label>
                <input type="password" id="registerConfirmPassword" required>
            </div>
            <button type="submit" class="form-submit">Зарегистрироваться</button>
        </form>
        <div class="form-footer">
            Уже есть аккаунт? <a id="switchToLogin">Войти</a>
        </div>
    </div>
</div>

<!-- Главная страница -->
<section class="page-content active" id="newsIndexPage">
    <div class="container">
        <h2 class="section-title">Последние новости</h2>
        <c:forEach var="news" items="${requestScope.topNews}">
        <div class="news-grid" ><!--id="newsContainer"-->

                <!-- <img src="$" alt="${news.title}" class="news-image">
                <div class="news-content">
                    <span class="news-category"></span>
                    <h3 class="news-title">${news.title}</h3>
                    <p class="news-excerpt">${news.excerpt}</p>
                    <div class="news-meta">
                        <span></span>
                        <span>Автор: Редакция</span>
                    </div>
                </div>-->

                <img src="${news.image}" alt="${news.title}" class="news-image">
                <div class="news-content">
                    <span class="news-category"></span>
                    <h3 class="news-title">${news.title}</h3>
                    <p class="news-excerpt">${news.excerpt}</p>
                    <div class="news-meta">
                        <span>${news.dats}</span>
                        <span>Автор: Редакция</span>
                    </div>
                </div>

        </div>
        </c:forEach>
    </div>
</section>

<!-- Страница категории -->
<section class="page-content" id="newsCategoryPage">
    <div class="container">
        <h2 class="section-title" id="categoryTitle">Новости категории</h2>
        <div class="news-grid" id="categoryNewsContainer">
            <!-- Новости категории будут добавлены через JavaScript -->
        </div>
    </div>
</section>

<!-- Страница новости -->
<section class="page-content" id="newsDetailPage">
    <div class="container">
        <div class="news-detail">

        </div>
    </div>
</section>




<!-- Страница профиля -->
<section class="page-content" id="profilePage">
    <div class="container">
        <h2 class="section-title">Профиль пользователя</h2>
        <div class="profile-info" id="profileContent">
            <!-- Контент профиля будет добавлен через JavaScript -->
        </div>
    </div>
</section>

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
    // Система маршрутизации
    class Router {
        constructor() {
            this.routes = {};
            this.currentRoute = '';
            this.init();
        }

        // Инициализация роутера
        init() {
            // Обработка кликов по ссылкам с data-route
            document.addEventListener('click', (e) => {
                const target = e.target.closest('[data-route]');
                if (target) {
                    e.preventDefault();
                    this.navigate(target.getAttribute('data-route'));
                }
            });

            // Обработка изменения хэша в URL
            window.addEventListener('hashchange', () => {
                this.handleRouteChange();
            });

            // Первоначальная обработка маршрута
            this.handleRouteChange();
        }

        // Регистрация маршрута
        addRoute(route, handler) {
            this.routes[route] = handler;
        }

        // Навигация по маршруту
        navigate(route) {
            window.location.hash = route;
        }

        // Обработка изменения маршрута
        handleRouteChange() {
            const hash = window.location.hash.substring(1) || '/news/index';
            const [path, queryString] = hash.split('?');
            const params = new URLSearchParams(queryString);

            this.currentRoute = path;

            // Вызываем обработчик маршрута, если он зарегистрирован
            if (this.routes[path]) {
                this.routes[path](params);
            } else {
                // Если маршрут не найден, показываем главную страницу
                this.navigate('/news/index');
            }

            // Обновляем активные ссылки в навигации
            this.updateActiveLinks();
        }

        // Обновление активных ссылок в навигации
        updateActiveLinks() {
            document.querySelectorAll('[data-route]').forEach(link => {
                const route = link.getAttribute('data-route').split('?')[0];
                link.classList.toggle('active', route === this.currentRoute);
            });
        }
    }

    // Данные новостей
    const newsData = [
        {
            id: 1,
            title: "Новые технологии в медицине: прорыв в лечении онкологии",
            excerpt: "Ученые представили инновационный метод лечения рака с помощью наночастиц, который показал высокую эффективность в клинических испытаниях.",
            content: "Ученые из ведущих исследовательских центров мира объявили о прорыве в лечении онкологических заболеваний. Новый метод, основанный на использовании наночастиц, позволяет точечно воздействовать на раковые клетки, минимизируя повреждение здоровых тканей. В клинических испытаниях метод показал эффективность в 85% случаев при лечении различных видов рака на ранних стадиях.",
            category: "technology",
            date: "15.10.2023",
            image: "https://avatars.dzeninfra.ru/get-zen_doc/271828/pub_678b420dfd59350cc90890c2_678b4218fd59350cc90895ce/scale_1200"
        },
        {
            id: 2,
            title: "Экономический форум: перспективы развития мировой экономики",
            excerpt: "Эксперты обсуждают пути восстановления экономики после пандемии и новые вызовы, стоящие перед мировым сообществом.",
            content: "На международном экономическом форуме, проходящем в эти дни, ведущие эксперты обсуждают актуальные вопросы мировой экономики. Основные темы включают восстановление после пандемии, цифровизацию экономики, экологические вызовы и новые модели международного сотрудничества. Особое внимание уделяется развивающимся рынкам и их роли в глобальной экономике.",
            category: "economy",
            date: "14.10.2023",
            image: "https://avatars.mds.yandex.net/i?id=3a12bcad80002d1c0ab4b61be9e756dd_l-8181332-images-thumbs&n=13"
        },
        {
            id: 3,
            title: "Киберспортивный турнир собрал рекордное количество зрителей",
            excerpt: "Финальные матчи чемпионата по киберспорту посмотрели более 2 миллионов человек по всему миру, установив новый рекорд.",
            content: "Крупнейший киберспортивный турнир года установил новый рекорд по количеству зрителей. Финальные матчи собрали у экранов более 2 миллионов человек по всему миру. Организаторы отмечают растущий интерес к киберспорту как со стороны молодежи, так и со стороны традиционных спортивных болельщиков. Призовой фонд турнира составил 5 миллионов долларов.",
            category: "sports",
            date: "13.10.2023",
            image: "https://avatars.mds.yandex.net/i?id=1b656a0f08f6321a2b2bcdff0eeb94c4_l-4723319-images-thumbs&n=13"
        },
        {
            id: 4,
            title: "Выставка современного искусства откроется в столице",
            excerpt: "В галерее современного искусства пройдет масштабная выставка работ молодых художников со всей страны.",
            content: "В столичной галерее современного искусства готовится к открытию масштабная выставка, на которой будут представлены работы молодых художников из разных регионов страны. Экспозиция включает более 200 произведений в различных жанрах: от живописи и скульптуры до цифрового искусства и инсталляций. Выставка продлится два месяца и будет сопровождаться серией лекций и мастер-классов.",
            category: "culture",
            date: "12.10.2023",
            image: "https://b1.mskagency.ru/c/712039.jpg"
        },
        {
            id: 5,
            title: "Изменения в законодательстве: что ждет бизнес в следующем году",
            excerpt: "Правительство анонсировало ряд изменений в налоговом законодательстве, которые затронут малый и средний бизнес.",
            content: "Правительство объявило о планах по внесению изменений в налоговое законодательство, которые вступят в силу с начала следующего года. Основные изменения коснутся малого и среднего бизнеса: планируется упрощение налоговой отчетности, введение новых льгот для начинающих предпринимателей и корректировка ставок для отдельных категорий налогоплательщиков. Эксперты оценивают предлагаемые изменения как позитивные для развития бизнес-среды.",
            category: "politics",
            date: "11.10.2023",
            image: "https://nizhneingashskij-r04.gosweb.gosuslugi.ru/netcat_files/generated/99/159/760x570/561/8ef1b78ef551488a260b0753c523292c.jpg?crop=0%3A0%3A0%3A0&hash=2ba22aa0565ae5af3ef70451a0a65e1a&resize_mode=0&wm_m=0"
        },
        {
            id: 6,
            title: "Климатический саммит: новые обязательства по сокращению выбросов",
            excerpt: "Лидеры мировых держав договорились о новых мерах по борьбе с изменением климата на прошедшем саммите.",
            content: "На завершившемся климатическом саммите лидеры ведущих мировых держав приняли новые обязательства по сокращению выбросов парниковых газов. Основной целью является достижение углеродной нейтральности к 2050 году. Для этого планируется увеличить инвестиции в возобновляемую энергетику, внедрить новые экологические стандарты в промышленности и развивать технологии улавливания и хранения углекислого газа.",
            category: "ecology",
            date: "10.10.2023",
            image: "https://gdb.rferl.org/05e00000-0a00-0242-0543-08d99c713ff5_w1200_h630.jpg"
        }
    ];

    // Категории новостей
    const categories = {
        'politics': 'Политика',
        'economy': 'Экономика',
        'technology': 'Технологии',
        'sports': 'Спорт',
        'culture': 'Культура',
        'ecology': 'Экология'
    };

    // Функции для отображения контента
    const contentManager = {
        // Показать страницу
        showPage(pageId) {
            document.querySelectorAll('.page-content').forEach(page => {
                page.classList.remove('active');
            });
            document.getElementById(pageId).classList.add('active');
        },

        // Отобразить новости
        displayNews(newsArray, containerId) {
            const container = document.getElementById(containerId);
            container.innerHTML = '';

            if (newsArray.length === 0) {
                container.innerHTML = '<p>Новости не найдены</p>';
                return;
            }

            newsArray.forEach(news => {
                const newsCard = document.createElement('div');
                newsCard.className = 'news-card';
                newsCard.setAttribute('data-route', `/news/detail?id=${news.id}`);
                newsCard.innerHTML = `
                        <img src="${news.image}" alt="${news.title}" class="news-image">
                        <div class="news-content">
                            <span class="news-category">${categories[news.category] || news.category}</span>
                            <h3 class="news-title">${news.title}</h3>
                            <p class="news-excerpt">${news.excerpt}</p>
                            <div class="news-meta">
                                <span>${news.date}</span>
                                <span>Автор: Редакция</span>
                            </div>
                        </div>
                    `;
                container.appendChild(newsCard);
            });
        },

        // Отобразить детальную страницу новости
        displayNewsDetail(newsId) {
            const news = newsData.find(item => item.id == newsId);
            const container = document.getElementById('newsDetailContent');

            if (!news) {
                container.innerHTML = '<p>Новость не найдена</p>';
                return;
            }

            container.innerHTML = `
                    <img src="${news.image}" alt="${news.title}" class="news-detail-image">
                    <div class="news-detail-content">
                        <span class="news-category">${categories[news.category] || news.category}</span>
                        <h1>${news.title}</h1>
                        <div class="news-detail-meta">
                            <span>${news.date}</span>
                            <span>Автор: Редакция</span>
                        </div>
                        <p>${news.content}</p>
                        <a href="#" class="back-button" data-route="/news/index">Назад к новостям</a>
                    </div>
                `;
        },

        // Отобразить страницу категории
        displayCategory(category) {
            const filteredNews = newsData.filter(news => news.category === category);
            const title = document.getElementById('categoryTitle');
            title.textContent = `Новости категории: ${categories[category] || category}`;

            this.displayNews(filteredNews, 'categoryNewsContainer');
        },

        // Отобразить профиль пользователя
        displayProfile() {
            const user = JSON.parse(localStorage.getItem('currentUser')) || {name: 'Гость', email: 'Не авторизован'};
            const container = document.getElementById('profileContent');

            container.innerHTML = `
                    <div class="profile-avatar">${user.name ? user.name.charAt(0).toUpperCase() : 'Г'}</div>
                    <div class="profile-field">
                        <div class="profile-label">Имя</div>
                        <div>${user.name || 'Не указано'}</div>
                    </div>
                    <div class="profile-field">
                        <div class="profile-label">Email</div>
                        <div>${user.email}</div>
                    </div>
                    <div class="profile-field">
                        <div class="profile-label">Дата регистрации</div>
                        <div>${user.registrationDate || 'Неизвестно'}</div>
                    </div>
                    ${user.name ? '<button class="btn btn-login" id="logoutBtn" style="margin-top: 20px;">Выйти</button>' : ''}
                `;

            if (user.name) {
                document.getElementById('logoutBtn').addEventListener('click', () => {
                    localStorage.removeItem('currentUser');
                    router.navigate('/news/index');
                });
            }
        }
    };

    // Инициализация роутера
    const router = new Router();

    // Регистрация маршрутов
    router.addRoute('/news/index', () => {
        contentManager.showPage('newsIndexPage');
        contentManager.displayNews(newsData, 'newsContainer');
    });

    router.addRoute('/news/category', (params) => {
        const category = params.get('cat');
        contentManager.showPage('newsCategoryPage');
        contentManager.displayCategory(category);
    });

    router.addRoute('/news/detail', (params) => {
        const newsId = params.get('id');
        contentManager.showPage('newsDetailPage');
        contentManager.displayNewsDetail(newsId);
    });

    router.addRoute('/auth/login', () => {
        document.getElementById('loginForm').style.display = 'flex';
    });

    router.addRoute('/auth/register', () => {
        document.getElementById('registerForm').style.display = 'flex';
    });

    router.addRoute('/user/profile', () => {
        contentManager.showPage('profilePage');
        contentManager.displayProfile();
    });

    // Обработка форм авторизации
    document.addEventListener('DOMContentLoaded', function() {
        // Закрытие форм
        document.getElementById('closeLogin').addEventListener('click', () => {
            document.getElementById('loginForm').style.display = 'none';
        });

        document.getElementById('closeRegister').addEventListener('click', () => {
            document.getElementById('registerForm').style.display = 'none';
        });

        // Переключение между формами
        document.getElementById('switchToRegister').addEventListener('click', () => {
            document.getElementById('loginForm').style.display = 'none';
            document.getElementById('registerForm').style.display = 'flex';
        });

        document.getElementById('switchToLogin').addEventListener('click', () => {
            document.getElementById('registerForm').style.display = 'none';
            document.getElementById('loginForm').style.display = 'flex';
        });

        // Обработка формы входа
        document.getElementById('loginFormData').addEventListener('submit', (e) => {
            e.preventDefault();
            const email = document.getElementById('loginEmail').value;
            const password = document.getElementById('loginPassword').value;

            // Простая проверка (в реальном приложении здесь был бы запрос к серверу)
            const users = JSON.parse(localStorage.getItem('users')) || [];
            const user = users.find(u => u.email === email && u.password === password);

            if (user) {
                localStorage.setItem('currentUser', JSON.stringify(user));
                document.getElementById('loginForm').style.display = 'none';
                alert('Вход выполнен успешно!');
                router.navigate('/user/profile');
            } else {
                alert('Неверный email или пароль');
            }
        });

        // Обработка формы регистрации
        document.getElementById('registerFormData').addEventListener('submit', (e) => {
            e.preventDefault();
            const name = document.getElementById('registerName').value;
            const email = document.getElementById('registerEmail').value;
            const password = document.getElementById('registerPassword').value;
            const confirmPassword = document.getElementById('registerConfirmPassword').value;

            if (password !== confirmPassword) {
                alert('Пароли не совпадают');
                return;
            }

            // Сохранение пользователя (в реальном приложении здесь был бы запрос к серверу)
            const users = JSON.parse(localStorage.getItem('users')) || [];

            if (users.find(u => u.email === email)) {
                alert('Пользователь с таким email уже существует');
                return;
            }

            const newUser = {
                name,
                email,
                password,
                registrationDate: new Date().toLocaleDateString('ru-RU')
            };

            users.push(newUser);
            localStorage.setItem('users', JSON.stringify(users));
            localStorage.setItem('currentUser', JSON.stringify(newUser));

            document.getElementById('registerForm').style.display = 'none';
            alert('Регистрация прошла успешно!');
            router.navigate('/user/profile');
        });

        // Закрытие форм при клике вне их области
        window.addEventListener('click', (e) => {
            if (e.target.classList.contains('auth-forms')) {
                e.target.style.display = 'none';
            }
        });
    });
</script>
</body>
</html>