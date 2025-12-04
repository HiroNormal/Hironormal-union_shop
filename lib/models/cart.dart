import 'products.dart';

class Cart {
  final Map<Product, int> _items = {}; //storage 

  Map<Product, int> get items => Map.unmodifiable(_items); //shows a copy of items

  void add(Product product, {int quantity = 1}) {
    if (quantity <= 0) return;

    final current = _items[product];
    if (current != null) {
      _items[product] = current + quantity;
    } else {
      _items[product] = quantity;
    }
  }

  void remove(Product product, {int quantity = 1}) {
    if (!_items.containsKey(product) || quantity <= 0) return;
    final current = _items[product]!;
    if (current > quantity) {
      _items[product] = current - quantity;
    } else {
      _items.remove(product);
    }
  }

  void updateQuantity(Product product, int quantity) {
    if (quantity <= 0) {
      _items.remove(product);
    } else {
      _items[product] = quantity;
    }
  }

  void clear() => _items.clear();

  double _parsePrice(String price) {
    final cleaned = price.replaceAll(RegExp(r'[^\d\.\-]'), '');
    return double.tryParse(cleaned) ?? 0.0;
  } //removes the signs so it can do calculations

  double get totalPrice {
    double total = 0.0;
    _items.forEach((product, qty) {
      total += _parsePrice(product.price) * qty;
    });
    return total;
  }

  bool get isEmpty => _items.isEmpty;
  int get length => _items.length;

  int get countOfItems {
    int total = 0;
    _items.forEach((_, qty) => total += qty);
    return total;
  }

  int getQuantity(Product product) => _items[product] ?? 0;

}