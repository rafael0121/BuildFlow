// ignore_for_file: prefer_const_constructors

import 'package:buildflow/database.dart';
import 'package:flutter/material.dart';

class Build_page extends StatefulWidget {
  const Build_page({Key? key}) : super(key: key);

  @override
  State<Build_page> createState() => _Build_pageState();
}

class _Build_pageState extends State<Build_page> {
  //Cria uma lista para o caminho das imagens
  List<String> imagePaths = [];

  @override
  Widget build(BuildContext context) {
    //Recebe os dados da obra selecionada vindo da página anterior
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final Map<dynamic, dynamic> projeto = arguments["projeto"];

    return Scaffold(
      appBar: AppBar(
        title: Text('Informação da obra'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Excluir Projeto'),
                    content:
                        Text('Tem certeza de que deseja excluir este projeto?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          delete_build(projeto);
                          Navigator.popUntil(
                              context,
                              ModalRoute.withName(
                                  "/home")); 
                        },
                        child: Text('Sim'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context,
                              false); 
                        },
                        child: Text('Não'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nome da Obra:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                projeto["Nome"],
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Data de Início:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                projeto["Data_inicio"],
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Previsão de Término:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                projeto["Data_termino"],
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 32),
              Text(
                'Descrição:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                projeto["Descricao"],
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Center(
                child: TextButton.icon(
                  label: Text("Relatórios"),
                  onPressed: () {
                    Navigator.pushNamed(context, "/home/build/report",
                        arguments: arguments);
                  },
                  icon: Icon(Icons.description),
                ),
              ),
              
            ],
          )),
    );
  }
}
