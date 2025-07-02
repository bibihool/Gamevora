<?php
require_once 'db.php';

// Read the JSON file
$jsonData = file_get_contents('keyboards.json');
$data = json_decode($jsonData, true);

if (!$data || !isset($data['products'])) {
    die("Error: Invalid JSON data format\n");
}

try {
    // Prepare the SQL statement
    $sql = "INSERT INTO products (name, category, brand, price, description, image, rating, rating_count, stock, specs, features, status) 
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    
    $stmt = $pdo->prepare($sql);

    foreach ($data['products'] as $product) {
        // Convert specs and features to JSON
        $specsJson = json_encode($product['specs']);
        $featuresJson = json_encode($product['specs']['features']);

        // Execute the statement
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
            $specsJson,
            $featuresJson,
            $product['status']
        ]);

        echo "Successfully imported: " . $product['name'] . "\n";
    }

    echo "All keyboards imported successfully!\n";

} catch (PDOException $e) {
    die("Error importing keyboards: " . $e->getMessage() . "\n");
} 