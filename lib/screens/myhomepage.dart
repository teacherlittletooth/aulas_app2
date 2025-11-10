import 'package:aula6/widgets/mycard.dart';
import 'package:aula6/widgets/mydrawer.dart';
import 'package:aula6/widgets/mystory.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aula 6"),
        backgroundColor: Colors.greenAccent,
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, itens) {
                  return MyStory(title: "Carros");
                }
              ),
            ),

            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, itens) {
                  return MyCard(title: "Bicicletas", image: "", like: false);
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}