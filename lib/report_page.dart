import 'package:buildflow/database.dart';
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
    final String project_name = projeto["Nome"];
    var reports = get_reports(login);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Relatórios - ${projeto["Nome"]}"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(
                    context, "/home/build/report/add_report", arguments: project_name);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: FutureBuilder<List<Map<dynamic, dynamic>?>?>(
        future: reports,
        builder: (context, snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: SizedBox(
                    width: 80,
                    height: 80,
                    child: Text(
                      snapshot.data?[index]?["Data"],
                    ),
                  ),
                  title: InkWell(
                    onTap: () {
                      /*Navigator.pushNamed(context, '/home/construction',
                          arguments: <String, dynamic>{
                            "projeto": snapshot.data?[index],
                            "login": login
                          });*/
                    },
                    child: Text(snapshot.data?[index]?["Resumo"]),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            children = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              ),
            ];
          } else {
            children = const <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              ),
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),
    );
  }
}
