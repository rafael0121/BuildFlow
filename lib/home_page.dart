import 'package:flutter/material.dart';
import 'addbuild_page.dart';
import 'construction_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Obra> obras = [
    Obra('Obra 1', 'image/image1.webp'),
    Obra('Obra 2', 'image/image2.jpeg'),
    Obra('Obra 3', 'image/image3.jpeg'),
  ];

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
      body: ListView.builder(
        itemCount: obras.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: SizedBox(
              width: 80, // Defina a largura desejada
              height: 80, // Defina a altura desejada
              child: Image.asset(
                obras[index].imagePath,
                fit: BoxFit.cover, // Ajusta a imagem para preencher o espaço definido
              ),
            ),
            title: InkWell(
              onTap: () {
                // Ação quando o título da obra for clicado
                Navigator.pushNamed(context, '/home/construction');
              },
              child: Text(obras[index].nome),
            ),
            trailing: Wrap(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      obras.removeAt(index);
                    });
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/home/addobra');
        },
      ),
    );
  }
}

class Obra {
  final String nome;
  final String imagePath;

  Obra(this.nome, this.imagePath);
}
