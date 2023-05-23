// ignore_for_file: prefer_const_constructors
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'addemp_page.dart';

class AddObraPage extends StatefulWidget {
  @override
  _AddObraPageState createState() => _AddObraPageState();
}

class _AddObraPageState extends State<AddObraPage> {
  final GlobalKey<FormState> _formKey_name = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey_start = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey_end = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey_description = GlobalKey<FormState>();

  String? name_insert;
  String? start_insert;
  String? end_insert;
  String? description_insert;

  TextEditingController dateinput_start = TextEditingController();
  TextEditingController dateinput_end = TextEditingController();
  @override
  void initState() {
    dateinput_start.text = "";
    dateinput_end.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Projeto'),
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
            Form(
                key: _formKey_name,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Digite o nome da obra',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (String? value) {
                          name_insert = value;
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor insira o nome da obra';
                          }
                          return null;
                        },
                      )
                    ])),
            SizedBox(height: 16),
            Text(
              'Data de Início',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Form(
                key: _formKey_start,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        controller: dateinput_start,
                        decoration: InputDecoration(
                          icon: Icon(Icons.calendar_today),
                          hintText: 'Insira a data de início',
                          border: OutlineInputBorder(),
                        ),
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2101));

                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('dd/MM/yyyy').format(pickedDate);
                            setState(() {
                              dateinput_start.text = formattedDate;
                            });
                          }
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor insira a data de início';
                          }
                          return null;
                        },
                      ),
                    ])),
            SizedBox(height: 16),
            Text(
              'Previsão de Término',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Form(
                key: _formKey_end,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        controller: dateinput_end,
                        decoration: InputDecoration(
                          icon: Icon(Icons.calendar_today),
                          hintText: 'Insira a previsão de término',
                          border: OutlineInputBorder(),
                        ),
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2101));

                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('dd/MM/yyyy').format(pickedDate);
                            setState(() {
                              dateinput_end.text = formattedDate;
                            });
                          }
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor insira a previsão de término';
                          }
                          return null;
                        },
                      ),
                    ])),
            SizedBox(height: 16),
            Text(
              'Descrição',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Form(
                key: _formKey_description,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Digite a descrição da obra',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (String? value) {
                          description_insert = value;
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor insira a descrição da obra';
                          }
                          return null;
                        },
                      )
                    ])),
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
