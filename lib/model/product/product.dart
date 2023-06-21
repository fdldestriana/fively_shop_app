import 'package:hive/hive.dart';
part 'product.g.dart';

@HiveType(typeId: 1)
class Product {
  @HiveField(0)
  final String brand;
  @HiveField(1)
  final String creationDate;
  @HiveField(2)
  final List<dynamic> favorites;
  @HiveField(3)
  final String image;
  @HiveField(4)
  final String name;
  @HiveField(5)
  final bool popular;
  @HiveField(6)
  final int price;
  @HiveField(7)
  final String id;

  Product({
    required this.brand,
    required this.creationDate,
    required this.favorites,
    required this.image,
    required this.name,
    required this.popular,
    required this.price,
    required this.id,
  });

  static final empty = Product(
      brand: '',
      creationDate: '',
      favorites: [],
      image: '',
      name: '',
      popular: false,
      price: 0,
      id: '');

  factory Product.fromFirestore(Map<String, dynamic> snapshot) => Product(
      brand: snapshot['brand'],
      creationDate: snapshot['creationDate'],
      favorites: snapshot['favorites'],
      image: snapshot['image'],
      name: snapshot['name'],
      popular: snapshot['popular'],
      price: snapshot['price'],
      id: snapshot['id']);

  Map<String, dynamic> toJson() => {
        'brand': brand,
        'creationDate': creationDate,
        'favorites': favorites,
        'image': image,
        'name': name,
        'popular': popular,
        'price': price,
        'id': id
      };
}
