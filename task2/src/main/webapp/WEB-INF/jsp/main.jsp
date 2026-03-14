<%@page isELIgnored="false" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Новостной портал</title>
</head>
<body>
<!-- HEADER -->
<%@ include file="/WEB-INF/jspf/header.jspf" %>

<!-- Главная страница -->
<section class="page-content active" id="newsIndexPage">
    <div class="container">
        <h2 class="section-title">Последние новости</h2>
        <c:choose>
            <c:when test="${not empty requestScope.topNews && !empty requestScope.topNews}">
                <div class="row justify-content-center">
                    <c:forEach var="news" items="${requestScope.topNews}" varStatus="status" end="3">
                        <div class="news-grid" >
                            <img src="${news.image}" alt="${news.title}" class="news-image">
                            <div class="news-content">
                                <span class="news-category">${news.category}</span>
                                <h3 class="news-title">${news.title}</h3>
                                <p class="news-excerpt">${news.brief}</p>
                                <div class="news-meta">
                                    <span>${news.date}</span>
                                    <span>Автор:${news.authorSurname} ${news.authorName}</span>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:when>
            <c:otherwise>
                <div class="alert alert-info" role="alert">
                    <h5>Новостей пока нет</h5>
                    <p>В базе данных пока нет новостей. Добавьте новости для отображения на главной странице.</p>
                </div>
            </c:otherwise>
        </c:choose>


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

<!-- FOOTER -->
<%@ include file="/WEB-INF/jspf/footer.jspf" %>

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