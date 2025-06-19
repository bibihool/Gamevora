<?php
require_once 'db.php';

try {
    // Get all blog posts
    $stmt = $pdo->query("SELECT * FROM blog_posts ORDER BY created_at DESC");
    $posts = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo "Total blog posts found: " . count($posts) . "\n\n";

    // Display each post
    foreach ($posts as $post) {
        echo "Title: " . $post['title'] . "\n";
        echo "Slug: " . $post['slug'] . "\n";
        echo "Category: " . $post['category'] . "\n";
        echo "Status: " . $post['status'] . "\n";
        echo "Created at: " . $post['created_at'] . "\n";
        echo "----------------------------------------\n";
    }

} catch (PDOException $e) {
    echo "Error: " . $e->getMessage() . "\n";
} 