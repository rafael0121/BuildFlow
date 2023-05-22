import 'package:flutter/material.dart';
import 'addemp_page.dart';

class AddObraPage extends StatefulWidget {
  @override
  _AddObraPageState createState() => _AddObraPageState();
}

class _AddObraPageState extends State<AddObraPage> {
  String nome = '';
  String dataInicio = '';
  String previsaoTermino = '';
  String objetivos = '';
  String epocaAno = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Obra'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nome da Obra',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Digite o nome da obra',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  nome = value;
                });
              },
            ),
            SizedBox(height: 16),
            Text(
              'Data de Início',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Digite a data de início',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  dataInicio = value;
                });
              },
            ),
            SizedBox(height: 16),
            Text(
              'Previsão de Término',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Digite a previsão de término',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  previsaoTermino = value;
                });
              },
            ),
            SizedBox(height: 16),
            Text(
              'Objetivos',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Digite os objetivos da obra',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  objetivos = value;
                });
              },
            ),
            SizedBox(height: 16),
            Text(
              'Época do Ano',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Digite a época do ano da obra',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  epocaAno = value;
                });
              },
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddFuncionarioPage(),
            ),
          );
        },
        child: Icon(Icons.arrow_forward),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

