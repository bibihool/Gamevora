// DOM Elements
const featuredProductsGrid = document.getElementById('featured-products-grid');
const searchInput = document.querySelector('.search-bar input');
const searchButton = document.querySelector('.search-bar button');

// Sample product data (this would typically come from your database)
const sampleProducts = [
    {
        id: 1,
        name: "Logitech G Pro X Superlight",
        category: "Gaming Mice",
        price: 149.99,
        image: "images/mice/logitech-g-pro-x.jpg",
        rating: 4.8,
        description: "Ultra-lightweight wireless gaming mouse with HERO sensor"
    },
    {
        id: 2,
        name: "SteelSeries Arctis Pro",
        category: "Gaming Headsets",
        price: 179.99,
        image: "images/headsets/steelseries-arctis-pro.jpg",
        rating: 4.7,
        description: "High-fidelity wireless gaming headset with premium sound"
    },
    // Add more sample products here
];

// Create product card (general)
function createProductCard(product) {
    console.log('Creating product card for:', product); // Debug log
    
    // Parse specs if it's a string
    let specs = product.specs;
    if (typeof specs === 'string') {
        try {
            specs = JSON.parse(specs);
        } catch (e) {
            console.error('Error parsing specs:', e);
            specs = {};
        }
    }

    const card = document.createElement('div');
    card.className = 'product-card';
    
    // Format price with RM currency
    const formattedPrice = `RM ${parseFloat(product.price).toFixed(2)}`;
    
    card.innerHTML = `
        <div class="product-image">
            <img src="${product.image}" alt="${product.name}">
        </div>
        <div class="product-info">
            <h3>${product.name}</h3>
            <div class="product-meta">
                <span class="rating">
                    <i class="fas fa-star"></i> ${product.rating}
                </span>
                <span class="price">${formattedPrice}</span>
            </div>
            <p class="description">${product.description}</p>
            ${specs ? `
                <div class="product-specs">
                    ${Object.entries(specs)
                        .filter(([key]) => key !== 'features')
                        .map(([key, value]) => `
                            <div class="spec-item">
                                <span class="spec-label">${key.replace(/_/g, ' ').replace(/\b\w/g, l => l.toUpperCase())}:</span>
                                <span class="spec-value">${value}</span>
                            </div>
                        `).join('')}
                </div>
            ` : ''}
            <div class="product-actions">
                <a class="btn-primary add-to-cart" href="${product.affiliate_link}" target="_blank" rel="noopener">
                    <i class="fas fa-shopping-cart"></i> Buy on Amazon
                </a>
                <button class="btn-secondary add-to-wishlist" data-product-id="${product.id}">
                    <i class="far fa-heart"></i>
                </button>
            </div>
        </div>
    `;
    
    return card;
}

// Create a simplified product card for homepage featured products
function createFeaturedProductCard(product) {
    const card = document.createElement('div');
    card.className = 'product-card featured-product-card';
    const formattedPrice = `RM ${parseFloat(product.price).toFixed(2)}`;
    card.innerHTML = `
        <div class="product-image">
            <img src="${product.image}" alt="${product.name}">
        </div>
        <div class="product-info">
            <h3>${product.name}</h3>
            <div class="product-meta">
                <span class="rating">
                    <i class="fas fa-star"></i> ${product.rating}
                </span>
                <span class="price">${formattedPrice}</span>
            </div>
        </div>
    `;
    return card;
}

// Generate star rating HTML
function generateStarRating(rating) {
    const fullStars = Math.floor(rating);
    const hasHalfStar = rating % 1 >= 0.5;
    let starsHTML = '';

    for (let i = 0; i < fullStars; i++) {
        starsHTML += '<i class="fas fa-star"></i>';
    }
    if (hasHalfStar) {
        starsHTML += '<i class="fas fa-star-half-alt"></i>';
    }
    const emptyStars = 5 - Math.ceil(rating);
    for (let i = 0; i < emptyStars; i++) {
        starsHTML += '<i class="far fa-star"></i>';
    }

    return starsHTML;
}

