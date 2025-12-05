import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/pages/product_page.dart';
import 'package:union_shop/models/products.dart';

void main() {
  // Provide a routes map including '/cart' so ProductPage's Navigator.pushNamed('/cart') works in tests.
  Widget createTestWidget(Product product) {
    return MaterialApp(
      home: ProductPage(product: product),
      routes: {
        '/cart': (context) => const Scaffold(body: Center(child: Text('Cart page (test stub)'))),
      },
    );
  }

  group('ProductPage widget tests', () {
    testWidgets('basic elements are displayed', (WidgetTester tester) async {
      // enlarge test surface so header and product content fit; avoids overflow and off-screen taps
      await tester.binding.setSurfaceSize(const Size(1200, 900));

      final product = allProducts.firstWhere((p) => p.type == ProductType.portsmouthCityPostcard2);

      await tester.pumpWidget(createTestWidget(product));
      await tester.pumpAndSettle();

      // header/banner present
      expect(find.textContaining('BIG SALE'), findsOneWidget);

      // product details from the passed Product
      expect(find.text(product.name), findsOneWidget);
      expect(find.text(product.price), findsOneWidget);

      // description and Add to Cart button
      expect(find.textContaining('Celebrate the charm'), findsOneWidget);
      expect(find.text('Add to Cart'), findsOneWidget);
    });

    testWidgets('quantity controls update displayed quantity', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 900));
      final product = allProducts.firstWhere((p) => p.type == ProductType.portsmouthCityPostcard2);

      await tester.pumpWidget(createTestWidget(product));
      await tester.pumpAndSettle();

      // initial quantity
      expect(find.text('1'), findsOneWidget);

      final Finder addButton = find.byIcon(Icons.add);
      final Finder removeButton = find.byIcon(Icons.remove);

      // tap add -> 2
      await tester.tap(addButton);
      await tester.pumpAndSettle();
      expect(find.text('2'), findsOneWidget);

      // tap remove -> 1
      await tester.tap(removeButton);
      await tester.pumpAndSettle();
      expect(find.text('1'), findsOneWidget);

      // tap remove -> 0
      await tester.tap(removeButton);
      await tester.pumpAndSettle();
      expect(find.text('0'), findsOneWidget);
    });

    testWidgets('header icons are present', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 900));
      final product = allProducts.firstWhere((p) => p.type == ProductType.portsmouthCityPostcard2);

      await tester.pumpWidget(createTestWidget(product));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
      expect(find.byIcon(Icons.menu), findsOneWidget);
    });

    testWidgets('add to cart button is tappable and does not crash', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 900));
      final product = allProducts.firstWhere((p) => p.type == ProductType.portsmouthCityPostcard2);

      await tester.pumpWidget(createTestWidget(product));
      await tester.pumpAndSettle();

      final Finder addToCart = find.text('Add to Cart');
      
      expect(addToCart, findsOneWidget);

      await tester.tap(addToCart);
      await tester.pumpAndSettle();

      expect(find.text('Cart page (test stub)'), findsOneWidget);
    });
  });
}
