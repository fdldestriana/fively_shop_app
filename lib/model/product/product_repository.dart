// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:fively/core.dart';

// class ProductRepository {
//   CollectionReference productsRef = FirebaseFirestore.instance
//       .collection('products')
//       .withConverter<Product>(
//           fromFirestore: (snapshot, _) =>
//               Product.fromFirestore(snapshot.data()!),
//           toFirestore: (product, _) => product.toJson());

//   Future<void> getProduct() async {
//     List<QueryDocumentSnapshot<Object?>> products =
//         await productsRef.get().then((value) => value.docs);
//   }
// }
