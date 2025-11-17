import 'package:aula6/model/profile.dart';
import 'package:aula6/widgets/mybottomnavigation.dart';
import 'package:aula6/widgets/mycard.dart';
import 'package:aula6/widgets/mydrawer.dart';
import 'package:aula6/widgets/mystory.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  //Criando lista de dados
  final List<Profile> listaDados = [
    Profile(
      name: "Ronaldinho",
      image: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Ronaldinho_11feb2007.jpg/250px-Ronaldinho_11feb2007.jpg",
      like: true,
    ),
    Profile(
      name: "Xandão de Morael",
      image: "https://ichef.bbci.co.uk/ace/ws/640/cpsprodpb/3b7c/live/fbca8d10-7c32-11f0-83cc-c5da98c419b8.jpg.webp",
      like: false
    ),
    Profile(name: "Paulo", image: "", like: true),
    Profile(name: "Homer", image: "", like: false),
    Profile(name: "Augusta", image: "", like: true),
  ];

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aula 6"),
        backgroundColor: Colors.greenAccent,
      ),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listaDados.length,
                itemBuilder: (context, item) {
                  return MyStory(
                    title: listaDados[item].name,
                    image: listaDados[item].image,
                  );
                },
              ),
            ),

            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listaDados.length,
                itemBuilder: (context, item) {
                  return MyCard(
                    title: listaDados[item].name,
                    image: listaDados[item].image,
                    like: listaDados[item].like,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavigation(),
    );
  }
}
