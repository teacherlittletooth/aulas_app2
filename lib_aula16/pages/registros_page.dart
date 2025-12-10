import 'package:api_flutter/pages/cep_page.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class RegistrosPage extends StatelessWidget {
  const RegistrosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (c) => CepPage()
                  )
                );
              },
              child: Text("Buscar CEP"))
        ],
        title: Text("Registros"),
      ),
      body: Center(
        child: FutureBuilder(
            future: DefaultAssetBundle.of(context).loadString("registros.json"),
            builder: ((context, snapshot) {
              var carrega = json.decode(snapshot.data.toString());

              return ListView.separated(
                itemCount: carrega.length,
                itemBuilder: (context, item) {
                  return ListTile(
                    leading: Icon(Icons.person),
                    title: Text(carrega[item]["nome"]),
                    subtitle: Text(carrega[item]["telefone"] +
                        "\n" +
                        carrega[item]["email"]),
                    isThreeLine: true,
                  );
                },
                separatorBuilder: (context, item) {
                  return Divider();
                },
              );
            })),
      ),
    );
  }
}