// Load featured products
async function loadFeaturedProducts() {
    console.log('Loading featured products...'); // Debug log
    const productsGrid = document.getElementById('featured-products-grid');
    if (!productsGrid) {
        console.error('Featured products grid not found!');
        return;
    }
    try {
        const response = await fetch('get_products.php?sort=rating&limit=3');
        const data = await response.json();
        console.log('Featured products response:', data); // Debug log
        if (data.status === 'success' && data.products.length > 0) {
            productsGrid.innerHTML = '';
            data.products.slice(0, 3).forEach(product => {
                const card = createFeaturedProductCard(product);
                productsGrid.appendChild(card);
            });
        } else {
            console.log('No featured products found');
            productsGrid.innerHTML = '<div class="no-products">No featured products available at the moment.</div>';
        }
    } catch (error) {
        console.error('Error loading featured products:', error);
        productsGrid.innerHTML = '<div class="error-message">Error loading featured products. Please try again later.</div>';
    }
}

// Search functionality
function handleSearch() {
    const searchTerm = searchInput.value.toLowerCase();
    const filteredProducts = sampleProducts.filter(product => 
        product.name.toLowerCase().includes(searchTerm) ||
        product.category.toLowerCase().includes(searchTerm) ||
        product.description.toLowerCase().includes(searchTerm)
    );

    if (featuredProductsGrid) {
        featuredProductsGrid.innerHTML = filteredProducts
            .map(product => createProductCard(product))
            .join('');
    }
}

// Blog Post Functions
function createBlogCard(post) {
    const tags = post.tags ? post.tags.split(',').map(tag => tag.trim()) : [];
    // Determine the correct link for the blog post
    let postLink = '';
    if (post.slug === 'top-5-gaming-mice-2024') {
        postLink = 'blog_top5_gaming_mice_2024.html';
    } else if (post.slug === 'ultimate-mechanical-keyboard-guide') {
        postLink = 'blog_ultimate_mechanical_keyboard_guide.html';
    } else if (post.slug === 'ultimate-gaming-headset-guide') {
        postLink = 'blog-gaming-headset.html';
    } else if (post.slug === 'ultimate-monitor-guide') {
        postLink = 'blog-monitor-guide.html';
    } else {
        postLink = 'blog.html?post=' + post.slug;
    }
    return `
        <article class="blog-card">
            <div class="blog-card-image">
                <img src="${post.featured_image}" alt="${post.title}">
            </div>
            <div class="blog-card-content">
                <div class="blog-card-meta">
                    <span><i class="far fa-user"></i> ${post.author}</span>
                    <span><i class="far fa-calendar"></i> ${formatDate(post.created_at)}</span>
                    <span><i class="far fa-folder"></i> ${post.category}</span>
                </div>
                <h3><a href="${postLink}">${post.title}</a></h3>
                <p class="blog-card-excerpt">${post.excerpt}</p>
                <div class="blog-card-tags">
                    ${tags.map(tag => `<a href="blog.html?tag=${tag}" class="blog-tag">${tag}</a>`).join('')}
                </div>
            </div>
        </article>
    `;
}

function formatDate(dateString) {
    const options = { year: 'numeric', month: 'long', day: 'numeric' };
    return new Date(dateString).toLocaleDateString(undefined, options);
}

async function loadLatestBlogPosts() {
    console.log('Loading latest blog posts...'); // Debug log
    
    const blogGrid = document.getElementById('latest-blog-posts');
    if (!blogGrid) {
        console.error('Blog grid not found!');
        return;
    }

    try {
        const response = await fetch('get_blog_posts.php?limit=2');
        const data = await response.json();
        console.log('Blog posts response:', data); // Debug log

        if (data.status === 'success' && data.posts.length > 0) {
            blogGrid.innerHTML = '';
            data.posts.forEach(post => {
                // Determine the correct link for the blog post
                let postLink = '';
                if (post.slug === 'top-5-gaming-mice-2024') {
                    postLink = 'blog_top5_gaming_mice_2024.html';
                } else if (post.slug === 'ultimate-mechanical-keyboard-guide') {
                    postLink = 'blog_ultimate_mechanical_keyboard_guide.html';
                } else if (post.slug === 'ultimate-gaming-headset-guide') {
                    postLink = 'blog-gaming-headset.html';
                } else if (post.slug === 'ultimate-monitor-guide') {
                    postLink = 'blog-monitor-guide.html';
                } else {
                    postLink = 'blog.html?post=' + post.slug;
                }
                console.log('Post link for', post.title, ':', postLink);
                const card = document.createElement('div');
                card.className = 'blog-card';
                // Format date
                const date = new Date(post.created_at);
                const formattedDate = date.toLocaleDateString('en-US', {
                    year: 'numeric',
                    month: 'long',
                    day: 'numeric'
                });
                card.innerHTML = `
                    <div class="blog-image">
                        <img src="${post.featured_image}" alt="${post.title}">
                    </div>
                    <div class="blog-content">
                        <div class="blog-meta">
                            <span class="author"><i class="fas fa-user"></i> ${post.author}</span>
                            <span class="date"><i class="fas fa-calendar"></i> ${formattedDate}</span>
                            <span class="category"><i class="fas fa-folder"></i> ${post.category}</span>
                        </div>
                        <h3><a href="${postLink}">${post.title}</a></h3>
                        <p>${post.excerpt}</p>
                        <div class="blog-tags">
                            ${post.tags.split(',').map(tag => `
                                <span class="tag">${tag.trim()}</span>
                            `).join('')}
                        </div>
                        <a href="${postLink}" class="btn-primary">Read More</a>
                    </div>
                `;
                blogGrid.appendChild(card);
            });
        } else {
            console.log('No blog posts found');
            blogGrid.innerHTML = '<div class="no-posts">No blog posts available at the moment.</div>';
        }
    } catch (error) {
        console.error('Error loading blog posts:', error);
        blogGrid.innerHTML = '<div class="error-message">Error loading blog posts. Please try again later.</div>';
    }
}

