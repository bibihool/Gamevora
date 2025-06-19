<?php
require_once 'db.php';

try {
    // Check if products table exists
    $stmt = $pdo->query("SHOW TABLES LIKE 'products'");
    if ($stmt->rowCount() === 0) {
        echo "Products table does not exist!\n";
        exit;
    }

    // Get all products
    $stmt = $pdo->query("SELECT * FROM products");
    $products = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo "Total products found: " . count($products) . "\n\n";

    // Display each product
    foreach ($products as $product) {
        echo "Product ID: " . $product['id'] . "\n";
        echo "Name: " . $product['name'] . "\n";
        echo "Category: " . $product['category'] . "\n";
        echo "Brand: " . $product['brand'] . "\n";
        echo "Price: " . $product['price'] . "\n";
        echo "Status: " . $product['status'] . "\n";
        echo "Created at: " . $product['created_at'] . "\n";
        echo "----------------------------------------\n";
    }

} catch (PDOException $e) {
    echo "Error: " . $e->getMessage() . "\n";
} 