import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fively/core.dart';

class ProductRepository {
  List<Product> productsFirestore = [];
  Future<List<Product>> getProductsFirestore() async {
    if (productsFirestore.isNotEmpty) {
      return productsFirestore;
    }

    QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('products').get();
    try {
      print('>>>>>>>>>>> called <<<<<<<<<<');
      productsFirestore = snapshot.docs
          .map((e) => e.data())
          .map((e) => Product.fromFirestore(e))
          .toList();
    } catch (e) {
      rethrow;
    }
    return productsFirestore;
  }
}
