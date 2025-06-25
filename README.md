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
├── images/
├── gamevora.sql
└── ...
```

## Getting Started
### Prerequisites
- PHP 7.x or higher
- MySQL database
- Web server (InfinityFree, XAMPP, etc.)

### Setup Instructions
1. **Clone the repository:**
   ```
   git clone https://github.com/yourusername/gamevora.git
   ```
2. **Upload all files** to your web server's root directory (e.g., `htdocs/` on InfinityFree).
3. **Import the database:**
   - Use phpMyAdmin to import `gamevora.sql` into your MySQL database.
4. **Configure database connection:**
   - Edit `db.php` with your database credentials:
     ```php
     $host = 'your-db-host';
     $dbname = 'your-db-name';
     $username = 'your-db-username';
     $password = 'your-db-password';
     ```
5. **(Optional) Run import scripts:**
   - Visit `import_keyboard.php`, `import_product.php`, or `insert_blog_posts.php` in your browser if you need to import sample data.
6. **Access your site:**
   - Visit `index.html` or your deployed URL.

## Deployment on InfinityFree
- Sign up at [InfinityFree](https://infinityfree.net/)
- Create a new hosting account and upload your files to the `htdocs/` folder
- Import your database and update `db.php` as described above
- Your site will be live at `https://yourname.epizy.com/`

## Contribution Guidelines
1. Fork this repository
2. Create a new branch (`git checkout -b feature/your-feature`)
3. Commit your changes (`git commit -am 'Add new feature'`)
4. Push to the branch (`git push origin feature/your-feature`)
5. Open a Pull Request

## License
This project is for educational and demonstration purposes.

## Credits
- Gamevora Team
- [Font Awesome](https://fontawesome.com/) for icons
- [InfinityFree](https://infinityfree.net/) for free hosting

---
Feel free to customize this README for your own use! 