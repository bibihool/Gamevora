<?php
require_once 'db.php';

try {
    // Insert blog posts
    $posts = [
        [
            'title' => 'Top 5 Gaming Mice in 2024: Ultimate Guide',
            'slug' => 'top-5-gaming-mice-2024',
            'content' => 'Discover the best gaming mice of 2024, featuring cutting-edge technology, precision tracking, and ergonomic designs for competitive gaming.',
            'excerpt' => 'A comprehensive guide to the top 5 gaming mice of 2024, perfect for competitive gamers and enthusiasts.',
            'featured_image' => 'images/blog/gaming-mice.jpg',
            'author' => 'Gamevora Team',
            'category' => 'Gaming Gear',
            'tags' => 'gaming mice, gaming gear, mouse reviews',
            'status' => 'published',
            'created_at' => date('Y-m-d H:i:s')
        ],
        [
            'title' => 'Best Gaming Keyboards 2024: Complete Buyer\'s Guide',
            'slug' => 'best-gaming-keyboards-2024',
            'content' => 'Explore our detailed guide to the best gaming keyboards of 2024, including mechanical, membrane, and hybrid options for every budget.',
            'excerpt' => 'Your ultimate guide to choosing the perfect gaming keyboard in 2024, from budget options to premium mechanical keyboards.',
            'featured_image' => 'images/blog/gaming-keyboards.jpg',
            'author' => 'Gamevora Team',
            'category' => 'Gaming Gear',
            'tags' => 'gaming keyboards, mechanical keyboards, keyboard guide',
            'status' => 'published',
            'created_at' => date('Y-m-d H:i:s')
        ]
    ];

    $stmt = $pdo->prepare("INSERT INTO blog_posts (title, slug, content, excerpt, featured_image, author, category, tags, status, created_at) 
                          VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
                          ON DUPLICATE KEY UPDATE 
                          title = VALUES(title),
                          content = VALUES(content),
                          excerpt = VALUES(excerpt),
                          featured_image = VALUES(featured_image),
                          author = VALUES(author),
                          category = VALUES(category),
                          tags = VALUES(tags),
                          status = VALUES(status),
                          updated_at = CURRENT_TIMESTAMP");

    foreach ($posts as $post) {
        $stmt->execute([
            $post['title'],
            $post['slug'],
            $post['content'],
            $post['excerpt'],
            $post['featured_image'],
            $post['author'],
            $post['category'],
            $post['tags'],
            $post['status'],
            $post['created_at']
        ]);
    }

    echo "Blog posts updated successfully!";
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
} 