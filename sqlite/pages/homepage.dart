import 'package:aula15/model/database.dart';
import 'package:aula15/model/product.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();

  int? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
