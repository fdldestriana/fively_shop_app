import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fively/core.dart';

class ProductRepository {
  Future<List<Product>> getProductsFirestore() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('products').get();
    try {
      return snapshot.docs
          .map((e) => e.data())
          .map((e) => Product.fromFirestore(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
