import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Report_page extends StatefulWidget {
  const Report_page({Key? key}) : super(key: key);

  @override
  State<Report_page> createState() => _Report_pageState();
}

class _Report_pageState extends State<Report_page> {
  @override
  Widget build(BuildContext) {
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String login = arguments["login"];
    final Map<dynamic, dynamic> projeto = arguments["projeto"];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Relatórios - ${projeto["Nome"]}"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, "/home/construction/report/add_build");
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: ListView(
        children: [

        ],
      ),
    );
  }
}
