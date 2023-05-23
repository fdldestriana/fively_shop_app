class Product {
  final String brand;
  final String creationDate;
  final List<dynamic> favorites;
  final String image;
  final String name;
  final bool popular;
  final int price;

  Product({
    required this.brand,
    required this.creationDate,
    required this.favorites,
    required this.image,
    required this.name,
    required this.popular,
    required this.price,
  });

  static final empty = Product(
      brand: '',
      creationDate: '',
      favorites: [],
      image: '',
      name: '',
      popular: false,
      price: 0);

  factory Product.fromFirestore(Map<String, dynamic> snapshot) => Product(
      brand: snapshot['brand'],
      creationDate: snapshot['creationDate'],
      favorites: snapshot['favorites'],
      image: snapshot['image'],
      name: snapshot['name'],
      popular: snapshot['popular'],
      price: snapshot['price']);

  Map<String, dynamic> toJson() => {
        'brand': brand,
        'creationDate': creationDate,
        'favorites': favorites,
        'image': image,
        'name': name,
        'popular': popular,
        'price': price
      };
}
