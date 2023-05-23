import 'dart:core';

import 'package:buildflow/database.dart';
import 'package:flutter/material.dart';
import 'addbuild_page.dart';
import 'construction_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var obras = get_build();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.logout),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(child: Text('Minhas Obras')),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/home/settings');
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Map<dynamic, dynamic>?>?>(
        future: obras,
        builder: (context, snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: SizedBox(
                    width: 80, // Defina a largura desejada
                    height: 80, // Defina a altura desejada
                    child: Image.network(snapshot.data?[index]?["Imagem"]
                     ,
                      fit: BoxFit
                          .cover, // Ajusta a imagem para preencher o espaço definido
                    ),
                  ),
                  title: InkWell(
                    onTap: () {
                      // Ação quando o título da obra for clicado
                      Navigator.pushNamed(context, '/home/construction');
                    },
                    child: Text(snapshot.data?[index]?["Nome"]),
                  ),
                  trailing: Wrap(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            //obras.removeAt(index);
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            children = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              ),
            ];
          } else {
            children = const <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              ),
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),

      /**/
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/home/addobra');
        },
      ),
    );
  }
}
