import 'package:flutter/material.dart';
import 'package:union_shop/widgets/navigation.dart';

class PrintShackPage extends StatelessWidget {
  const PrintShackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppNavigation(
              bannerText: 'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS',
            ),
            const Divider(
              height: 1,
              thickness: 0.5,
              color: Color(0xFFE0E0E0),
            ),
            
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 760),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 8),
                      const Text(
                        'The Union Print Shack',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Image.network(
                          'https://cdn.shopify.com/s/files/1/0226/4599/7643/files/The_Union_Print_Shack_Logo_-_Personalisation.png?v=1760535658',
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'PrintShackPage page placeholder',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          height: 1.6,
                        ),
                      ),
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
