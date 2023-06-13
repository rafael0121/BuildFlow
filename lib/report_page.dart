import 'package:buildflow/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Report_page extends StatefulWidget {
  const Report_page({Key? key}) : super(key: key);
  @override
  State<Report_page> createState() => _Report_pageState();
}

class _Report_pageState extends State<Report_page> {
  String text_description(String? description) {
    if (description == null) {
      return "";
    }
    if (description.length > 20) {
      return description.substring(0, 16) + "...";
    } else {
      return description;
    }
  }

  @override
  Widget build(BuildContext) {
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String login = arguments["login"];
    final Map<dynamic, dynamic> projeto = arguments["projeto"];
    final String project_name = projeto["Nome"];
    var reports = get_report(projeto["Nome"]);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Relatórios - ${projeto["Nome"]}"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(
                    context, "/home/build/report/add_report",
                    arguments: project_name);
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
                return Container(
                  padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Card(
                    child: ListTile(
                      tileColor: Colors.orange[100],
                      leading: Text(
                        snapshot.data?[index]?["Data"],
                      ),
                      title: 
                          
                          Text(
                            text_description(
                                snapshot.data?[index]?["Descricao"]),
                          ),
                      onTap: () {
                            Navigator.pushNamed(context, '/home/build/report/only_report',
                          arguments: <String, dynamic>{
                            "relatorio": snapshot.data?[index],
                            "login": login
                          });
                          },
                        
                    ),
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