// Product Page Functions
function getUrlParameter(name) {
    name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
    const regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
    const results = regex.exec(location.search);
    return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
}

// Brand options for different categories
const brandOptions = {
    default: [
        { value: '', label: 'All Brands' },
        { value: 'logitech', label: 'Logitech' },
        { value: 'razer', label: 'Razer' },
        { value: 'steelseries', label: 'SteelSeries' },
        { value: 'corsair', label: 'Corsair' }
    ],
    monitors: [
        { value: '', label: 'All Brands' },
        { value: 'benq', label: 'BenQ' },
        { value: 'samsung', label: 'Samsung' }
    ],
    cpu: [
        { value: '', label: 'All Brands' },
        { value: 'intel', label: 'Intel' },
        { value: 'amd', label: 'AMD' }
    ],
    gpu: [
        { value: '', label: 'All Brands' },
        { value: 'nvidia', label: 'Nvidia' },
        { value: 'amd', label: 'AMD' }
    ],
    storage: [
        { value: '', label: 'All Brands' },
        { value: 'samsung', label: 'Samsung' },
        { value: 'kingston', label: 'Kingston' },
        { value: 'crucial', label: 'Crucial' }
    ],
    ram: [
        { value: '', label: 'All Brands' },
        { value: 'corsair', label: 'Corsair' },
        { value: 'kingston', label: 'Kingston' },
        { value: 'samsung', label: 'Samsung' }
    ],
    // Combined list of all unique brands
    allBrands: [
        { value: '', label: 'All Brands' },
        { value: 'logitech', label: 'Logitech' },
        { value: 'razer', label: 'Razer' },
        { value: 'steelseries', label: 'SteelSeries' },
        { value: 'corsair', label: 'Corsair' },
        { value: 'benq', label: 'BenQ' },
        { value: 'samsung', label: 'Samsung' },
        { value: 'intel', label: 'Intel' },
        { value: 'amd', label: 'AMD' },
        { value: 'nvidia', label: 'Nvidia' },
        { value: 'kingston', label: 'Kingston' },
        { value: 'crucial', label: 'Crucial' }
    ]
};

function updateBrandOptions(category) {
    const brandFilter = document.getElementById('brand-filter');
    if (!brandFilter) return;

    // Clear existing options
    brandFilter.innerHTML = '';

    // Get the appropriate brand options
    let options;
    if (!category || category === '') {
        // Show all brands when no category is selected
        options = brandOptions.allBrands;
    } else {
        switch(category.toLowerCase()) {
            case 'monitors':
                options = brandOptions.monitors;
                break;
            case 'cpu':
                options = brandOptions.cpu;
                break;
            case 'gpu':
                options = brandOptions.gpu;
                break;
            case 'storage':
                options = brandOptions.storage;
                break;
            case 'ram':
                options = brandOptions.ram;
                break;
            default:
                options = brandOptions.default;
        }
    }

    // Add new options
    options.forEach(option => {
        const optionElement = document.createElement('option');
        optionElement.value = option.value;
        optionElement.textContent = option.label;
        brandFilter.appendChild(optionElement);
    });
}

