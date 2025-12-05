enum ProductType {
  signatureTShirt,
  signatureHoodie,
  portsmouthMagnet1,
  portsmouthCityPostcard2,
  portsmouthCityBookmark3,
  portsmouthCityNotebook4,
}

class Product {
  final ProductType type;
  final String price;
  final String imageUrl;
  final String routeName;
  final String description;

  const Product({
    required this.type,
    required this.price,
    required this.imageUrl,
    required this.routeName,
    required this.description,
  });

  String get name {
    switch (type) {
      case ProductType.signatureTShirt:
        return 'Signature T‑Shirt';
      case ProductType.signatureHoodie:
        return 'Signature Hoodie';
      case ProductType.portsmouthMagnet1:
        return 'Portsmouth City Magnet';
      case ProductType.portsmouthCityPostcard2:
        return 'Portsmouth City Postcard';
      case ProductType.portsmouthCityBookmark3:
        return 'Portsmouth City Bookmark ';
      case ProductType.portsmouthCityNotebook4:
        return 'Portsmouth City Notebook ';
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
    description:
        '''Our Signature T-shirts combine everyday comfort with premium detail. 
        Featuring high-quality embroidery and a relaxed fit, they offer a fresh take on a staple piece. 
        Lightweight and versatile, this tee is perfect for layering or wearing solo - an essential addition to any wardrobe.''',
  ),
  Product(
    type: ProductType.signatureHoodie,
    price: '£32.99',
    imageUrl:
        'https://shop.upsu.net/cdn/shop/files/SageHoodie_1024x1024@2x.png?v=1745583498',
    routeName: '/sighoodie',
        description:
            '''Crafted for comfort, elevated with detail — our Signature hoodies feature premium embroidery that sets them apart from our classic range.
               With a clean design and an oversized fit, they bring a refined edge to a classic silhouette. 
               Whether you're layering up or keeping it simple, this is your new go-to for effortless style.''',
  ),
  Product(
    type: ProductType.portsmouthMagnet1,
    price: '£10.00',
    imageUrl:
        'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
    routeName: '/product',
    description:
        ''' Bring a bit of Portsmouth pride to your fridge, locker, or pinboard with our eye-catching Portsmouth City Magnet, 
            featuring the artwork of renowned illustrator Julia Gash.
            Part of our Portsmouth City Collection, this magnet showcases Julia’s iconic hand-drawn design, celebrating the city’s most loved landmarks and seaside charm in her signature playful style.  
            Made from durable tin plate, it's both lightweight and long-lasting - a perfect souvenir or small gift with a big personality. ''',
  ),
  Product(
    type: ProductType.portsmouthCityPostcard2,
    price: '£15.00',
    imageUrl:
        'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
    routeName: '/product',
    description:
        'Celebrate the charm of our coastal city with this beautifully illustrated Portsmouth City Postcard, designed by British artist Julia Gash.',
  ),
  Product(
    type: ProductType.portsmouthCityBookmark3,
    price: '£20.00',
    imageUrl:
        'https://shop.upsu.net/cdn/shop/files/PortsmouthCityBookmark1_1024x1024@2x.jpg?v=1752230004',
    routeName: '/product',
    description:
        'Add a touch of local charm to your reading with this beautifully illustrated Portsmouth City Bookmark, designed by British artist Julia Gash.',
  ),
  Product(
    type: ProductType.portsmouthCityNotebook4,
    price: '£25.00',
    imageUrl:
        'https://shop.upsu.net/cdn/shop/files/PortsmouthCityNotebook_1024x1024@2x.jpg?v=1757419215',
    routeName: '/product',
    description:
        'Jot down your thoughts, sketches, or seaside daydreams with our charming Portsmouth City Notebook, featuring the artwork of renowned illustrator Julia Gash.',
  ),
];