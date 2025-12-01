import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/product_page.dart';

void main() {
  Widget createTestWidget() {
    return const MaterialApp(home: ProductPage());
  }

  group('ProductPage widget tests', () {
    testWidgets('basic elements are displayed', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('PLACEHOLDER HEADER TEXT'), findsOneWidget);
      expect(find.text('Placeholder Product Name'), findsOneWidget);
      expect(find.text('£15.00'), findsOneWidget);
      expect(find.textContaining('Celebrate the charm'), findsOneWidget);
      expect(find.text('Add to Cart'), findsOneWidget);
    });

    testWidgets('quantity controls update displayed quantity', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
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

      // tap remove -> 0 (allowed by current implementation)
      await tester.tap(removeButton);
      await tester.pumpAndSettle();
      expect(find.text('0'), findsOneWidget);
    });

    testWidgets('header icons are present', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
      expect(find.byIcon(Icons.menu), findsOneWidget);
    });

    testWidgets('add to cart button is tappable and does not crash', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      final Finder addToCart = find.text('Add to Cart');
      expect(addToCart, findsOneWidget);

      await tester.tap(addToCart);
      await tester.pumpAndSettle();

      // button should still be present (no navigation / crash)
      expect(addToCart, findsOneWidget);
    });
  });
}
