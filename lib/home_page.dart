import 'package:buildflow/login_page.dart';
import 'package:flutter/material.dart';
import 'settings_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List _pages = [Home(), ConfiguracoesPage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BuildFlow'),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Configurações',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        onTap: _onItemTapped,
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          '/home/rafael/StudioProjects/BuildFlow/lib/assets/image2.jpeg',
                          height: 300,
                          width: 300,
                        ),
                        SizedBox(height: 10),
                        Text('Betim - Guarujá'),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          '/home/rafael/StudioProjects/BuildFlow/lib/assets/image1.webp',
                          height: 300,
                          width: 300,
                        ),
                        SizedBox(height: 10),
                        Text('Belo Horizonte - Catedral'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
