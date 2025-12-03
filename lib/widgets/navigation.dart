import 'package:flutter/material.dart';

class AppNavigation extends StatelessWidget {
  final String bannerText;
  const AppNavigation({super.key, required this.bannerText});

  void _placeholderCallbackForButtons() {}

  Widget _navTextButton(BuildContext context, String label, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
        foregroundColor: WidgetStateProperty.all(Colors.grey[800]),
        textStyle: WidgetStateProperty.resolveWith<TextStyle?>(
          (states) {
            final hovered = states.contains(WidgetState.hovered);
            return TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              decoration: hovered ? TextDecoration.underline : TextDecoration.none,
              decorationThickness: hovered ? 1.4 : 0,
            );
          },
        ),
      ),
      child: Text(label),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        final showFullNav = constraints.maxWidth > 900;
        
        return Container(
          height: 100,
          color: Colors.white,
          child: Column(
            children: [
          // Top banner
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8),
            color: const Color(0xFF4d2963),
            child: Text(
              bannerText,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 16),
              
            ),
          ),
          // Main header (logo, centered nav buttons, action icons)
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                    },
                    child: Image.network(
                      'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                      height: 18,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          width: 18,
                          height: 18,
                          child: const Center(
                            child: Icon(Icons.image_not_supported, color: Colors.grey),
                          ),
                        );
                      },
                    ),
                  ),
                  // Centered nav buttons
                  if (showFullNav)
                    Expanded(
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _navTextButton(context, 'Home', () => Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false)),
                            const SizedBox(width: 12),
                            _navTextButton(context, 'UPSU.net', () => Navigator.pushNamed(context, '/upsu')),
                            const SizedBox(width: 12),
                            _navTextButton(context, 'About', () => Navigator.pushNamed(context, '/about')),
                            const SizedBox(width: 12),
                            _navTextButton(context, 'Shop', () => Navigator.pushNamed(context, '/shop')),
                            const SizedBox(width: 12),
                            _navTextButton(context, 'The Print Shack', () => Navigator.pushNamed(context, '/print')),
                            const SizedBox(width: 12),
                            _navTextButton(context, 'SALE!', () => Navigator.pushNamed(context, '/sale')),
                          ],
                        ),
                      ),
                    )
                  else
                    const Spacer(),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.search, size: 18, color: Colors.grey),
                          padding: const EdgeInsets.all(8),
                          constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                          onPressed: _placeholderCallbackForButtons,
                        ),
                        IconButton(
                          icon: const Icon(Icons.person_outline, size: 18, color: Colors.grey),
                          padding: const EdgeInsets.all(8),
                          constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                          onPressed: _placeholderCallbackForButtons,
                        ),
                        IconButton(
                          icon: const Icon(Icons.shopping_bag_outlined, size: 18, color: Colors.grey),
                          padding: const EdgeInsets.all(8),
                          constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                          onPressed: _placeholderCallbackForButtons,
                        ),
                        IconButton(
                          icon: const Icon(Icons.menu, size: 18, color: Colors.grey),
                          padding: const EdgeInsets.all(8),
                          constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                          onPressed: _placeholderCallbackForButtons,
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
    );
  }
}