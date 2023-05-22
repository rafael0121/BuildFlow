import 'package:flutter/material.dart';

class AdicionarEquipamentosPage extends StatefulWidget {
  static const routeName = '/adicionar_equipamentos';

  @override
  _AdicionarEquipamentosPageState createState() => _AdicionarEquipamentosPageState();
}

class _AdicionarEquipamentosPageState extends State<AdicionarEquipamentosPage> {
  List<Equipamento> equipamentos = [
    Equipamento(nome: 'Caminhão', quantidade: 0),
    Equipamento(nome: 'Caminhão Betoneira', quantidade: 0),
    Equipamento(nome: 'Caminhão Munck', quantidade: 0),
    Equipamento(nome: 'Escavadeira', quantidade: 0),
    Equipamento(nome: 'Mini Carregadeira', quantidade: 0),
    Equipamento(nome: 'Mini Escavadeira', quantidade: 0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Align(
          alignment: AlignmentDirectional.topStart,
          child: Text('Adicionar Equipamentos'),
        ),
        centerTitle: false,
      ),
      body: ListView.builder(
        itemCount: equipamentos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(equipamentos[index].nome),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.remove, color: Colors.black),
                  onPressed: () {
                    setState(() {
                      if (equipamentos[index].quantidade > 0) {
                        equipamentos[index].quantidade--;
                      }
                    });
                  },
                ),
                Text(equipamentos[index].quantidade.toString()),
                IconButton(
                  icon: Icon(Icons.add, color: Colors.black),
                  onPressed: () {
                    setState(() {
                      equipamentos[index].quantidade++;
                    });
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Finalizar e retornar à página inicial (home page)
          Navigator.pushNamed(context, '/home');
        },
        child: Icon(Icons.check),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class Equipamento {
  final String nome;
  int quantidade;

  Equipamento({required this.nome, required this.quantidade});
}
