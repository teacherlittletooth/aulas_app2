import 'package:flutter/material.dart';
import 'package:form_flutter/widgets/my_button.dart';
import 'package:form_flutter/widgets/my_checkbox.dart';
import 'package:form_flutter/widgets/my_radio.dart';
import 'package:form_flutter/widgets/my_slider.dart';
import 'package:form_flutter/widgets/my_switch.dart';
import 'package:form_flutter/widgets/my_text_field.dart';
import 'package:form_flutter/widgets/my_title.dart';
import 'package:google_fonts/google_fonts.dart';

class FormPage extends StatelessWidget {
  const FormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Formulário Flutter",
          style: GoogleFonts.uchen(),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

              MyTitle(title: "Dados pessoais"),

              SizedBox(
                width: double.infinity,
                child: MyTextField(title: "Nome"),
              ),

              SizedBox(height: 15),

              SizedBox(
                width: double.infinity,
                child: MyTextField(title: "Data de nascimento"),
              ),

              SizedBox(height: 15),

              MyTitle(title: "Gênero"),

              SizedBox(height: 15),

              Row(
                  //mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    MyRadio(title: "Masculino"),
                    MyRadio(title: "Feminino")
                  ],
              ),

              SizedBox(height: 15),

              MyTitle(title: "Preferências"),

              SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  MyCheckbox(title: "Música"),
                  MyCheckbox(title: "Esportes"),
                  MyCheckbox(title: "Filmes e séries"),
                  MyCheckbox(title: "Culinária"),
                ],
              ),

              SizedBox(height: 15),

              MyTitle(title: "Escolaridade"),

              SizedBox(height: 15),

              MySlider(),

              SizedBox(height: 15),

              MySwitch(title: "Deseja receber notificações?"),

              SizedBox(height: 15),

              MyButton(title: "Salvar", icon: Icons.save)

            ],
          ),
        ),
      ),
    );
  }
}