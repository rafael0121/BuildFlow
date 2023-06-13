// ignore_for_file: prefer_const_constructors

import 'package:buildflow/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Only_report_page extends StatefulWidget {
  const Only_report_page({Key? key}) : super(key: key);

  @override
  State<Only_report_page> createState() => _only_report_pageState();
}

class _only_report_pageState extends State<Only_report_page> {
  //Cria uma lista para o caminho das imagens
  List<String> imagePaths = [];

  @override
  Widget build(BuildContext context) {
    //Recebe os dados da obra selecionada vindo da página anterior
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final Map<dynamic, dynamic> relatorio = arguments["relatorio"];

    String text_description(String? description) {
      if (description == null) {
        return "";
      }
      return description;
    }

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Relatório"),
        ),
        body: ListView(
          padding: EdgeInsets.only(left: 40, right: 40),
          children: [
            SizedBox(height: 24),
            Text(
              'Data:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              relatorio['Data'],
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Divider(
              height: 24,
              color: Colors.black, // Cor da linha
              thickness: 1, // Espessura da linha
            ),
            Text("Situação Climática:",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: const Color.fromARGB(255, 2, 39, 70))),
            SizedBox(
              height: 16,
            ),
            Text(
              "Manhã " + relatorio['Clima'][0],
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "Tarde " + relatorio['Clima'][1],
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "Noite " + relatorio['Clima'][2],
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Divider(
              height: 24,
              color: Colors.black, // Cor da linha
              thickness: 1, // Espessura da linha
            ),
            Text("Localização: ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: const Color.fromARGB(255, 2, 39, 70))),
            Text(relatorio['Localizacao'],
                style: TextStyle(
                  fontSize: 18,
                )),
            SizedBox(
              height: 24,
            ),
            Divider(
              height: 24,
              color: Colors.black, // Cor da linha
              thickness: 1, // Espessura da linha
            ),
            Text("Descrição geral: ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: const Color.fromARGB(255, 2, 39, 70))),
            Text(text_description(relatorio['Descricao']),
                style: TextStyle(
                  fontSize: 18,
                )),
            SizedBox(
              height: 24,
            ),
            SizedBox(
              height: 24,
            ),
            Text("Fotos:",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: const Color.fromARGB(255, 2, 39, 70))),
            SizedBox(
              height: 18,
            ),
            Scrollbar(
                thumbVisibility: true,
                thickness: 5,
                radius: Radius.circular(10),
                trackVisibility: true,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 200,
                      enableInfiniteScroll: false,
                    ),
                    items: imagePaths.map((path) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Image.file(
                            File(path),
                            fit: BoxFit.cover,
                          );
                        },
                      );
                    }).toList(),
                  ),
                )),
            SizedBox(
              height: 24,
            ),
          ],
        ));
  }
}