async function loadProducts() {
    console.log('Loading products...'); // Debug log
    const productsGrid = document.getElementById('products-grid');
    const pagination = document.getElementById('products-pagination');
    if (!productsGrid) {
        console.error('Products grid element not found!');
        return;
    }
    // Get filter values
    const category = document.getElementById('product-category')?.value || '';
    const brand = document.getElementById('brand-filter')?.value || '';
    const sort = document.getElementById('sort-filter')?.value || '';
    const urlParams = new URLSearchParams(window.location.search);
    const page = urlParams.get('page') || 1;
    // Build query string
    const queryParams = new URLSearchParams({
        category: category,
        brand: brand,
        sort: sort,
        page: page
    });
    try {
        const response = await fetch(`get_products.php?${queryParams.toString()}`);
        const data = await response.json();
        console.log('Products API Response:', data); // Debug log
        if (data.status === 'success') {
            // Clear existing products
            productsGrid.innerHTML = '';
            if (data.products.length === 0) {
                console.log('No products found matching criteria'); // Debug log
                productsGrid.innerHTML = '<div class="no-products">No products found matching your criteria.</div>';
                if (pagination) pagination.innerHTML = '';
                return;
            }
            console.log(`Creating ${data.products.length} product cards`); // Debug log
            // Create product cards
            data.products.forEach(product => {
                const card = createProductCard(product);
                productsGrid.appendChild(card);
            });
            // Update pagination
            if (pagination) updatePagination(data.current_page, data.total_pages);
        } else {
            console.error('Error loading products:', data.message);
            productsGrid.innerHTML = '<div class="error-message">Error loading products. Please try again later.</div>';
        }
    } catch (error) {
        console.error('Error:', error);
        productsGrid.innerHTML = '<div class="error-message">Error loading products. Please try again later.</div>';
    }
}

function updatePagination(totalPages, currentPage) {
    const pagination = document.getElementById('products-pagination');
    if (!pagination) return;

    let paginationHTML = '';
    
    // Previous button
    paginationHTML += `
        <button class="pagination-prev" ${currentPage === 1 ? 'disabled' : ''}>
            <i class="fas fa-chevron-left"></i>
        </button>
    `;

    // Page numbers
    for (let i = 1; i <= totalPages; i++) {
        paginationHTML += `
            <button class="pagination-number ${i === currentPage ? 'active' : ''}" data-page="${i}">
                ${i}
            </button>
        `;
    }

    // Next button
    paginationHTML += `
        <button class="pagination-next" ${currentPage === totalPages ? 'disabled' : ''}>
            <i class="fas fa-chevron-right"></i>
        </button>
    `;

    pagination.innerHTML = paginationHTML;

    // Add event listeners to pagination buttons
    pagination.querySelectorAll('.pagination-number').forEach(button => {
        button.addEventListener('click', () => {
            const page = parseInt(button.dataset.page);
            loadProducts(getUrlParameter('category'), page);
        });
    });

    pagination.querySelector('.pagination-prev').addEventListener('click', () => {
        if (currentPage > 1) {
            loadProducts(getUrlParameter('category'), currentPage - 1);
        }
    });

    pagination.querySelector('.pagination-next').addEventListener('click', () => {
        if (currentPage < totalPages) {
            loadProducts(getUrlParameter('category'), currentPage + 1);
        }
    });
}

// Event Listeners
document.addEventListener('DOMContentLoaded', function() {
    console.log('DOM Content Loaded'); // Debug log
    
    // Load featured products and blog posts on the home page
    if (document.getElementById('featured-products-grid')) {
        loadFeaturedProducts();
    }
    if (document.getElementById('latest-blog-posts')) {
        loadLatestBlogPosts();
    }
    
    // Set initial category from URL if present
    const urlParams = new URLSearchParams(window.location.search);
    const category = urlParams.get('category');
    if (category) {
        const categorySelect = document.getElementById('product-category');
        if (categorySelect) {
            categorySelect.value = category;
        }
    }
    
    // Load products on the products page
    if (document.getElementById('products-grid')) {
        loadProducts();
        // Add event listeners for filters
        const categorySelect = document.getElementById('product-category');
        if (categorySelect) {
            categorySelect.addEventListener('change', function() {
                // Update URL parameter for category
                const url = new URL(window.location);
                url.searchParams.set('category', this.value);
                window.history.replaceState({}, '', url);
                // Update category title and description
                const title = document.getElementById('category-title');
                const desc = document.getElementById('category-description');
                if (title) {
                    title.textContent = this.value ? this.value : 'All Products';
                }
                if (desc) {
                    switch (this.value) {
                        case 'Gaming Headsets':
                            desc.textContent = 'Browse our collection of premium gaming headsets.';
                            break;
                        case 'Gaming Keyboards':
                            desc.textContent = 'Browse our collection of premium gaming keyboards.';
                            break;
                        case 'Gaming Mice':
                            desc.textContent = 'Browse our collection of premium gaming mice.';
                            break;
                        case 'Gaming Monitors':
                            desc.textContent = 'Browse our collection of premium gaming monitors.';
                            break;
                        default:
                            desc.textContent = 'Browse our collection of premium gaming gear';
                    }
                }
                loadProducts();
            });
        }
        const filters = ['brand-filter', 'sort-filter'];
        filters.forEach(filterId => {
            const element = document.getElementById(filterId);
            if (element) {
                element.addEventListener('change', loadProducts);
            }
        });
    }

    // Search functionality
    const searchButton = document.querySelector('.search-bar button');
    const searchInput = document.querySelector('.search-bar input');
    
    if (searchButton && searchInput) {
        searchButton.addEventListener('click', handleSearch);
        searchInput.addEventListener('keypress', (e) => {
            if (e.key === 'Enter') {
                handleSearch();
            }
        });
    }

    // Add to cart functionality
    document.addEventListener('click', (e) => {
        if (e.target.classList.contains('add-to-cart')) {
            const productId = e.target.dataset.productId;
            // Add to cart logic here
            console.log(`Added product ${productId} to cart`);
            // You can implement a cart system or show a notification
        }
    });
});

