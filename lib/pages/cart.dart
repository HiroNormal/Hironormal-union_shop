import 'package:flutter/material.dart';
import 'package:union_shop/widgets/navigation.dart';
import 'package:union_shop/models/cart.dart';
import 'package:union_shop/models/products.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final items = cart.items.entries.toList();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppNavigation(
              bannerText:
                  'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS',
            ),
            const Divider(
              height: 1,
              thickness: 0.5,
              color: Color(0xFFE0E0E0),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 760),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      const Text(
                        'Your Cart',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 16),

                      
                      if (cart.isEmpty) ...[
                        const Text(
                          'Your cart is empty',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        const SizedBox(height: 12),
                        TextButton(
                          onPressed: () => navigateToHome(context),
                          child: const Text('Back to shop'),
                        ),
                      ] else ...[
                        
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            final entry = items[index];
                            final Product product = entry.key;
                            final int qty = entry.value;

                            return Column(
                              children: [
                                ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: Image.network(
                                    product.image,
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.cover,
                                  ),
                                  title: Text(
                                    product.name,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 4),
                                      Text(
                                        product.price,
                                        style: const TextStyle(color: Colors.grey),
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              setState(() {
                                                cart.remove(product, quantity: 1);
                                              });
                                            },
                                            icon: const Icon(Icons.remove_circle_outline),
                                          ),
                                          Text(
                                            '$qty',
                                            style: const TextStyle(fontSize: 16),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              setState(() {
                                                cart.add(product, quantity: 1);
                                              });
                                            },
                                            icon: const Icon(Icons.add_circle_outline),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  trailing: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        cart.updateQuantity(product, 0);
                                      });
                                    },
                                    icon: const Icon(Icons.delete_outline),
                                  ),
                                ),
                                const Divider(),
                              ],
                            );
                          },
                        ),

                        const SizedBox(height: 16),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '£${cart.totalPrice.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Proceed to checkout (placeholder)'),
                              ),
                            );
                          },
                          child: const Text('Checkout'),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
