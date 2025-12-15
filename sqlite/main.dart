import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final TextEditingController _controller = TextEditingController();
  int? selectedItem;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: TextField(controller: _controller)),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: () async {
            print(_controller.text);

              selectedItem != null
                  ? await DatabaseHelper.instance.updateProduct(
                      Product(id: selectedItem, name: _controller.text),
                    )
                  : await DatabaseHelper.instance.addProduct(
                      Product(name: _controller.text),
                  );

            setState(() {
              selectedItem = null;
              _controller.clear();
            });
          },
        ),
        body: FutureBuilder(
          future: DatabaseHelper.instance.getProducts(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: Text("Carregando..."));
            }
            return snapshot.data!.isEmpty
                ? Center(child: Text("Não há produtos na lista"))
                : ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, i) {
                      return ListTile(
                        leading: Text(snapshot.data![i].id.toString()),
                        title: Text(snapshot.data![i].name!),
                        onLongPress: () {
                          setState(() {
                            DatabaseHelper.instance.removeProduct(
                              snapshot.data![i].id!,
                            );
                          });
                        },
                        onTap: () {
                          setState(() {
                            selectedItem = snapshot.data![i].id!;
                            _controller.text = snapshot.data![i].name!;
                          });
                        },
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}

/////////////////////////////////////////////////////////////
class Product {
  final int? id;
  final String? name;

  Product({this.id, required this.name});

  factory Product.fromMap(Map<String, dynamic> dataMap) {
    return Product(id: dataMap["id"], name: dataMap["name"]);
  }

  Map<String, dynamic> toMap() {
    return {"id": id, "name": name};
  }
}

//////////////////////////////////////////////////////

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
