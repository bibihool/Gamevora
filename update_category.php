<?php
require_once 'db.php';

try {
    // Update the category from 'Headsets' to 'Gaming Headsets'
    $stmt = $pdo->prepare("UPDATE products SET category = 'Gaming Headsets' WHERE category = 'Headsets'");
    $stmt->execute();
    
    echo "Category updated successfully. Affected rows: " . $stmt->rowCount();
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
} 