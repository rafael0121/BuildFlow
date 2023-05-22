import 'package:flutter/material.dart';
import 'addequip_page.dart';

class AddFuncionarioPage extends StatefulWidget {
  @override
  _AddFuncionarioPageState createState() => _AddFuncionarioPageState();
}

class _AddFuncionarioPageState extends State<AddFuncionarioPage> {
  List<String> profissoes = [
    'Advogado',
    'Analista',
    'Auxiliar',
    'Consultor',
    'Coordenador de Custos',
    'Engenheiro',
    'Mestre da Obra',
    'Motorista',
    'Pedreiro',
    'Supervisor'
  ];
  Map<String, int> funcionariosPorProfissao = {};

  @override
  void initState() {
    super.initState();
    // Inicializa o mapa de funcionários por profissão com zero para cada profissão
    for (String profissao in profissoes) {
      funcionariosPorProfissao[profissao] = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Funcionários'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selecione o número de funcionários para cada profissão:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            for (String profissao in profissoes) _buildFuncionarioInput(profissao),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AdicionarEquipamentosPage()),
          );
        },
        child: Icon(Icons.arrow_forward),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildFuncionarioInput(String profissao) {
    return Row(
      children: [
        Expanded(
          child: Text(
            profissao,
            style: TextStyle(fontSize: 16),
          ),
        ),
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: () {
            setState(() {
              if (funcionariosPorProfissao[profissao]! > 0) {
                funcionariosPorProfissao[profissao] = funcionariosPorProfissao[profissao]! - 1;
              }
            });
          },
        ),
        SizedBox(width: 8),
        Text(
          funcionariosPorProfissao[profissao].toString(),
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(width: 8),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            setState(() {
              funcionariosPorProfissao[profissao] = funcionariosPorProfissao[profissao]! + 1;
            });
          },
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.end,
    );
  }
}
