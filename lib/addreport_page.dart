// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:select_form_field/select_form_field.dart';

class Addreport_page extends StatefulWidget {
  const Addreport_page({Key? key}) : super(key: key);
  @override
  State<Addreport_page> createState() => _addreport_pageState();
}

class _addreport_pageState extends State<Addreport_page> {
  var _icon0 = Icon(Icons.thunderstorm);
  var _icon1 = Icon(Icons.thunderstorm);
  var _icon2 = Icon(Icons.thunderstorm);
  @override
  Widget build(BuildContext) {
    String currentTime() {
      DateTime dataAtual = DateTime.now();
      String formatData = DateFormat('dd/MM/yyyy').format(dataAtual);
      return formatData;
    }

    final List<Map<String, dynamic>> _items = [
      {
        'value': 'clearValue',
        'label': 'Limpo',
        'icon': Icon(Icons.sunny),
      },
      {
        'value': 'cloudyValue',
        'label': 'Nublado',
        'icon': Icon(Icons.cloud),
      },
      {
        'value': 'rainValue',
        'label': 'Chuvoso',
        'icon': Icon(Icons.thunderstorm),
      },
    ];

    String project_name = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Gerar Relatório"),
        ),
        body: ListView(
          padding: EdgeInsets.only(left: 40, right: 40),
          children: [
            SizedBox(height: 24),
            Text(
              'Projeto',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              project_name,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Data de Inspeção',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              currentTime(),
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 24),
            Divider(
              color: Colors.deepOrange, // Cor da linha
              height: 20, // Altura da linha
              thickness: 10, // Espessura da linha
            ),
            SizedBox(
              height: 24,
            ),
            Text("Situação Climática",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: const Color.fromARGB(255, 2, 39, 70))),
            SizedBox(
              height: 16,
            ),
            SelectFormField(
                type: SelectFormFieldType.dropdown, // or can be dialog
                initialValue: 'rainValue',
                labelText: 'Manhã',
                icon: _icon0,
                items: _items,
                onChanged: (val) {
                  setState(() {
                    switch (val) {
                      case "clearValue":
                        _icon0 = Icon(Icons.sunny);
                        break;
                      case "rainValue":
                        _icon0 = Icon(Icons.thunderstorm);
                        break;
                      case "cloudyValue":
                        _icon0 = Icon(Icons.cloud);
                        break;
                    }
                  });
                }),
            SizedBox(
              height: 12,
            ),
            SelectFormField(
              type: SelectFormFieldType.dropdown, // or can be dialog
              initialValue: 'rainValue',
              labelText: 'Tarde',
              icon: _icon1,
              items: _items,
              onChanged: (val) {
                setState(() {
                  switch (val) {
                    case "clearValue":
                      _icon1 = Icon(Icons.sunny);
                      break;
                    case "rainValue":
                      _icon1 = Icon(Icons.thunderstorm);
                      break;
                    case "cloudyValue":
                      _icon1 = Icon(Icons.cloud);
                      break;
                  }
                });
              },
            ),
            SizedBox(
              height: 12,
            ),
            SelectFormField(
              type: SelectFormFieldType.dropdown, // or can be dialog
              initialValue: 'rainValue',
              labelText: 'Noite',
              icon: _icon2,
              items: _items,
              onChanged: (val) {
                setState(() {
                  switch (val) {
                    case "clearValue":
                      _icon2 = Icon(Icons.nightlight_round);
                      break;
                    case "rainValue":
                      _icon2 = Icon(Icons.thunderstorm);
                      break;
                    case "cloudyValue":
                      _icon2 = Icon(Icons.cloud);
                      break;
                  }
                });
              },
            ),
            SizedBox(
              height: 12,
            ),
          ],
        ));
  }
}
