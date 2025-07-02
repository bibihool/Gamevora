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
            'created_at' => '2025-06-17 02:12:25',
            'updated_at' => '2025-06-24 21:16:12',
        ],
        [
            'title' => 'Top 5 Mechanical Keyboards in 2024',
            'slug' => 'ultimate-mechanical-keyboard-guide',
            'content' => 'Comprehensive guide to mechanical keyboards, switches, and features for gamers and typists.',
            'excerpt' => 'Everything you need to know about mechanical keyboards for gaming.',
            'featured_image' => 'images/blog/mechanical-keyboard-guide.jpg',
            'author' => 'Jane Smith',
            'category' => 'Gaming Gear',
            'tags' => 'mechanical-keyboards, gaming, guides',
            'status' => 'published',
            'created_at' => '2025-06-17 02:12:25',
            'updated_at' => '2025-06-24 00:55:45',
        ],
        [
            'title' => 'The Ultimate Guide to Gaming Headsets',
            'slug' => 'ultimate-gaming-headset-guide',
            'content' => 'The ultimate guide to choosing the best gaming headset. Learn about sound quality, comfort, microphones, durability, and connectivity for gamers.',
            'excerpt' => 'The ultimate guide to choosing the best gaming headset. Learn about sound quality, comfort, microphones, durability, and connectivity for gamers.',
            'featured_image' => 'images/headsets.jpg',
            'author' => 'Gamevora Team',
            'category' => 'Gaming Gear',
            'tags' => 'gaming headsets, headset guide, audio, comfort, microphone',
            'status' => 'published',
            'created_at' => '2025-07-01 04:11:12',
            'updated_at' => '2025-07-01 01:21:17',
        ],
        [
            'title' => 'The Ultimate Guide to Monitors',
            'slug' => 'ultimate-monitor-guide',
            'content' => 'The ultimate guide to choosing the best monitor. Learn about resolution, refresh rate, response time, panel types, and connectivity options.',
            'excerpt' => 'The ultimate guide to choosing the best monitor. Learn about resolution, refresh rate, response time, panel types, and connectivity options.',
            'featured_image' => 'images/monitors.jpg',
            'author' => 'Gamevora Team',
            'category' => 'Gaming Gear',
            'tags' => 'gaming monitors, monitor guide, resolution, refresh rate, panel type',
            'status' => 'published',
            'created_at' => '2025-07-02 00:22:42',
            'updated_at' => '2025-07-01 21:22:42',
        ],
    ];

    $stmt = $pdo->prepare("INSERT INTO blog_posts (title, slug, content, excerpt, featured_image, author, category, tags, status, created_at, updated_at) 
                          VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
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
            $post['created_at'],
            $post['updated_at']
        ]);
    }

    echo "Blog posts updated successfully!";
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
} 