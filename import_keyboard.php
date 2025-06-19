<?php
require_once 'db.php';

$json = file_get_contents('keyboards.json');
$products = json_decode($json, true);

foreach ($products as $product) {
    $stmt = $pdo->prepare("INSERT INTO products (name, category, brand, price, description, image, rating, rating_count, stock, specs, status, created_at, updated_at)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW(), NOW())
        ON DUPLICATE KEY UPDATE
            category = VALUES(category),
            brand = VALUES(brand),
            price = VALUES(price),
            description = VALUES(description),
            image = VALUES(image),
            rating = VALUES(rating),
            rating_count = VALUES(rating_count),
            stock = VALUES(stock),
            specs = VALUES(specs),
            status = VALUES(status),
            updated_at = NOW()");
    $stmt->execute([
        $product['name'],
        $product['category'],
        $product['brand'],
        $product['price'],
        $product['description'],
        $product['image'],
        $product['rating'],
        $product['rating_count'],
        $product['stock'],
        json_encode($product['specs']),
        $product['status']
    ]);
}

echo "Keyboard product imported/updated successfully!\n"; 