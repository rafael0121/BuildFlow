import 'package:flutter/material.dart';
import 'home_page.dart';

class ConfiguracoesPage extends StatefulWidget {
  @override
  _ConfiguracoesPageState createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
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
    return MaterialApp(
        home: Scaffold(
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
              // Implementar navegação para a página de gerenciamento de conta
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text("Segurança e acesso"),
            subtitle: Text("Configurar autenticação, permissões e privacidade"),
            onTap: () {
              // Implementar navegação para a página de segurança e acesso
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
            leading: Icon(Icons.privacy_tip),
            title: Text("Privacidade"),
            subtitle: Text("Gerenciar configurações de privacidade"),
            onTap: () {
              // Implementar navegação para a página de privacidade
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.accessibility),
            title: Text("Acessibilidade"),
            subtitle: Text("Configurar opções de acessibilidade"),
            onTap: () {
              // Implementar navegação para a página de acessibilidade
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info),
            title: Text("Informações sobre o aplicativo"),
            subtitle: Text("Versão, desenvolvedor, termos de uso, etc."),
            onTap: () {
              // Implementar navegação para a página de informações
            },
          ),
        ],
      ),
    ));
  }
}
