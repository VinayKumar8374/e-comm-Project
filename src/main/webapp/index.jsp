<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1" />
<title>NexusShop — Modern UI</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Poppins:wght@600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
:root{
--primary:#0f172a;
--accent:#6366f1;
--accent-light:#818cf8;
--bg:#f8fafc;
--card:#ffffff;
--muted:#6b7280;
--radius:14px;
}

*{box-sizing:border-box;transition:all .2s ease;}
body{
margin:0;
font-family:Inter;
background:var(--bg);
color:var(--primary);
font-size:15px;
}
html{scroll-behavior:smooth;}

.container{max-width:1200px;margin:auto;padding:0 20px;}

header{
position:sticky;top:0;background:white;
box-shadow:0 4px 20px rgba(0,0,0,0.05);
z-index:100;
}

.header-inner{
display:flex;justify-content:space-between;align-items:center;
padding:14px 0;
}

.brand{font-family:Poppins;font-weight:700;font-size:20px;}
.accent{color:var(--accent);}

.search{
background:#eef2ff;padding:8px 12px;border-radius:999px;
display:flex;gap:8px;align-items:center;
}
.search input{border:none;background:none;outline:none;}

.icon-btn{border:none;background:none;cursor:pointer;}

.cart{position:relative;}
.cart-count{
position:absolute;top:-6px;right:-6px;
background:var(--accent);color:white;
width:20px;height:20px;border-radius:50%;
display:grid;place-items:center;font-size:11px;
}

.hero{
text-align:center;
padding:80px 20px;
color:white;
background:linear-gradient(rgba(0,0,0,.6),rgba(0,0,0,.6)),
url('https://images.unsplash.com/photo-1555529669-e69e7aa0ba9a?auto=format&fit=crop&w=1400&q=80') center/cover;
}

.hero h1{font-size:38px;font-family:Poppins;}

.btn{
padding:10px 18px;border:none;border-radius:999px;
cursor:pointer;font-weight:600;
}

.btn-primary{
background:linear-gradient(135deg,var(--accent),var(--accent-light));
color:white;
box-shadow:0 8px 20px rgba(99,102,241,0.3);
}
.btn-primary:hover{transform:translateY(-2px);}

.section{padding:50px 0;}
.grid{display:grid;gap:20px;}

.categories{grid-template-columns:repeat(auto-fit,minmax(150px,1fr));}
.products{grid-template-columns:repeat(auto-fit,minmax(250px,1fr));}

.cat-card,.product{
background:white;border-radius:var(--radius);
box-shadow:0 8px 20px rgba(0,0,0,0.05);
}

.cat-card{
padding:20px;text-align:center;cursor:pointer;
}
.cat-card:hover{transform:translateY(-5px);}

.product{
overflow:hidden;display:flex;flex-direction:column;
position:relative;
}
.product:hover{
transform:translateY(-8px);
box-shadow:0 20px 40px rgba(0,0,0,0.08);
}

.product img{height:200px;width:100%;object-fit:cover;}

.product-body{padding:12px;}
.price{font-weight:700;}
.old-price{text-decoration:line-through;color:gray;font-size:13px;}

.product-footer{
display:flex;gap:10px;padding:12px;
}

.add-btn{
flex:1;background:var(--primary);
color:white;border:none;padding:10px;border-radius:8px;
cursor:pointer;
}
.wish-btn{
border:1px solid #ddd;background:none;padding:8px;border-radius:8px;
cursor:pointer;
}
.wish-btn.active{color:red;}

footer{text-align:center;padding:30px;color:var(--muted);}

/* Toast */
#toast{
position:fixed;bottom:20px;right:20px;
background:#111;color:white;
padding:12px 18px;border-radius:8px;
display:none;
}

/* Mobile */
@media(max-width:768px){
.products{grid-template-columns:1fr;}
}
</style>
</head>

<body>

<header>
<div class="container header-inner">
<div class="brand">Nexus<span class="accent">Shop</span></div>

<div class="search">
<input id="searchInput" placeholder="Search products...">
<button class="icon-btn"><i class="fas fa-search"></i></button>
</div>

<div>
<button class="icon-btn"><i class="far fa-user"></i></button>
<button class="icon-btn"><i class="far fa-heart"></i></button>
<span class="cart">
<i class="fas fa-shopping-cart"></i>
<span id="cartCount" class="cart-count">0</span>
</span>
</div>
</div>
</header>

<section class="hero">
<h1>Premium Shopping Experience</h1>
<p>Modern UI + Smooth UX</p>
<button class="btn btn-primary">Shop Now</button>
</section>

<section class="section container">
<h2>Categories</h2>
<div class="grid categories" id="categoriesGrid"></div>
</section>

<section class="section container">
<h2>Products</h2>
<div class="grid products" id="productsGrid"></div>
</section>

<footer>© 2026 NexusShop</footer>

<div id="toast">Added to cart</div>

<script>
const PRODUCTS=[
{id:1,title:'iPhone 14',price:999,img:'https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb'},
{id:2,title:'MacBook Pro',price:1999,img:'https://images.unsplash.com/photo-1593642632823-8f785ba67e45'},
{id:3,title:'Headphones',price:299,img:'https://images.unsplash.com/photo-1600185365483-26d7a4cc7519'}
];

let cart=0;

function renderProducts(list){
const grid=document.getElementById('productsGrid');
grid.innerHTML='';
list.forEach(p=>{
const el=document.createElement('div');
el.className='product';
el.innerHTML=`
<img src="${p.img}">
<div class="product-body">
<h4>${p.title}</h4>
<div class="price">$${p.price}</div>
</div>
<div class="product-footer">
<button class="add-btn" onclick="addToCart()">Add</button>
<button class="wish-btn" onclick="toggleWish(this)"><i class="far fa-heart"></i></button>
</div>`;
grid.appendChild(el);
});
}

function addToCart(){
cart++;
document.getElementById('cartCount').textContent=cart;
showToast("Added to cart 🛒");
}

function toggleWish(btn){
btn.classList.toggle('active');
btn.innerHTML=btn.classList.contains('active')?
'<i class="fas fa-heart"></i>':'<i class="far fa-heart"></i>';
}

function showToast(msg){
const t=document.getElementById('toast');
t.innerText=msg;
t.style.display='block';
setTimeout(()=>t.style.display='none',2000);
}

document.getElementById('searchInput').addEventListener('input',e=>{
const q=e.target.value.toLowerCase();
renderProducts(PRODUCTS.filter(p=>p.title.toLowerCase().includes(q)));
});

renderProducts(PRODUCTS);
</script>

</body>
</html>
