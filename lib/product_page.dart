import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  final Map<String, dynamic> product;

  const ProductPage({super.key, required this.product});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int _quantity = 1;
  int _selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final List<Color> colors = (product['colors'] as List<Color>);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // ============================================================
          // BAGIAN GAMBAR PRODUK BESAR
          // Gambar diambil dari product['image'] yang kamu set di home_page.dart
          // Jadi cukup ganti di _products list di home_page.dart
          // ============================================================
          Expanded(
            flex: 5,
            child: Stack(
              children: [
                // Gambar utama produk
                Container(
                  width: double.infinity,
                  color: const Color(0xFFF5F5F5),
                  child: Image.asset(
                    product['image'] as String,
                    fit: BoxFit.contain,
                    // ⬆️ Gambar dari product['image'] di home_page.dart
                    errorBuilder: (_, __, ___) => Container(
                      color: const Color(0xFFF5F5F5),
                      child: const Center(
                        child: Icon(Icons.image_outlined,
                            color: Color(0xFFBDBDBD), size: 60),
                      ),
                    ),
                  ),
                ),

                // Tombol back
                Positioned(
                  top: MediaQuery.of(context).padding.top + 8,
                  left: 16,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: const Icon(Icons.chevron_left,
                          color: Color(0xFF1A1A1A), size: 24),
                    ),
                  ),
                ),

                // Pilihan warna di kiri tengah
                Positioned(
                  left: 16,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(colors.length, (index) {
                        final isSelected = _selectedColor == index;
                        return GestureDetector(
                          onTap: () =>
                              setState(() => _selectedColor = index),
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            width: isSelected ? 28 : 22,
                            height: isSelected ? 28 : 22,
                            decoration: BoxDecoration(
                              color: colors[index],
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isSelected
                                    ? const Color(0xFF1A1A1A)
                                    : Colors.transparent,
                                width: 2,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),

                // Indikator slide kanan bawah (dekoratif)
                Positioned(
                  right: 16,
                  bottom: 16,
                  child: Row(
                    children: List.generate(3, (index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        width: index == 0 ? 16 : 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: index == 0
                              ? const Color(0xFF1A1A1A)
                              : const Color(0xFFE0E0E0),
                          borderRadius: BorderRadius.circular(3),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),

          // Detail produk
          Expanded(
            flex: 6,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(24, 28, 24, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nama & harga
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          product['name'] as String,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF1A1A1A),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Harga & quantity control
                  Row(
                    children: [
                      Text(
                        '\$ ${(product['price'] as double).toStringAsFixed(0)}',
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                      const Spacer(),
                      // Tombol minus
                      _buildQtyButton(
                        icon: Icons.add,
                        onTap: () => setState(() => _quantity++),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          _quantity.toString().padLeft(2, '0'),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1A1A1A),
                          ),
                        ),
                      ),
                      _buildQtyButton(
                        icon: Icons.remove,
                        onTap: () {
                          if (_quantity > 1) setState(() => _quantity--);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Rating
                  Row(
                    children: [
                      const Icon(Icons.star_rounded,
                          color: Color(0xFFFFC107), size: 18),
                      const SizedBox(width: 4),
                      Text(
                        '${product['rating']}',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '(${product['reviews']} reviews)',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF9E9E9E),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Deskripsi
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        product['description'] as String,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 1.6,
                          color: Color(0xFF9E9E9E),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Tombol Add to Cart
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Row(
                      children: [
                        // Bookmark button
                        Container(
                          width: 52,
                          height: 52,
                          margin: const EdgeInsets.only(right: 12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: const Icon(Icons.bookmark_border,
                              color: Color(0xFF1A1A1A), size: 22),
                        ),
                        // Add to Cart
                        Expanded(
                          child: SizedBox(
                            height: 52,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1A1A1A),
                                foregroundColor: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                              child: const Text(
                                'Add to cart',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQtyButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 16, color: const Color(0xFF1A1A1A)),
      ),
    );
  }
}