// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'home_page.dart';
import 'package:buildflow/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//-------------------------------------------------------
//LOGIN e SIGNUP PAGE
//-------------------------------------------------------

Future<bool> add_user(String? name, String? login, String? password) async {
  await FirebaseFirestore.instance
      .collection("inspetor")
      .where("Login", isEqualTo: login)
      .get()
      .then((QuerySnapshot querySnapshot) async {
    if (querySnapshot.size > 0) {
      return false;
    } else {
      await FirebaseFirestore.instance.collection("inspetor").add(
          <String, dynamic>{'Login': login, 'Nome': name, 'Senha': password});
    }
    return true;
  });
  return true;
}

Future<bool> check_login(String? login, String? password) async {
  var response = await FirebaseFirestore.instance
      .collection("inspetor")
      .where("Login", isEqualTo: login)
      .where("Senha", isEqualTo: password)
      .get()
      .then((QuerySnapshot querySnapshot) {
    if (querySnapshot.size > 0) {
      save_cred?.login = login;
      return true;
    } else {
      return false;
    }
  });

  return response;
}

//-------------------------------------------------------
//ADD BUILD PAGES
//-------------------------------------------------------

Future<bool> add_build(String? name, String? start_date, String? end_date,
    String? description) async {
  await FirebaseFirestore.instance
      .collection("projetos")
      .where("Nome", isEqualTo: name)
      .get()
      .then((QuerySnapshot querySnapshot) async {
    if (querySnapshot.size > 0) {
      return false;
    } else {
      await FirebaseFirestore.instance
          .collection("projetos")
          .add(<String, dynamic>{
        'Nome': name,
        'Data_inicio': start_date,
        'Data_termino': end_date,
        'Descricao': description,
        'Inspetor': save_cred?.login,
      });
    }
    return true;
  });

  return false;
}

Future<Map?> get_build() async {
  Map projetos;

  int i = 0;
  await FirebaseFirestore.instance
      .collection("projetos")
      .where("Inspetor", isEqualTo: save_cred?.login)
      .get()
      .then((QuerySnapshot querySnapshot) {
    return projetos = querySnapshot.docs.asMap();
  });
  return null;
}
