// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures

import 'package:buildflow/database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Addreport_page extends StatefulWidget {
  const Addreport_page({Key? key}) : super(key: key);
  @override
  State<Addreport_page> createState() => _addreport_pageState();
}

class _addreport_pageState extends State<Addreport_page> {
  var _icon0 = Icon(Icons.thunderstorm);
  var _icon1 = Icon(Icons.thunderstorm);
  var _icon2 = Icon(Icons.thunderstorm);
  Position? currentPosition;
  String currentTime = "Carregando...";
  List<String> imagePaths = [];
  var morning = "rainValue";
  var noon = "rainValue";
  var night = "rainvalue";
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
    getCurrentTime();
  }

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

  Future<void> getCurrentLocation() async {
    final permissionStatus = await Permission.location.request();
    if (permissionStatus.isGranted) {
      try {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        setState(() {
          currentPosition = position;
        });
      } catch (e) {
        print('Erro ao obter a localização: $e');
      }
    } else {
      Navigator.pop(context);
    }
  }

  void getCurrentTime() {
    DateTime dataAtual = DateTime.now();
    String time = DateFormat('dd/MM/yyyy HH:mm:ss').format(dataAtual);
    setState(() {
      currentTime = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> _items = [
      {
        'value': 'clearValue',
        'label': 'Limpo',
      },
      {
        'value': 'cloudyValue',
        'label': 'Nublado',
      },
      {
        'value': 'rainValue',
        'label': 'Chuvoso',
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
              'Projeto:',
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
            Divider(
              height: 24,
              color: Colors.black, // Cor da linha
              thickness: 1, // Espessura da linha
            ),
            Text(
              'Data de Inspeção:',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              currentTime,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            TextButton.icon(
                onPressed: () {
                  getCurrentTime();
                },
                icon: Icon(Icons.schedule),
                label: Text('Atualizar')),
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
                noon = val;
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
                night = val;
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
              height: 24,
            ),
            Divider(
              height: 24,
              color: Colors.black, // Cor da linha
              thickness: 1, // Espessura da linha
            ),
            Text("Localização:",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: const Color.fromARGB(255, 2, 39, 70))),
            SizedBox(
              height: 16,
            ),
            Builder(
              builder: (context) {
                if (currentPosition == null) {
                  return Text('Pegando localização...',
                      style: TextStyle(fontSize: 16, color: Colors.red));
                } else {
                  return Text('Localização Encontrada : \n$currentPosition',
                      style: TextStyle(fontSize: 16, color: Colors.green));
                }
              },
            ),
            TextButton.icon(
                onPressed: () {
                  setState(() {
                    currentPosition = null;
                  });
                  getCurrentLocation();
                },
                icon: Icon(Icons.location_on),
                label: Text('Atualizar')),
            Divider(
              height: 24,
              color: Colors.black, // Cor da linha
              thickness: 1, // Espessura da linha
            ),
            Text("Descrição geral:",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: const Color.fromARGB(255, 2, 39, 70))),
            SizedBox(
              height: 16,
            ),
            TextField(
              controller: _controller,
              maxLines: 10,
              maxLength: 500,
              decoration: InputDecoration(
                hintText: 'Digite aqui...',
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Text("Anexar fotos:",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: const Color.fromARGB(255, 2, 39, 70))),
            SizedBox(
              height: 18,
            ),
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
            TextButton.icon(
                onPressed: () {
                  Map<String, dynamic> report = {
                    "Projeto": project_name,
                    "Data": currentTime,
                    "Clima": [morning, noon, night],
                    "Localizacao": currentPosition.toString(),
                    "Descricao": _controller.text,
                  };
                  add_report(report, imagePaths);

                  Navigator.pop(context);
                },
                icon: Icon(Icons.send),
                label: Text("Salvar Relatório"))
          ],
        ));
  }
}
