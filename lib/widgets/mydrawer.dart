import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: MediaQuery.of(context).size.width * 0.5,
        backgroundColor: Colors.green,
        elevation: 20,
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 30, bottom: 30, left: 5),
              child: Text(
                        "Bem vindo!",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                      ),
            ),
            Divider(color: Colors.white),
            ListTile(
              iconColor: Colors.white,
              textColor: Colors.white,
              leading: Icon(Icons.mail),
              title: Text("Contato"),
            ),
            ListTile(
              iconColor: Colors.white,
              textColor: Colors.white,
              leading: Icon(Icons.settings),
              title: Text("Preferências"),
            ),
          ],
        ),
      );
  }
}