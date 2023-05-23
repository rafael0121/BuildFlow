// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Construction_page extends StatefulWidget {
  const Construction_page({Key? key}) : super(key: key);

  @override
  State<Construction_page> createState() => _Construction_pageState();
}

class _Construction_pageState extends State<Construction_page> {
  String obraNome = 'Nome da Obra';
  String dataInicio = '01/01/2022';
  String dataTermino = '31/12/2022';
  String relatorio = '';

  @override
  Widget build(BuildContext context) {
    final Map<dynamic, dynamic> projeto = ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text('Informação da obra'),
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
            SizedBox(height: 32),
            Text(
              'Fotos:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 SizedBox(
                    width: 300, // Defina a largura desejada
                    height: 300, // Defina a altura desejada
                    child:Image.network(projeto["Imagem"])
                    ),
                  ]
              
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
