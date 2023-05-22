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
              obraNome,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Data de Início:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              dataInicio,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Data de Término:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              dataTermino,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 32),
            Text(
              'Relatório:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextFormField(
              initialValue: relatorio,
              maxLines: null,
              decoration: InputDecoration(
                hintText: 'Digite o relatório da obra...',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  relatorio = value;
                });
              },
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
                IconButton(
                  icon: Icon(Icons.camera_alt),
                  onPressed: () {
                    // Lógica para adicionar foto da câmera
                  },
                ),
                IconButton(
                  icon: Icon(Icons.photo_library),
                  onPressed: () {
                    // Lógica para adicionar foto da galeria
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
