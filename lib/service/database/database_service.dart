import 'package:fively/model/item_cart/item_cart.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;

class DatabaseService {
  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDatabase();
    return null;
  }

  initDatabase() async {
    io.Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'cart_database.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE cart(id INTEGER PRIMARY KEY, name TEXT, image TEXT, color TEXT, size TEXT, amount INTEGER, price INTEGER )');
  }

  Future<ItemCart> insertItemCart(ItemCart itemCart) async {
    var dbClient = await database;
    await dbClient!.insert('cart', itemCart.toMap());
    return itemCart;
  }

  Future<List<ItemCart>> getItemCartList() async {
    var dbClient = await database;
    final List<Map<String, Object?>> queryResult =
        await dbClient!.query('cart');
    return queryResult.map((e) => ItemCart.fromDatabase(e)).toList();
  }

  // Future<int> updateAmount(ItemCart itemCart) async {
  //   var dbClient = await database;
  //    await dbClient!.update('cart', itemCart.amount,where: )
  // }
  Future<int> deleteItemCart(String id) async {
    var dbClient = await database;
    return await dbClient!.delete('cart', where: 'id = ?', whereArgs: [id]);
  }
}
