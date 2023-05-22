import 'package:flutter/material.dart';

class EditObraPage extends StatefulWidget {
  final Obra obra;

  EditObraPage({required this.obra});

  @override
  _EditObraPageState createState() => _EditObraPageState();
}

class _EditObraPageState extends State<EditObraPage> {
  late TextEditingController _nomeController;
  late TextEditingController _dataInicioController;
  late TextEditingController _dataTerminoController;

  @override
  void initState() {
    super.initState();
    _nomeController = TextEditingController(text: widget.obra.nome);
    _dataInicioController = TextEditingController();
    _dataTerminoController = TextEditingController();
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _dataInicioController.dispose();
    _dataTerminoController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    // Salvar as alterações feitas na obra
    String nome = _nomeController.text;
    String dataInicio = _dataInicioController.text;
    String dataTermino = _dataTerminoController.text;

    // Atualizar os valores da obra
    widget.obra.nome = nome;
    widget.obra.dataInicio = dataInicio;
    widget.obra.dataTermino = dataTermino;

    // Voltar para a página anterior
    Navigator.pop(context);
  }

  void _deleteFoto(int index) {
    // Remover a foto da obra pelo índice
    setState(() {
      widget.obra.fotos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Obra'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _nomeController,
              decoration: InputDecoration(
                labelText: 'Nome da Obra',
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _dataInicioController,
              decoration: InputDecoration(
                labelText: 'Data de Início',
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _dataTerminoController,
              decoration: InputDecoration(
                labelText: 'Data de Término',
              ),
            ),
            SizedBox(height: 32.0),
            Text(
              'Fotos da Obra:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.obra.fotos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.asset(widget.obra.fotos[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _deleteFoto(index);
                    },
                  ),
                );
              },
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: _saveChanges,
              child: Text('Salvar Alterações'),
            ),
          ],
        ),
      ),
    );
  }
}

class Obra {
  String nome;
  String dataInicio;
  String dataTermino;
  List<String> fotos;

  Obra({
    required this.nome,
    required this.dataInicio,
    required this.dataTermino,
    required this.fotos,
  });
}
