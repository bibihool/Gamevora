# Gamevora: Affiliate Marketing Web Design and Development System

## Introduction
Gamevora is a modern affiliate marketing website focused on gaming gear reviews, guides, and product recommendations. The system is designed to help users make informed purchasing decisions while generating affiliate revenue. Built with HTML, CSS, JavaScript, and PHP, Gamevora is easy to deploy on free hosting platforms like InfinityFree.

## Features
- Dynamic blog system for reviews, guides, and news
- Product listings with images, specs, ratings, and affiliate links
- Category and brand filtering
- Responsive, mobile-friendly design
- Affiliate link integration and disclosure
- Easy product/blog import via JSON or PHP scripts
- MySQL database support (sample schema included)

## Project Structure
```
├──htdocs/
   ├── images/
         ├── images files
   ├── about.html
   ├── blog.html
   ├── blog_top5_gaming_mice_2024.html
   ├── blog_ultimate_mechanical_keyboard_guide.html
   ├── contact.html
   ├── db.php
   ├── get_products.php
   ├── get_blog_posts.php
   ├── import_keyboard.php
   ├── import_product.php
   ├── insert_blog_posts.php
   ├── keyboards.json
   ├── headsets.json
   ├── products.html
   ├── style.css
   ├── main.js
   ├── gamevora.sql
└── ...
```

## Getting Started
### Prerequisites
- PHP 7.x or higher
- MySQL database
- [XAMPP](https://www.apachefriends.org/) or another local web server

### Setup Instructions (Localhost/XAMPP)
1. **Download and install XAMPP:**
   - [XAMPP Download](https://www.apachefriends.org/index.html)
2. **Clone or copy the repository:**
   - Place all project files and folders into the `htdocs/` directory of your XAMPP installation (e.g., `C:/xampp/htdocs/gamevora/`).
3. **Start Apache and MySQL** from the XAMPP Control Panel.
4. **Import the database:**
   - Open [phpMyAdmin](http://localhost/phpmyadmin/) in your browser.
   - Create a new database (e.g., `gamevora`).
   - Import the `gamevora.sql` file into this database.
5. **Configure database connection:**
   - Edit `db.php` with your local database credentials:
     ```php
     $host = 'localhost';
     $dbname = 'gamevora'; // or your chosen database name
     $username = 'root';
     $password = '';
     ```
6. **(Optional) Run import scripts:**
   - In your browser, visit `http://localhost/gamevora/import_keyboard.php`, `import_product.php`, or `insert_blog_posts.php` if you need to import sample data.
7. **Access your site:**
   - Visit [http://localhost/gamevora/index.html](http://localhost/gamevora/index.html) or other pages in your browser to view the website.

## License
This project is for educational and demonstration purposes.

## Credits
- Gamevora Team
- [Icon-icons](https://icon-icons.com/) for icons
- [InfinityFree](https://infinityfree.net/) for free hosting

---
Feel free to customize this README for your own use! 
