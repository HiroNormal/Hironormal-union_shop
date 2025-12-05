import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';

void main() {
  group('Home Page Tests', () {
    testWidgets('should display home page with basic elements', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      expect(find.text('Essentiial Range - Over 20% OFF!'), findsOneWidget);
      expect(find.text('BROWSE COLLECTION'), findsOneWidget);
    });

    testWidgets('should display product cards', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      expect(find.text('Signature T‑Shirt'), findsOneWidget);
      expect(find.text('Signature Hoodie'), findsOneWidget);

      
      expect(find.textContaining('Portsmouth City Magnet'), findsOneWidget);
      expect(find.textContaining('Portsmouth City Postcard'), findsOneWidget);
      expect(find.textContaining('Portsmouth City Bookmark'), findsOneWidget);
      expect(find.textContaining('Portsmouth City Notebook'), findsOneWidget);

      
      expect(find.text('£14.99'), findsOneWidget);
      expect(find.text('£32.99'), findsOneWidget);
      expect(find.text('£10.00'), findsOneWidget);
      expect(find.text('£15.00'), findsOneWidget);
      expect(find.text('£20.00'), findsOneWidget);
      expect(find.text('£25.00'), findsOneWidget);
    });
    
  
  });
}
