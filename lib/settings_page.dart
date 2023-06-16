import 'package:flutter/material.dart';

class Settings_page extends StatefulWidget {
  @override
  _Settings_pageState createState() => _Settings_pageState();
}

class _Settings_pageState extends State<Settings_page> {
  bool _isTemaEscuro = false;
  bool _isNotificacoesHabilitadas = true;

  void _alterarTema(bool isTemaEscuro) {
    setState(() {
      _isTemaEscuro = isTemaEscuro;
    });
  }

  void _alterarNotificacoes(bool isNotificacoesHabilitadas) {
    setState(() {
      _isNotificacoesHabilitadas = isNotificacoesHabilitadas;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('Configurações'),
          ),
          body: ListView(
            children: [
              SizedBox(height: 16.0),
              SwitchListTile(
                title: Text("Tema escuro"),
                subtitle: Text("Ativar/desativar o tema escuro"),
                value: _isTemaEscuro,
                onChanged: (bool value) {
                  _alterarTema(value);
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Gerenciar conta"),
                subtitle: Text("Editar informações de perfil e senha"),
                onTap: () {
                  Navigator.pushNamed(context, '/home/settings/account');
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.lock),
                title: Text("Segurança e acesso"),
                subtitle: Text("Configurar autenticação, permissões e privacidade"),
                onTap: () {
                  Navigator.pushNamed(context, "/home/settings/security");
                },
              ),
              Divider(),
              SwitchListTile(
                title: Text("Notificações"),
                subtitle: Text("Ativar/desativar notificações do aplicativo"),
                value: _isNotificacoesHabilitadas,
                onChanged: (bool value) {
                  _alterarNotificacoes(value);
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.info),
                title: Text("Informações sobre o aplicativo"),
                subtitle: Text("Versão, desenvolvedor, termos de uso, etc."),
                onTap: () {
                  Navigator.pushNamed(context, '/home/settings/info');
                },
              ),
            ],
          ),
        );
  }
}