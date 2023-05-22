import 'package:flutter/material.dart';

class ManageAcc extends StatefulWidget {
  @override
  _ManageAccState createState() => _ManageAccState();
}

class User {
  String name;
  String password;
  String dob;
  String biography;

  User(
      {required this.name,
      required this.password,
      required this.dob,
      required this.biography});
}

class _ManageAccState extends State<ManageAcc> {
  User _user = User(
      name: 'Isabela Borlido',
      password: 'LDDM2023',
      dob: '01/01/2000',
      biography: 'Olá! Sou uma professora de LDDM.');
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _biographyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = _user.name;
    _passwordController.text = _user.password;
    _dobController.text = _user.dob;
    _biographyController.text = _user.biography;
  }

  void _saveChanges() {
    setState(() {
      _user.name = _nameController.text;
      _user.password = _passwordController.text;
      _user.dob = _dobController.text;
      _user.biography = _biographyController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciar Conta'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile_picture.png'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Implementação da escolha de imagem
              },
              child: Text('Alterar Foto de Perfil'),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nome:',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 5),
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: 'Digite seu nome',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Senha:',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 5),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Digite sua senha',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Data de Nascimento:',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 5),
                  TextField(
                    controller: _dobController,
                    decoration: InputDecoration(
                      hintText: 'Digite sua data de nascimento',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Biografia:',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 5),
                  TextField(
                    controller: _biographyController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: 'Digite sua biografia',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _saveChanges,
                    child: Text('Salvar Alterações'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
