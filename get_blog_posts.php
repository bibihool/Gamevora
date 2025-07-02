<?php
header('Content-Type: application/json');
require_once 'db.php';

try {
    // Get parameters
    $limit = isset($_GET['limit']) ? (int)$_GET['limit'] : 10;
    $offset = isset($_GET['offset']) ? (int)$_GET['offset'] : 0;
    $category = isset($_GET['category']) ? $_GET['category'] : null;
    $search = isset($_GET['search']) ? $_GET['search'] : null;

    // Base query
    $query = "SELECT * FROM blog_posts WHERE status = 'published'";
    $params = [];

    // Add category filter if provided
    if ($category) {
        $query .= " AND category = :category";
        $params[':category'] = $category;
    }

    // Add search filter if provided
    if ($search) {
        $query .= " AND (title LIKE :search OR content LIKE :search OR tags LIKE :search)";
        $params[':search'] = "%$search%";
    }

    // Add ordering and pagination
    $query .= " ORDER BY created_at DESC LIMIT :limit OFFSET :offset";
    $params[':limit'] = $limit;
    $params[':offset'] = $offset;

    // Prepare and execute the query
    $stmt = $pdo->prepare($query);
    foreach ($params as $key => $value) {
        $stmt->bindValue($key, $value);
    }
    $stmt->execute();
    $posts = $stmt->fetchAll();

    // Get total count for pagination
    $countQuery = "SELECT COUNT(*) FROM blog_posts WHERE status = 'published'";
    if ($category) {
        $countQuery .= " AND category = :category";
    }
    if ($search) {
        $countQuery .= " AND (title LIKE :search OR content LIKE :search OR tags LIKE :search)";
    }
    
    $countStmt = $pdo->prepare($countQuery);
    foreach ($params as $key => $value) {
        if ($key !== ':limit' && $key !== ':offset') {
            $countStmt->bindValue($key, $value);
        }
    }
    $countStmt->execute();
    $total = $countStmt->fetchColumn();

    // Return the results
    echo json_encode([
        'status' => 'success',
        'posts' => $posts,
        'total' => $total,
        'limit' => $limit,
        'offset' => $offset
    ]);

} catch (Exception $e) {
    echo json_encode([
        'status' => 'error',
        'message' => $e->getMessage()
    ]);
}
?> 