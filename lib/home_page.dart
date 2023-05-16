import 'login_page.dart';
import 'package:flutter/material.dart';
import 'settings_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Obra> obras = [
    Obra('Obra 1', 'image1.jpg'),
    Obra('Obra 2', 'image2.jpg'),
    Obra('Obra 3', 'image3.jpg'),
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
            leading: Image.asset(obras[index].imagePath),
            title: Text(obras[index].nome),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  obras.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Adicionar Obra'),
                content: TextField(
                  decoration: InputDecoration(labelText: 'Nome da Obra'),
                  onChanged: (value) {
                    // Lógica para armazenar o valor do TextField
                  },
                ),
                actions: [
                  TextButton(
                    child: Text('Cancelar'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  TextButton(
                    child: Text('Adicionar'),
                    onPressed: () {
                      setState(() {
                        obras.add(Obra('Nova Obra',
                            'default_image.jpg')); // Substitua pelo valor do TextField e pela imagem desejada
                      });
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          );
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

class ConfigPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      body: Center(
        child: Text(
          'Página de Configurações',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
