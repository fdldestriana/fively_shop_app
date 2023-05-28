class ItemCart {
  final String id;
  final String name;
  final String image;
  final String color;
  final String size;
  final int amount;
  final double price;

  ItemCart(
      {required this.id,
      required this.name,
      required this.image,
      required this.color,
      required this.size,
      required this.amount,
      required this.price});

  factory ItemCart.fromDatabase(Map<String, dynamic> database) => ItemCart(
      id: database['id'],
      name: database['name'],
      image: database['image'],
      color: database['color'],
      size: database['size'],
      amount: database['amount'],
      price: database['price']);

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'image': image,
        'color': color,
        'size': size,
        'amount': amount,
        'price': price
      };
}
