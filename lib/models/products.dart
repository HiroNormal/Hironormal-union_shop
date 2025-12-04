enum ProductType {
  signatureTShirt,
  signatureHoodie,
  portsmouthMagnet1,
  placeholderProduct2,
  placeholderProduct3,
  placeholderProduct4,
}

class Product {
  final ProductType type;
  final String price;
  final String imageUrl;
  final String routeName;

  const Product({
    required this.type,
    required this.price,
    required this.imageUrl,
    required this.routeName,
  });

  String get name {
    switch (type) {
      case ProductType.signatureTShirt:
        return 'Signature T‑Shirt';
      case ProductType.signatureHoodie:
        return 'Signature Hoodie';
      case ProductType.portsmouthMagnet1:
        return 'Portsmouth City Magnet';
      case ProductType.placeholderProduct2:
        return 'Placeholder Product 2';
      case ProductType.placeholderProduct3:
        return 'Placeholder Product 3';
      case ProductType.placeholderProduct4:
        return 'Placeholder Product 4';
    }
  }


  /// returns the network image URL
  String get image => imageUrl;
}

const List<Product> allProducts = [
  Product(
    type: ProductType.signatureTShirt,
    price: '14.99',
    imageUrl:
        'https://shop.upsu.net/cdn/shop/files/Signature_T-Shirt_Indigo_Blue_2_1024x1024@2x.jpg?v=1758290534',
    routeName: '/sigtshirt',
  ),
  Product(
    type: ProductType.signatureHoodie,
    price: '£32.99',
    imageUrl:
        'https://shop.upsu.net/cdn/shop/files/SageHoodie_1024x1024@2x.png?v=1745583498',
    routeName: '/sighoodie',
  ),
  Product(
    type: ProductType.portsmouthMagnet1,
    price: '£10.00',
    imageUrl:
        'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
    routeName: '/product',
  ),
  Product(
    type: ProductType.placeholderProduct2,
    price: '£15.00',
    imageUrl:
        'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
    routeName: '/product',
  ),
  Product(
    type: ProductType.placeholderProduct3,
    price: '£20.00',
    imageUrl:
        'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
    routeName: '/product',
  ),
  Product(
    type: ProductType.placeholderProduct4,
    price: '£25.00',
    imageUrl:
        'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
    routeName: '/product',
  ),
];