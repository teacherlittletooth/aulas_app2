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