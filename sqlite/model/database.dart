import 'dart:io';
import 'package:aula15/model/product.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "products.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
            CREATE TABLE products (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              name TEXT NOT NULL
            )
          ''');
      },
    );
  }

  //Listar produtos
  Future<List<Product>> getProducts() async {
    Database db = await instance.database;
    var products = await db.query("products", orderBy: "id");

    List<Product> prodList = products.isNotEmpty
        ? products.map((p) => Product.fromMap(p)).toList()
        : [];

    return prodList;
  }

  //Salvar produto
  Future<int> addProduct(Product p) async {
    Database db = await instance.database;
    return await db.insert("products", p.toMap());
  }

  Future<int> removeProduct(int id) async {
    Database db = await instance.database;
    return await db.delete("products", where: "id = ?", whereArgs: [id]);
  }

  Future<int> updateProduct(Product p) async {
    Database db = await instance.database;
    return await db.update(
      "products",
      p.toMap(),
      where: "id = ?",
      whereArgs: [p.id],
    );
  }
}