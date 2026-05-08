import 'package:flutter/material.dart';
import 'product_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedCategory = 1;
  int _selectedNav = 0;

  final List<Map<String, String>> _categories = [
    {'label': 'Popular', 'icon': 'star'},
    {'label': 'Chair', 'icon': 'chair'},
    {'label': 'Table', 'icon': 'table'},
    {'label': 'Armchair', 'icon': 'armchair'},
    {'label': 'Bed', 'icon': 'bed'},
  ];


  final List<Map<String, dynamic>> _products = [
    {
      'name': 'Black Simple Lamp',
      'price': 12.00,
      'image': 'assets/images/foto1.png',
      'colors': [Colors.black, Colors.brown, Colors.grey],
      'rating': 4.3,
      'reviews': 30,
      'description':
          'A sleek and simple black lamp perfect for modern interiors. Minimalist design that complements any room style.',
    },
    {
      'name': 'Minimal Stand',
      'price': 25.00,
      'image': 'assets/images/foto2.jpg',     
      'colors': [Colors.white, Colors.brown, Colors.grey],
      'rating': 4.5,
      'reviews': 50,
      'description':
          'Minimal Stand is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home.',
    },
    {
      'name': 'Coffee Chair',
      'price': 12.00,
      'image': 'assets/images/foto3.jpg',
      'colors': [Colors.brown, Colors.black, Colors.white],
      'rating': 4.1,
      'reviews': 22,
      'description':
          'A cozy coffee chair crafted for comfort and style. Ideal for living rooms and reading nooks.',
    },
    {
      'name': 'Simple Desk',
      'price': 12.00,
      'image': 'assets/images/foto4.png',
      'colors': [Colors.brown, Colors.white, Colors.black],
      'rating': 4.2,
      'reviews': 18,
      'description':
          'Clean and functional desk for your workspace. Simple design with durable wood construction.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(),
            _buildCategoryRow(),
            Expanded(
              child: _buildProductGrid(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Color(0xFF1A1A1A), size: 24),
          ),
          const Column(
            children: [
              Text(
                'MAKE HOME',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF9E9E9E),
                  letterSpacing: 0.5,
                ),
              ),
              Text(
                'BEAUTIFUL',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF1A1A1A),
                  letterSpacing: 0.3,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_bag_outlined,
                color: Color(0xFF1A1A1A), size: 24),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryRow() {
    final iconData = [
      Icons.star_rounded,
      Icons.chair_outlined,
      Icons.table_restaurant_outlined,
      Icons.weekend_outlined,
      Icons.bed_outlined,
    ];

    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final isSelected = _selectedCategory == index;
          return GestureDetector(
            onTap: () => setState(() => _selectedCategory = index),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
              width: 60,
              child: Column(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Colors.white
                          : const Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(12),
                      border: isSelected
                          ? Border.all(
                              color: const Color(0xFF4CAF50), width: 2)
                          : null,
                    ),
                    child: Icon(
                      iconData[index],
                      size: 22,
                      color: isSelected
                          ? const Color(0xFF1A1A1A)
                          : const Color(0xFF9E9E9E),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _categories[index]['label']!,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.w400,
                      color: isSelected
                          ? const Color(0xFF1A1A1A)
                          : const Color(0xFF9E9E9E),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductGrid() {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.78,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: _products.length,
      itemBuilder: (context, index) {
        final product = _products[index];
        return _buildProductCard(product);
      },
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductPage(product: product),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar produk
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16)),
                    child: SizedBox(
                      width: double.infinity,
                      child: Image.asset(
                        product['image'] as String,
                        fit: BoxFit.cover,
                        // ⬆️ Ganti asset di _products list di atas
                        errorBuilder: (_, __, ___) => Container(
                          color: const Color(0xFFF5F5F5),
                          child: const Icon(Icons.image_outlined,
                              color: Color(0xFFBDBDBD), size: 40),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 4,
                          )
                        ],
                      ),
                      child: const Icon(Icons.bookmark_border,
                          size: 16, color: Color(0xFF1A1A1A)),
                    ),
                  ),
                ],
              ),
            ),
            // Info produk
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product['name'] as String,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1A1A1A),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$ ${(product['price'] as double).toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNav() {
    final icons = [
      Icons.home_outlined,
      Icons.bookmark_border,
      Icons.notifications_outlined,
      Icons.person_outline,
    ];

    return Container(
      height: 64,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFEEEEEE))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(icons.length, (index) {
          final isSelected = _selectedNav == index;
          return IconButton(
            onPressed: () => setState(() => _selectedNav = index),
            icon: Icon(
              icons[index],
              color: isSelected
                  ? const Color(0xFF1A1A1A)
                  : const Color(0xFFBDBDBD),
              size: 24,
            ),
          );
        }),
      ),
    );
  }
}