// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:fively/core.dart';

// class ProductRepository {
//   Future<List<Product>> getProducts() async {
//     Future<QuerySnapshot<Map<String, dynamic>>> collectionRef =
//         FirebaseFirestore.instance.collection('products').get();

//     List<Product> list = await collectionRef.then((products) => products.docs
//         .map((e) => Product.fromFirestore(e as Map<String, dynamic>))
//         .toList());
//     return list;
//   }
// }
