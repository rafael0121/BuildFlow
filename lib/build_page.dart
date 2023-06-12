// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
    final String login = arguments["login"];
    final Map<dynamic, dynamic> projeto = arguments["projeto"];

    Future<void> _capturePhoto() async {
      final picker = ImagePicker();
      final pickedFile = await picker.getImage(source: ImageSource.camera);

      if (pickedFile != null) {
        setState(() {
          imagePaths.add(pickedFile.path);
        });
      }
    }

    Future<void> _pickImage() async {
      final picker = ImagePicker();
      final pickedFile = await picker.getImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          imagePaths.add(pickedFile.path);
        });
      }
    }

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
              SizedBox(height: 16),
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
                      _capturePhoto();
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.photo_library),
                    onPressed: () {
                      _pickImage();
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
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
              SizedBox(height: 16),
            ],
          )),
    );
  }
}
