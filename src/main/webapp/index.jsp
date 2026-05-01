<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>NexusShop — Premium E‑Commerce</title>

    <!-- Fonts & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        :root {
            --bg: #ffffff;
            --primary: #0f172a;
            --accent: #3b82f6;
            --accent-hover: #2563eb;
            --muted: #64748b;
            --card: #ffffff;
            --surface: #f8fafc;
            --success: #10b981;
            --border: #e2e8f0;
            --radius-lg: 16px;
            --radius-md: 12px;
            --container: 1280px;
            --shadow: 0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1);
        }

        * { box-sizing: border-box; transition: all 0.2s ease-in-out; }

        body {
            margin: 0;
            font-family: 'Plus Jakarta Sans', sans-serif;
            color: var(--primary);
            background: var(--bg);
            line-height: 1.6;
        }

        .container {
            width: 100%;
            max-width: var(--container);
            margin: 0 auto;
            padding: 0 24px;
        }

        /* Header */
        header {
            position: sticky;
            top: 0;
            z-index: 100;
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(12px);
            border-bottom: 1px solid var(--border);
        }

        .header-inner {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 16px 0;
        }

        .brand {
            font-weight: 800;
            font-size: 24px;
            letter-spacing: -1px;
            text-decoration: none;
            color: var(--primary);
        }

        .brand span { color: var(--accent); }

        /* Navigation */
        .main-nav ul {
            display: flex;
            gap: 12px;
            list-style: none;
            margin: 0;
            padding: 0;
        }

        .main-nav a {
            padding: 8px 16px;
            border-radius: var(--radius-md);
            text-decoration: none;
            font-weight: 600;
            font-size: 14px;
            color: var(--muted);
        }

        .main-nav a:hover {
            color: var(--accent);
            background: var(--surface);
        }

        /* Search Bar */
        .search-container {
            background: var(--surface);
            border: 1px solid var(--border);
            padding: 6px 16px;
            border-radius: 99px;
            display: flex;
            align-items: center;
            width: 300px;
        }

        .search-container input {
            border: none;
            background: transparent;
            outline: none;
            padding: 6px;
            width: 100%;
            font-size: 14px;
        }

        /* Hero Section */
        .hero {
            padding: 100px 0;
            background: radial-gradient(circle at top right, #eff6ff, #ffffff);
            text-align: center;
        }

        .hero h1 {
            font-size: clamp(2.5rem, 5vw, 4rem);
            font-weight: 800;
            line-height: 1.1;
            margin-bottom: 24px;
            letter-spacing: -2px;
        }

        .hero p {
            color: var(--muted);
            font-size: 18px;
            max-width: 600px;
            margin: 0 auto 32px;
        }

        /* Buttons */
        .btn {
            padding: 12px 28px;
            border-radius: 99px;
            font-weight: 700;
            cursor: pointer;
            border: none;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            text-decoration: none;
        }

        .btn-primary {
            background: var(--primary);
            color: white;
        }

        .btn-primary:hover {
            background: var(--accent);
            transform: translateY(-2px);
            box-shadow: 0 10px 15px -3px rgba(59, 130, 246, 0.3);
        }

        /* Cards */
        .grid {
            display: grid;
            gap: 24px;
            margin-top: 40px;
        }

        .cat-card {
            background: var(--surface);
            padding: 32px;
            border-radius: var(--radius-lg);
            text-align: center;
            cursor: pointer;
            border: 1px solid transparent;
        }

        .cat-card:hover {
            border-color: var(--accent);
            background: white;
            box-shadow: var(--shadow);
            transform: translateY(-5px);
        }

        .product-card {
            background: white;
            border-radius: var(--radius-lg);
            border: 1px solid var(--border);
            overflow: hidden;
            position: relative;
        }

        .product-card:hover {
            box-shadow: 0 20px 25px -5px rgb(0 0 0 / 0.1);
        }

        .product-img {
            width: 100%;
            height: 250px;
            object-fit: cover;
        }

        .product-content {
            padding: 20px;
        }

        .price-tag {
            font-size: 20px;
            font-weight: 800;
            color: var(--primary);
        }

        /* Flash Sale */
        .flash-sale {
            background: var(--primary);
            color: white;
            border-radius: 24px;
            padding: 48px;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 40px;
            align-items: center;
            margin: 60px 0;
        }

        .timer-box {
            background: rgba(255,255,255,0.1);
            padding: 15px;
            border-radius: 12px;
            min-width: 80px;
            text-align: center;
        }

        /* Badge */
        .badge {
            position: absolute;
            top: 15px;
            left: 15px;
            background: var(--accent);
            color: white;
            padding: 4px 12px;
            border-radius: 99px;
            font-size: 12px;
            font-weight: 700;
        }

        @media (max-width: 900px) {
            .flash-sale { grid-template-columns: 1fr; }
            .search-container { display: none; }
            .grid.products { grid-template-columns: repeat(2, 1fr); }
        }

        @media (max-width: 600px) {
            .grid.products { grid-template-columns: 1fr; }
        }
    </style>
</head>

<body>
    <header>
        <div class="container header-inner">
            <a class="brand" href="#">Nexus<span>Shop</span></a>
            
            <nav class="main-nav">
                <ul>
                    <li><a href="#">Home</a></li>
                    <li><a href="#categories">Shop</a></li>
                    <li><a href="#deals">Deals</a></li>
                </ul>
            </nav>

            <div class="search-container">
                <i class="fas fa-search" style="color: var(--muted)"></i>
                <input type="text" id="searchInput" placeholder="Search brands...">
            </div>

            <div style="display:flex; gap:15px; align-items:center;">
                <button class="btn" style="padding:10px; background:transparent;"><i class="far fa-user"></i></button>
                <div style="position:relative;">
                    <button class="btn" id="cartBtn" style="padding:10px; background:var(--surface);">
                        <i class="fas fa-shopping-bag"></i>
                        <span id="cartCount" style="position:absolute; top:-5px; right:-5px; background:var(--accent); color:white; width:20px; height:20px; border-radius:50%; font-size:11px; display:grid; place-items:center;">0</span>
                    </button>
                </div>
            </div>
        </div>
    </header>

    <main>
        <section class="hero">
            <div class="container">
                <h1>Tech & Style <br> Perfectly Curated.</h1>
                <p>Experience the next generation of shopping with NexusShop. Free shipping on all orders over $100.</p>
                <div style="display:flex; gap:15px; justify-content:center;">
                    <button class="btn btn-primary" id="shopNow">Start Shopping <i class="fas fa-chevron-right"></i></button>
                    <button class="btn" style="border:1px solid var(--border)">View Lookbook</button>
                </div>
            </div>
        </section>

        <section id="categories" class="container" style="padding:80px 0;">
            <div style="text-align:center;">
                <h2 style="font-size:32px; font-weight:800;">Browse Categories</h2>
                <p style="color:var(--muted)">Top quality picks across all sectors</p>
            </div>
            <div class="grid" style="grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));" id="categoriesGrid"></div>
        </section>

        <section class="container" id="deals">
            <div class="flash-sale">
                <div>
                    <span style="color:var(--accent); font-weight:700; text-transform:uppercase; letter-spacing:2px;">Limited Offer</span>
                    <h2 style="font-size:42px; margin:10px 0;">MacBook Air M3</h2>
                    <p style="opacity:0.8; margin-bottom:30px;">The world's most popular laptop is even better with the power of M3. Grab yours before time runs out.</p>
                    
                    <div style="display:flex; gap:15px; margin-bottom:30px;">
                        <div class="timer-box"><div id="dealHours" style="font-size:24px; font-weight:800;">00</div><small>Hrs</small></div>
                        <div class="timer-box"><div id="dealMinutes" style="font-size:24px; font-weight:800;">00</div><small>Min</small></div>
                        <div class="timer-box"><div id="dealSeconds" style="font-size:24px; font-weight:800;">00</div><small>Sec</small></div>
                    </div>

                    <button class="btn" style="background:var(--accent); color:white; padding:15px 40px;">Claim Discount — $899</button>
                </div>
                <img src="https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=800" style="width:100%; border-radius:12px;" alt="MacBook">
            </div>
        </section>

        <section class="container" style="padding-bottom:100px;">
            <div style="display:flex; justify-content:space-between; align-items:flex-end; margin-bottom:40px;">
                <div>
                    <h2 style="font-size:32px; font-weight:800;">New Arrivals</h2>
                    <p style="color:var(--muted)">The latest drops from our favorite brands</p>
                </div>
            </div>
            <div class="grid products" style="grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));" id="productsGrid"></div>
        </section>
    </main>

    <footer style="background:var(--surface); padding:80px 0 40px; border-top:1px solid var(--border);">
        <div class="container" style="display:grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap:40px;">
            <div>
                <a class="brand" href="#">Nexus<span>Shop</span></a>
                <p style="color:var(--muted); margin-top:20px;">Premium quality goods delivered to your doorstep since 2024.</p>
            </div>
            <div>
                <h4>Resources</h4>
                <ul style="list-style:none; padding:0; color:var(--muted); line-height:2.5;">
                    <li>Shipping Info</li>
                    <li>Returns Policy</li>
                    <li>Gift Cards</li>
                </ul>
            </div>
            <div>
                <h4>Join Our Newsletter</h4>
                <div style="display:flex; margin-top:20px;">
                    <input type="email" placeholder="Email" style="padding:12px; border-radius:12px 0 0 12px; border:1px solid var(--border); outline:none; flex:1;">
                    <button class="btn btn-primary" style="border-radius:0 12px 12px 0;">Join</button>
                </div>
            </div>
        </div>
        <div class="container" style="margin-top:60px; text-align:center; color:var(--muted); font-size:14px; border-top:1px solid var(--border); padding-top:20px;">
            &copy; <span id="year"></span> NexusShop. All rights reserved.
        </div>
    </footer>

    <script>
        const CATEGORIES = [
            { id: 'phones', name: 'Smartphones', icon: 'fa-mobile-screen-button' },
            { id: 'laptops', name: 'Laptops', icon: 'fa-laptop' },
            { id: 'audio', name: 'Audio', icon: 'fa-headphones-simple' },
            { id: 'wearables', name: 'Wearables', icon: 'fa-clock' }
        ];

        const PRODUCTS = [
            { id: 1, title: 'iPhone 15 Pro', price: 999, badge: 'Hot', img: 'https://images.unsplash.com/photo-1696446701796-da61225697cc?auto=format&fit=crop&w=600', category: 'phones' },
            { id: 2, title: 'Sony XM5 Headphones', price: 349, badge: '-15%', img: 'https://images.unsplash.com/photo-1613040809024-b4ef7ba99bc3?auto=format&fit=crop&w=600', category: 'audio' },
            { id: 3, title: 'MacBook Pro 14', price: 1999, img: 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=600', category: 'laptops' },
            { id: 4, title: 'Pixel Watch 2', price: 299, badge: 'New', img: 'https://images.unsplash.com/photo-1508685096489-7aac291ba597?auto=format&fit=crop&w=600', category: 'wearables' }
        ];

        let cartCount = 0;

        function init() {
            const catGrid = document.getElementById('categoriesGrid');
            const prodGrid = document.getElementById('productsGrid');

            // Render Categories
            CATEGORIES.forEach(cat => {
                const div = document.createElement('div');
                div.className = 'cat-card';
                div.innerHTML = `<i class="fas ${cat.icon}" style="font-size:32px; color:var(--accent); margin-bottom:15px;"></i><h3>${cat.name}</h3>`;
                catGrid.appendChild(div);
            });

            // Render Products
            PRODUCTS.forEach(p => {
                const article = document.createElement('article');
                article.className = 'product-card';
                article.innerHTML = `
                    ${p.badge ? `<span class="badge">${p.badge}</span>` : ''}
                    <img src="${p.img}" class="product-img" alt="${p.title}">
                    <div class="product-content">
                        <small style="color:var(--muted); text-transform:uppercase;">${p.category}</small>
                        <h3 style="margin:5px 0 15px; font-size:18px;">${p.title}</h3>
                        <div style="display:flex; justify-content:space-between; align-items:center;">
                            <span class="price-tag">$${p.price}</span>
                            <button class="btn btn-primary add-to-cart" data-id="${p.id}" style="padding:8px 16px; font-size:13px;">Add to Bag</button>
                        </div>
                    </div>
                `;
                prodGrid.appendChild(article);
            });

            // Add to Cart Logic
            document.querySelectorAll('.add-to-cart').forEach(btn => {
                btn.addEventListener('click', function() {
                    cartCount++;
                    document.getElementById('cartCount').textContent = cartCount;
                    this.innerHTML = '<i class="fas fa-check"></i>';
                    this.style.background = 'var(--success)';
                    setTimeout(() => {
                        this.innerHTML = 'Add to Bag';
                        this.style.background = 'var(--primary)';
                    }, 1500);
                });
            });

            // Countdown
            setInterval(() => {
                const now = new Date();
                document.getElementById('dealHours').innerText = 24 - now.getHours();
                document.getElementById('dealMinutes').innerText = 60 - now.getMinutes();
                document.getElementById('dealSeconds').innerText = 60 - now.getSeconds();
            }, 1000);

            document.getElementById('year').textContent = new Date().getFullYear();
        }

        document.getElementById('shopNow').addEventListener('click', () => {
            window.scrollTo({ top: document.getElementById('categories').offsetTop - 100, behavior: 'smooth' });
        });

        init();
    </script>
</body>
</html>
