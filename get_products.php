<?php
header('Content-Type: application/json');
require_once 'db.php';

try {
    // Get filter parameters
    $category = isset($_GET['category']) ? $_GET['category'] : '';
    $brand = isset($_GET['brand']) ? $_GET['brand'] : '';
    $price = isset($_GET['price']) ? $_GET['price'] : '';
    $sort = isset($_GET['sort']) ? $_GET['sort'] : 'newest';
    $page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
    $limit = isset($_GET['limit']) ? (int)$_GET['limit'] : 12;
    $perPage = $limit;

    // Debug information
    error_log("Category: " . $category);
    error_log("Brand: " . $brand);
    error_log("Price: " . $price);
    error_log("Sort: " . $sort);
    error_log("Page: " . $page);
    error_log("Limit: " . $limit);

    // Build the base query
    $sql = "SELECT * FROM products WHERE status = 'active'";
    $params = [];

    // Add category filter
    if (!empty($category)) {
        // Handle both old and new category names
        if ($category === 'Gaming Headsets') {
            $sql .= " AND (category = ? OR category = 'Headsets')";
            $params[] = $category;
        } else {
            $sql .= " AND category = ?";
            $params[] = $category;
        }
    }

    // Add brand filter
    if (!empty($brand)) {
        $sql .= " AND brand = ?";
        $params[] = $brand;
    }

    // Add price range filter
    if (!empty($price)) {
        switch ($price) {
            case '0-50':
                $sql .= " AND price <= 50";
                break;
            case '50-100':
                $sql .= " AND price > 50 AND price <= 100";
                break;
            case '100-200':
                $sql .= " AND price > 100 AND price <= 200";
                break;
            case '200+':
                $sql .= " AND price > 200";
                break;
        }
    }

    // Add sorting
    switch ($sort) {
        case 'price-low':
            $sql .= " ORDER BY price ASC";
            break;
        case 'price-high':
            $sql .= " ORDER BY price DESC";
            break;
        case 'rating':
            $sql .= " ORDER BY rating DESC";
            break;
        default: // newest
            $sql .= " ORDER BY created_at DESC";
    }

    // Add pagination
    $offset = ($page - 1) * $perPage;
    $sql .= " LIMIT ? OFFSET ?";
    $params[] = $perPage;
    $params[] = $offset;

    // Debug the final SQL query
    error_log("SQL Query: " . $sql);
    error_log("Parameters: " . json_encode($params));

    // Get total count for pagination
    $countSql = "SELECT COUNT(*) as total FROM products WHERE status = 'active'";
    if (!empty($category)) {
        if ($category === 'Gaming Headsets') {
            $countSql .= " AND (category = ? OR category = 'Headsets')";
        } else {
            $countSql .= " AND category = ?";
        }
    }
    if (!empty($brand)) {
        $countSql .= " AND brand = ?";
    }
    if (!empty($price)) {
        switch ($price) {
            case '0-50':
                $countSql .= " AND price <= 50";
                break;
            case '50-100':
                $countSql .= " AND price > 50 AND price <= 100";
                break;
            case '100-200':
                $countSql .= " AND price > 100 AND price <= 200";
                break;
            case '200+':
                $countSql .= " AND price > 200";
                break;
        }
    }

    // Execute count query
    $countStmt = $pdo->prepare($countSql);
    $countStmt->execute(array_slice($params, 0, -2)); // Remove LIMIT params
    $total = $countStmt->fetch()['total'];
    $totalPages = ceil($total / $perPage);

    // Execute main query
    $stmt = $pdo->prepare($sql);
    $stmt->execute($params);
    $products = $stmt->fetchAll();

    // Debug the results
    error_log("Total products found: " . $total);
    error_log("Products returned: " . count($products));

    // Return products as JSON
    echo json_encode([
        'status' => 'success',
        'products' => $products,
        'total_pages' => $totalPages,
        'current_page' => $page,
        'total_products' => $total,
        'debug' => [
            'sql' => $sql,
            'params' => $params,
            'category' => $category
        ]
    ]);

} catch (Exception $e) {
    error_log("Error in get_products.php: " . $e->getMessage());
    echo json_encode([
        'status' => 'error',
        'message' => $e->getMessage()
    ]);
}
?>