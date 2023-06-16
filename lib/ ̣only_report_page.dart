// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'database.dart';

class Only_report_page extends StatefulWidget {
  const Only_report_page({Key? key}) : super(key: key);

  @override
  State<Only_report_page> createState() => _only_report_pageState();
}

class _only_report_pageState extends State<Only_report_page> {
  //Cria uma lista para o caminho das imagens
  //List<String> imagePaths = [];

  String translate_text(String val) {
    switch (val) {
      case "rainValue":
        return "Chuvoso";
      case "clearValue":
        return "Limpo";
      case "cloudValue":
        return "Nublado";
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    //Recebe os dados da obra selecionada vindo da página anterior
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final Map<dynamic, dynamic> relatorio = arguments["relatorio"];

    var imagesByte = get_image(relatorio["Id"]);

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
          actions: [
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Excluir Projeto'),
                      content: Text(
                          'Tem certeza de que deseja excluir este projeto?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            delete_report(relatorio["Id"]);
                            Navigator.popUntil(context,
                                ModalRoute.withName("/home/build/report"));
                          },
                          child: Text('Sim'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context, false);
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
              "Manhã: " + translate_text(relatorio['Clima'][0]),
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "Tarde: " + translate_text(relatorio['Clima'][1]),
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "Noite: " + translate_text(relatorio['Clima'][2]),
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
            FutureBuilder(
                future: imagesByte,
                builder: (BuildContext context, snapshot) {
                  if (snapshot.hasData) {
                    return Scrollbar(
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
                            items: snapshot.data!.map((image) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Image.memory(
                                    image!,
                                    fit: BoxFit.cover,
                                  );
                                },
                              );
                            }).toList(),
                          ),
                        ));
                  } else {
                    return Text("Error");
                  }
                }),
            SizedBox(
              height: 24,
            ),
          ],
        ));
  }
}
