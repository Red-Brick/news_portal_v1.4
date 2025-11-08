<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 28.09.2025
  Time: 17:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Личный кабинет - Новостной портал</title>
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

        .user-menu {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .user-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: rgba(255,255,255,0.2);
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            cursor: pointer;
        }

        .btn {
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .btn-primary {
            background-color: white;
            color: #1a73e8;
        }

        .btn-secondary {
            background-color: transparent;
            border: 1px solid white;
            color: white;
        }

        .btn:hover {
            opacity: 0.9;
            transform: translateY(-2px);
        }

        /* Основной контент */
        .dashboard {
            padding: 30px 0;
        }

        .dashboard-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .section-title {
            font-size: 28px;
            color: #333;
            border-bottom: 2px solid #1a73e8;
            padding-bottom: 10px;
        }

        .create-news-btn {
            background-color: #1a73e8;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .create-news-btn:hover {
            background-color: #0d62d9;
        }

        /* Статистика */
        .stats-cards {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .stat-card {
            background-color: white;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
            text-align: center;
        }

        .stat-number {
            font-size: 32px;
            font-weight: bold;
            color: #1a73e8;
            margin-bottom: 10px;
        }

        .stat-label {
            color: #666;
            font-size: 14px;
        }

        /* Таблица новостей */
        .news-table-container {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
            overflow: hidden;
        }

        .table-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px;
            border-bottom: 1px solid #eee;
        }

        .table-title {
            font-size: 18px;
            font-weight: 600;
        }

        .table-actions {
            display: flex;
            gap: 10px;
        }

        .search-box {
            padding: 8px 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            width: 250px;
        }

        .news-table {
            width: 100%;
            border-collapse: collapse;
        }

        .news-table th {
            background-color: #f8f9fa;
            padding: 15px;
            text-align: left;
            font-weight: 600;
            color: #333;
            border-bottom: 1px solid #eee;
        }

        .news-table td {
            padding: 15px;
            border-bottom: 1px solid #eee;
        }

        .news-title-cell {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .news-image {
            width: 60px;
            height: 40px;
            object-fit: cover;
            border-radius: 4px;
        }

        .news-title {
            font-weight: 500;
        }

        .status-published {
            background-color: #e8f5e9;
            color: #2e7d32;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 500;
        }

        .status-draft {
            background-color: #fff3e0;
            color: #ef6c00;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 500;
        }

        .action-buttons {
            display: flex;
            gap: 10px;
        }

        .btn-edit {
            background-color: #1a73e8;
            color: white;
            padding: 5px 10px;
            border: none;
            border-radius: 4px;
            font-size: 12px;
            cursor: pointer;
        }

        .btn-delete {
            background-color: #f44336;
            color: white;
            padding: 5px 10px;
            border: none;
            border-radius: 4px;
            font-size: 12px;
            cursor: pointer;
        }

        /* Форма создания/редактирования новости */
        .modal-overlay {
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

        .modal-content {
            background-color: white;
            border-radius: 8px;
            width: 90%;
            max-width: 800px;
            max-height: 90vh;
            overflow-y: auto;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }

        .modal-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px;
            border-bottom: 1px solid #eee;
        }

        .modal-title {
            font-size: 22px;
        }

        .close-btn {
            background: none;
            border: none;
            font-size: 24px;
            cursor: pointer;
            color: #666;
        }

        .modal-body {
            padding: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
        }

        .form-group input, .form-group select, .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
        }

        .form-group textarea {
            min-height: 150px;
            resize: vertical;
        }

        .form-row {
            display: flex;
            gap: 20px;
        }

        .form-row .form-group {
            flex: 1;
        }

        .image-preview {
            margin-top: 10px;
            max-width: 200px;
            border-radius: 4px;
        }

        .modal-footer {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
            padding: 20px;
            border-top: 1px solid #eee;
        }

        .btn-cancel {
            background-color: #f5f5f5;
            color: #333;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .btn-save {
            background-color: #1a73e8;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
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

            .dashboard-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }

            .form-row {
                flex-direction: column;
                gap: 0;
            }

            .table-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }

            .search-box {
                width: 100%;
            }

            .news-table {
                display: block;
                overflow-x: auto;
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
                <a href="Controller?command=page_main" class="nav-link">Главная</a>
                <a href="#" class="nav-link" data-route="/news/category?cat=politics">Политика</a>
                <a href="#" class="nav-link" data-route="/news/category?cat=economy">Экономика</a>
                <a href="#" class="nav-link" data-route="/news/category?cat=technology">Технологии</a>
                <a href="#" class="nav-link" data-route="/news/category?cat=sports">Спорт</a>
                <a href="#" class="nav-link active" data-route="/user/dashboard">Личный кабинет</a>
            </nav>
            <div class="user-menu">
                <div class="user-avatar" id="userAvatar">Slava</div>
                <button class="btn btn-secondary" id="logoutBtn">Выйти</button>
            </div>
        </div>
    </div>
</header>

<!-- Основной контент -->
<main class="dashboard">
    <div class="container">
        <div class="dashboard-header">
            <h1 class="section-title">Личный кабинет</h1>
            <button class="create-news-btn" id="createNewsBtn">Создать новость</button>
        </div>

        <!-- Статистика -->
        <div class="stats-cards">
            <div class="stat-card">
                <div class="stat-number" id="totalNews">12</div>
                <div class="stat-label">Всего новостей</div>
            </div>
            <div class="stat-card">
                <div class="stat-number" id="publishedNews">8</div>
                <div class="stat-label">Опубликовано</div>
            </div>
            <div class="stat-card">
                <div class="stat-number" id="draftNews">4</div>
                <div class="stat-label">Черновики</div>
            </div>
            <div class="stat-card">
                <div class="stat-number" id="viewsCount">1.2K</div>
                <div class="stat-label">Просмотры</div>
            </div>
        </div>

        <!-- Таблица новостей -->
        <div class="news-table-container">
            <div class="table-header">
                <div class="table-title">Мои новости</div>
                <div class="table-actions">
                    <input type="text" class="search-box" placeholder="Поиск новостей...">
                    <select id="statusFilter">
                        <option value="all">Все статусы</option>
                        <option value="published">Опубликованные</option>
                        <option value="draft">Черновики</option>
                    </select>
                </div>
            </div>
            <table class="news-table">
                <thead>
                <tr>
                    <th>Новость</th>
                    <th>Категория</th>
                    <th>Дата</th>
                    <th>Статус</th>
                    <th>Просмотры</th>
                    <th>Действия</th>
                </tr>
                </thead>
                <tbody id="newsTableBody">
                <!-- Данные будут добавлены через JavaScript -->
                </tbody>
            </table>
        </div>
    </div>
</main>

<!-- Модальное окно создания/редактирования новости -->
<div class="modal-overlay" id="newsModal">
    <div class="modal-content">
        <div class="modal-header">
            <h2 class="modal-title" id="modalTitle">Создать новость</h2>
            <button class="close-btn" id="closeModal">&times;</button>
        </div>
        <div class="modal-body">
            <form id="newsForm">
                <div class="form-row">
                    <div class="form-group">
                        <label for="newsTitle">Заголовок новости</label>
                        <input type="text" id="newsTitle" required>
                    </div>
                    <div class="form-group">
                        <label for="newsCategory">Категория</label>
                        <select id="newsCategory" required>
                            <option value="">Выберите категорию</option>
                            <option value="politics">Политика</option>
                            <option value="economy">Экономика</option>
                            <option value="technology">Технологии</option>
                            <option value="sports">Спорт</option>
                            <option value="culture">Культура</option>
                            <option value="ecology">Экология</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="newsImage">Изображение</label>
                    <input type="file" id="newsImage" accept="image/*">
                    <img src="" alt="Превью" class="image-preview" id="imagePreview" style="display: none;">
                </div>
                <div class="form-group">
                    <label for="newsExcerpt">Краткое описание</label>
                    <textarea id="newsExcerpt" required></textarea>
                </div>
                <div class="form-group">
                    <label for="newsContent">Полный текст новости</label>
                    <textarea id="newsContent" required></textarea>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label for="newsStatus">Статус</label>
                        <select id="newsStatus">
                            <option value="draft">Черновик</option>
                            <option value="published">Опубликовать</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="newsDate">Дата публикации</label>
                        <input type="date" id="newsDate">
                    </div>
                </div>
            </form>
        </div>
        <div class="modal-footer">
            <button class="btn-cancel" id="cancelBtn">Отмена</button>
            <button class="btn-save" id="saveBtn">Сохранить</button>
        </div>
    </div>
</div>

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
    // Данные пользователя
    const currentUser = JSON.parse(localStorage.getItem('currentUser')) || {
        name: 'Иван Иванов',
        email: 'ivan@example.com'
    };

    // Данные новостей пользователя
    let userNews = JSON.parse(localStorage.getItem('userNews')) || [
        {
            id: 1,
            title: "Новые технологии в медицине: прорыв в лечении онкологии",
            excerpt: "Ученые представили инновационный метод лечения рака с помощью наночастиц, который показал высокую эффективность в клинических испытаниях.",
            content: "Ученые из ведущих исследовательских центров мира объявили о прорыве в лечении онкологических заболеваний. Новый метод, основанный на использовании наночастиц, позволяет точечно воздействовать на раковые клетки, минимизируя повреждение здоровых тканей. В клинических испытаниях метод показал эффективность в 85% случаев при лечении различных видов рака на ранних стадиях.",
            category: "technology",
            status: "published",
            date: "2023-10-15",
            views: 342,
            image: "https://avatars.dzeninfra.ru/get-zen_doc/271828/pub_678b420dfd59350cc90890c2_678b4218fd59350cc90895ce/scale_1200"
        },
        {
            id: 2,
            title: "Экономический форум: перспективы развития мировой экономики",
            excerpt: "Эксперты обсуждают пути восстановления экономики после пандемии и новые вызовы, стоящие перед мировым сообществом.",
            content: "На международном экономическом форуме, проходящем в эти дни, ведущие эксперты обсуждают актуальные вопросы мировой экономики. Основные темы включают восстановление после пандемии, цифровизацию экономики, экологические вызовы и новые модели международного сотрудничества. Особое внимание уделяется развивающимся рынкам и их роли в глобальной экономике.",
            category: "economy",
            status: "published",
            date: "2023-10-14",
            views: 215,
            image: "https://avatars.mds.yandex.net/i?id=3a12bcad80002d1c0ab4b61be9e756dd_l-8181332-images-thumbs&n=13"
        },
        {
            id: 3,
            title: "Изменения в законодательстве: что ждет бизнес в следующем году",
            excerpt: "Правительство анонсировало ряд изменений в налоговом законодательстве, которые затронут малый и средний бизнес.",
            content: "Правительство объявило о планах по внесению изменений в налоговое законодательство, которые вступят в силу с начала следующего года. Основные изменения коснутся малого и среднего бизнеса: планируется упрощение налоговой отчетности, введение новых льгот для начинающих предпринимателей и корректировка ставок для отдельных категорий налогоплательщиков. Эксперты оценивают предлагаемые изменения как позитивные для развития бизнес-среды.",
            category: "politics",
            status: "draft",
            date: "2023-10-11",
            views: 0,
            image: "https://nizhneingashskij-r04.gosweb.gosuslugi.ru/netcat_files/generated/99/159/760x570/561/8ef1b78ef551488a260b0753c523292c.jpg?crop=0%3A0%3A0%3A0&hash=2ba22aa0565ae5af3ef70451a0a65e1a&resize_mode=0&wm_m=0"
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

    // Текущая редактируемая новость
    let currentEditingNews = null;

    // Инициализация страницы
    document.addEventListener('DOMContentLoaded', function() {
        // Установка имени пользователя
        document.getElementById('userAvatar').textContent =
            currentUser.name ? currentUser.name.split(' ').map(n => n[0]).join('') : 'П';

        // Загрузка статистики
        updateStats();

        // Загрузка таблицы новостей
        renderNewsTable();

        // Обработчики событий
        document.getElementById('createNewsBtn').addEventListener('click', openCreateModal);
        document.getElementById('closeModal').addEventListener('click', closeModal);
        document.getElementById('cancelBtn').addEventListener('click', closeModal);
        document.getElementById('saveBtn').addEventListener('click', saveNews);
        document.getElementById('logoutBtn').addEventListener('click', logout);
        document.getElementById('newsImage').addEventListener('change', handleImageUpload);
        document.getElementById('statusFilter').addEventListener('change', filterNews);
        document.querySelector('.search-box').addEventListener('input', filterNews);

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
    });

    // Обновление статистики
    function updateStats() {
        const totalNews = userNews.length;
        const publishedNews = userNews.filter(news => news.status === 'published').length;
        const draftNews = userNews.filter(news => news.status === 'draft').length;
        const viewsCount = userNews.reduce((sum, news) => sum + news.views, 0);

        document.getElementById('totalNews').textContent = totalNews;
        document.getElementById('publishedNews').textContent = publishedNews;
        document.getElementById('draftNews').textContent = draftNews;
        document.getElementById('viewsCount').textContent = viewsCount > 1000 ?
            (viewsCount / 1000).toFixed(1) + 'K' : viewsCount;
    }

    // Отображение таблицы новостей
    function renderNewsTable(newsList = userNews) {
        const tableBody = document.getElementById('newsTableBody');
        tableBody.innerHTML = '';

        if (newsList.length === 0) {
            tableBody.innerHTML = `
                    <tr>
                        <td colspan="6" style="text-align: center; padding: 30px;">
                            У вас пока нет новостей. <a href="#" id="createFirstNews" style="color: #1a73e8;">Создайте первую новость</a>.
                        </td>
                    </tr>
                `;
            document.getElementById('createFirstNews').addEventListener('click', openCreateModal);
            return;
        }

        newsList.forEach(news => {
            const row = document.createElement('tr');
            row.innerHTML = `
                    <td>
                        <div class="news-title-cell">
                            <img src="${news.image}" alt="${news.title}" class="news-image">
                            <div class="news-title">${news.title}</div>
                        </div>
                    </td>
                    <td>${categories[news.category] || news.category}</td>
                    <td>${formatDate(news.date)}</td>
                    <td>
                        <span class="status-${news.status}">
                            ${news.status == 'published' ? 'Опубликовано' : 'Черновик'}
                        </span>
                    </td>
                    <td>${news.views}</td>
                    <td>
                        <div class="action-buttons">
                            <button class="btn-edit" data-id="${news.id}">Редактировать</button>
                            <button class="btn-delete" data-id="${news.id}">Удалить</button>
                        </div>
                    </td>
                `;
            tableBody.appendChild(row);
        });

        // Добавление обработчиков для кнопок действий
        document.querySelectorAll('.btn-edit').forEach(btn => {
            btn.addEventListener('click', function() {
                const newsId = parseInt(this.getAttribute('data-id'));
                openEditModal(newsId);
            });
        });

        document.querySelectorAll('.btn-delete').forEach(btn => {
            btn.addEventListener('click', function() {
                const newsId = parseInt(this.getAttribute('data-id'));
                deleteNews(newsId);
            });
        });
    }

    // Форматирование даты
    function formatDate(dateString) {
        const date = new Date(dateString);
        return date.toLocaleDateString('ru-RU');
    }

    // Открытие модального окна для создания новости
    function openCreateModal() {
        document.getElementById('modalTitle').textContent = 'Создать новость';
        document.getElementById('newsForm').reset();
        document.getElementById('imagePreview').style.display = 'none';
        document.getElementById('newsDate').valueAsDate = new Date();
        currentEditingNews = null;
        document.getElementById('newsModal').style.display = 'flex';
    }

    // Открытие модального окна для редактирования новости
    function openEditModal(newsId) {
        const news = userNews.find(item => item.id === newsId);
        if (!news) return;

        document.getElementById('modalTitle').textContent = 'Редактировать новость';
        document.getElementById('newsTitle').value = news.title;
        document.getElementById('newsCategory').value = news.category;
        document.getElementById('newsExcerpt').value = news.excerpt;
        document.getElementById('newsContent').value = news.content;
        document.getElementById('newsStatus').value = news.status;
        document.getElementById('newsDate').value = news.date;

        if (news.image) {
            document.getElementById('imagePreview').src = news.image;
            document.getElementById('imagePreview').style.display = 'block';
        } else {
            document.getElementById('imagePreview').style.display = 'none';
        }

        currentEditingNews = news;
        document.getElementById('newsModal').style.display = 'flex';
    }

    // Закрытие модального окна
    function closeModal() {
        document.getElementById('newsModal').style.display = 'none';
    }

    // Обработка загрузки изображения
    function handleImageUpload(e) {
        const file = e.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function(event) {
                document.getElementById('imagePreview').src = event.target.result;
                document.getElementById('imagePreview').style.display = 'block';
            };
            reader.readAsDataURL(file);
        }
    }

    // Сохранение новости
    function saveNews() {
        const title = document.getElementById('newsTitle').value;
        const category = document.getElementById('newsCategory').value;
        const excerpt = document.getElementById('newsExcerpt').value;
        const content = document.getElementById('newsContent').value;
        const status = document.getElementById('newsStatus').value;
        const date = document.getElementById('newsDate').value;
        const image = document.getElementById('imagePreview').src;

        if (!title || !category || !excerpt || !content) {
            alert('Пожалуйста, заполните все обязательные поля');
            return;
        }

        if (currentEditingNews) {
            // Редактирование существующей новости
            currentEditingNews.title = title;
            currentEditingNews.category = category;
            currentEditingNews.excerpt = excerpt;
            currentEditingNews.content = content;
            currentEditingNews.status = status;
            currentEditingNews.date = date;
            if (image && image.startsWith('data:')) {
                currentEditingNews.image = image;
            }
        } else {
            // Создание новой новости
            const newNews = {
                id: Date.now(),
                title,
                category,
                excerpt,
                content,
                status,
                date,
                views: 0,
                image: image.startsWith('data:') ? image : 'https://via.placeholder.com/600x400?text=Новость'
            };
            userNews.unshift(newNews);
        }

        // Сохранение в localStorage
        localStorage.setItem('userNews', JSON.stringify(userNews));

        // Обновление интерфейса
        updateStats();
        renderNewsTable();
        closeModal();

        alert(currentEditingNews ? 'Новость успешно обновлена' : 'Новость успешно создана');
    }

    // Удаление новости
    function deleteNews(newsId) {
        if (confirm('Вы уверены, что хотите удалить эту новость?')) {
            userNews = userNews.filter(news => news.id !== newsId);
            localStorage.setItem('userNews', JSON.stringify(userNews));
            updateStats();
            renderNewsTable();
            alert('Новость успешно удалена');
        }
    }

    // Фильтрация новостей
    function filterNews() {
        const statusFilter = document.getElementById('statusFilter').value;
        const searchText = document.querySelector('.search-box').value.toLowerCase();

        let filteredNews = userNews;

        if (statusFilter !== 'all') {
            filteredNews = filteredNews.filter(news => news.status === statusFilter);
        }

        if (searchText) {
            filteredNews = filteredNews.filter(news =>
                news.title.toLowerCase().includes(searchText) ||
                news.excerpt.toLowerCase().includes(searchText)
            );
        }

        renderNewsTable(filteredNews);
    }

    // Выход из системы
    function logout() {
        if (confirm('Вы уверены, что хотите выйти?')) {
            localStorage.removeItem('currentUser');
            // В реальном приложении здесь была бы переадресация на страницу входа
            alert('Вы вышли из системы');
        }
    }
</script>
</body>
</html>