// Smooth scroll for navigation links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            target.scrollIntoView({
                behavior: 'smooth'
            });
        }
    });
});

// Load all blog posts for the blog page (list style)
async function loadAllBlogPosts(filters = {}) {
    const blogGrid = document.getElementById('blog-posts-grid');
    if (!blogGrid) return;

    // Build query string from filters
    const params = new URLSearchParams();
    if (filters.category) params.append('category', filters.category);
    if (filters.search) params.append('search', filters.search);
    // No limit param: fetch all

    try {
        const response = await fetch('get_blog_posts.php?' + params.toString());
        const data = await response.json();
        if (data.status === 'success' && data.posts.length > 0) {
            blogGrid.innerHTML = '';
            data.posts.forEach(post => {
                const date = new Date(post.created_at);
                const formattedDate = date.toLocaleDateString('en-US', {
                    year: 'numeric', month: 'long', day: 'numeric'
                });
                // Determine the correct link for the blog post
                let postLink = '';
                if (post.slug === 'top-5-gaming-mice-2024') {
                    postLink = 'blog_top5_gaming_mice_2024.html';
                } else if (post.slug === 'ultimate-mechanical-keyboard-guide') {
                    postLink = 'blog_ultimate_mechanical_keyboard_guide.html';
                } else if (post.slug === 'ultimate-gaming-headset-guide') {
                    postLink = 'blog-gaming-headset.html';
                } else if (post.slug === 'ultimate-monitor-guide') {
                    postLink = 'blog-monitor-guide.html';
                } else {
                    postLink = 'blog.html?post=' + post.slug;
                }
                // List style rendering
                const item = document.createElement('div');
                item.className = 'blog-list-item';
                item.innerHTML = `
                    <div class="blog-list-image">
                        <img src="${post.featured_image}" alt="${post.title}">
                    </div>
                    <div class="blog-list-content">
                        <a class="blog-list-title" href="${postLink}">${post.title}</a>
                        <div class="blog-list-meta">
                            <span><i class="fas fa-user"></i> ${post.author}</span> &nbsp;|&nbsp; <span><i class="fas fa-calendar"></i> ${formattedDate}</span>
                        </div>
                        <div class="blog-list-excerpt">${post.excerpt}</div>
                    </div>
                `;
                blogGrid.appendChild(item);
            });
        } else {
            blogGrid.innerHTML = '<div class="no-posts">No blog posts available at the moment.</div>';
        }
    } catch (error) {
        blogGrid.innerHTML = '<div class="error-message">Error loading blog posts. Please try again later.</div>';
    }
}

// Blog filter form event
const blogFiltersForm = document.getElementById('blog-filters-form');
if (blogFiltersForm) {
    blogFiltersForm.addEventListener('submit', function(e) {
        e.preventDefault();
        const category = document.getElementById('category-filter')?.value || '';
        const search = blogFiltersForm.querySelector('input[name="search"]')?.value || '';
        loadAllBlogPosts({ category, search });
    });
}

// On DOMContentLoaded, load all blog posts on blog.html
if (document.getElementById('blog-posts-grid')) {
    loadAllBlogPosts();
}