import 'dart:core';

import 'package:buildflow/database.dart';
import 'package:flutter/material.dart';
import 'addbuild_page.dart';
import 'build_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  

  @override
  Widget build(BuildContext context) {
    final String login = ModalRoute.of(context)!.settings.arguments as String;

    var obras = get_build(login);

    void initState() {
      super.initState();
      setState(() {});
    }

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
                      child: Image.network(
                        snapshot.data?[index]?["Imagem"],
                        fit: BoxFit
                            .cover, // Ajusta a imagem para preencher o espaço definido
                      ),
                    ),
                    title: InkWell(
                      onTap: () {
                        // Ação quando o título da obra for clicado
                        Navigator.pushNamed(context, '/home/build',
                            arguments: <String, dynamic>{
                              "projeto": snapshot.data?[index],
                              "login": login
                            });
                      },
                      child: Text(snapshot.data?[index]?["Nome"]),
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
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              tooltip: "Adicionar",
              child: Icon(Icons.add),
              onPressed: () {
                Navigator.pushNamed(context, '/home/add_build',
                    arguments: login);
              },
            ),
            SizedBox(
              width: 20,
            ),
            FloatingActionButton(
              tooltip: "Recarregar",
              child: Icon(Icons.restart_alt),
              onPressed: () {
                setState(() {});
              },
            ),
          ],
        ));
  }
}
