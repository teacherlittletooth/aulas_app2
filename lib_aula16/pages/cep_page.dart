import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as Http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _pesquisa = TextEditingController();
  String _cepRecebido = "";

  _consultarCep() async {
    _cepRecebido = "";
    String busca = "https://viacep.com.br/ws/${_pesquisa.text}/json/";

    try {
      Http.Response resposta = await Http.get(Uri.parse(busca));
      Map site = json.decode(resposta.body);

      print(resposta.body);

        _cepRecebido += site["logradouro"] + "\n";
        _cepRecebido += site["bairro"] + "\n";
        _cepRecebido += site["localidade"] + "\n";
        _cepRecebido += site["estado"];
    } catch(e) {
        _cepRecebido = "Erro na pesquisa";
    }
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consulta CEP"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
                child: Text(
                  "Digite o cep\n(somente números)",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                )
            ),

            SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: TextField(
                  controller: _pesquisa,
                  decoration: InputDecoration(
                    label: Text("CEP")
                  ),
                )
            ),

            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: ElevatedButton(
                  onPressed: _consultarCep,
                  child: Text("Consultar")
              ),
            ),

            Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 180, 200, 235),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(_cepRecebido)
            )
          ],
        ),
      ),
    );
  }
}
