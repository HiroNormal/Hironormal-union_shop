import 'package:flutter/material.dart';
import 'package:union_shop/widgets/navigation.dart';
import 'package:union_shop/models/products.dart';
import 'package:union_shop/models/cart.dart';

const TextStyle normalText = TextStyle(fontSize: 16, color: Colors.black);
const TextStyle heading2 = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

class ProductPage extends StatefulWidget {
  const ProductPage({super.key, required this.product});
  final Product product;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int _quantity = 1;

  void navigateToAbout(BuildContext context) {
    if (ModalRoute.of(context)?.settings.name == '/about') return;
    Navigator.pushNamed(context, '/about');
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppNavigation(bannerText: 'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS'),

            const Divider(
              height: 1,
              thickness: 0.5,
              color: Color(0xFFE0E0E0),
            ),

            Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(24)),
                color: Colors.grey[200],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(24)),
                child: Image.network(
                  product.image,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      child: const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.image_not_supported,
                              size: 64,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // Product details
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    product.price,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4d2963),
                    ),
                  ),

                  const SizedBox(height: 24),

                  

                
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Quantity',
                            style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            ),
                          ),
                        const SizedBox(height: 8),
                        IconButton(
                          onPressed: _quantity > 0 ? () => setState(() => _quantity--) : null,
                          icon: const Icon(Icons.remove),
                        ),
                        Text('$_quantity', style: heading2),
                        IconButton(
                          onPressed: () => setState(() => _quantity++),
                          icon: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  ),

                
                  OutlinedButton.icon(
                    onPressed: () {
                      cart.add(product, quantity: _quantity);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${product.name} added to cart (x$_quantity)')),
                      );
                      Navigator.pushNamed(context, '/cart');
                    },
                     icon: const Icon(Icons.add_shopping_cart, color: Colors.black),
                     label: const Text(
                       'Add to Cart',
                       style: TextStyle(color: Colors.black),
                     ),
                     style: OutlinedButton.styleFrom(
                       backgroundColor: Colors.white,
                       side: const BorderSide(color: Colors.black),
                       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                     ),
                   ),

                  const SizedBox(height: 24),

                  // Product description
                  
                  const SizedBox(height: 8),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final double maxTextWidth = constraints.maxWidth > 700 ? 700 : constraints.maxWidth;
                      return Align(
                        alignment: Alignment.centerLeft,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: maxTextWidth),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 16),
                              Text(
                                product.description,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  height: 1.6,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
