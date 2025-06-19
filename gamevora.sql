-- Create database
CREATE DATABASE IF NOT EXISTS gamevora;
USE gamevora;

-- Create products table
CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    category VARCHAR(50) NOT NULL,
    brand VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    description TEXT,
    image VARCHAR(255),
    rating DECIMAL(2,1) DEFAULT 0,
    rating_count INT DEFAULT 0,
    stock INT DEFAULT 0,
    specs JSON,
    features TEXT,
    status ENUM('active', 'inactive') DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Create categories table
CREATE TABLE IF NOT EXISTS categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    slug VARCHAR(100) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY unique_category (slug)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Create blog_posts table
CREATE TABLE IF NOT EXISTS blog_posts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    slug VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    excerpt TEXT,
    featured_image VARCHAR(255),
    author VARCHAR(100) NOT NULL,
    category VARCHAR(100) NOT NULL,
    tags VARCHAR(255),
    status ENUM('draft', 'published') DEFAULT 'published',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY unique_slug (slug)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insert default categories
INSERT INTO categories (name, slug, description) VALUES
('Headsets', 'headsets', 'Professional gaming headsets with premium audio quality'),
('Keyboards', 'keyboards', 'Mechanical and membrane gaming keyboards'),
('Mice', 'mice', 'High-performance gaming mice for competitive gaming'),
('Monitors', 'monitors', 'High refresh rate gaming displays'),
('CPU', 'cpu', 'High-performance processors for gaming'),
('GPU', 'gpu', 'Graphics cards for gaming and content creation'),
('Storage', 'storage', 'SSDs and HDDs for gaming storage'),
('RAM', 'ram', 'High-speed memory for gaming systems');

-- Insert sample blog posts
INSERT INTO blog_posts (title, slug, content, excerpt, featured_image, author, category, tags) VALUES
('Top 5 Gaming Mice for Competitive Gaming in 2024', 'top-5-gaming-mice-2024', 
'Detailed review of the best gaming mice for competitive gaming...', 
'Discover the best gaming mice that will give you the competitive edge in 2024.',
'images/blog/gaming-mice-2024.jpg',
'John Doe',
'Gaming Gear',
'gaming-mice, competitive-gaming, reviews'),
('The Ultimate Guide to Mechanical Keyboards', 'ultimate-mechanical-keyboard-guide',
'Comprehensive guide to mechanical keyboards...',
'Everything you need to know about mechanical keyboards for gaming.',
'images/blog/mechanical-keyboard-guide.jpg',
'Jane Smith',
'Gaming Gear',
'mechanical-keyboards, gaming, guides');