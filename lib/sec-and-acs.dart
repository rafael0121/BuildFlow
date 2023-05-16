import 'package:flutter/material.dart';

class Sec_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página Inicial'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/two_factor_auth');
              },
              child: Text('Autenticação de Dois Fatores'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/connected_apps');
              },
              child: Text('Aplicativos Conectados'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/connected_accounts');
              },
              child: Text('Contas Conectadas'),
            ),
          ],
        ),
      ),
    );
  }
}

class TwoFactorAuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Autenticação de Dois Fatores'),
      ),
      body: Center(
        child: Text(
          'Página de Autenticação de Dois Fatores',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class ConnectedAppsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplicativos Conectados'),
      ),
      body: Center(
        child: Text(
          'Página de Aplicativos Conectados',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class ConnectedAccountsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contas Conectadas'),
      ),
      body: Center(
        child: Text(
          'Página de Contas Conectadas',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
