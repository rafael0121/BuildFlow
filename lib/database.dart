// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'home_page.dart';
import 'package:buildflow/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//-------------------------------------------------------
//LOGIN e SIGNUP PAGE
//-------------------------------------------------------

Future<bool> add_user(String? name, String? login, String? password) async {
  var response = await FirebaseFirestore.instance
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
  return response;
}

Future<bool> check_login(String? login, String? password) async {
  var response = await FirebaseFirestore.instance
      .collection("inspetor")
      .where("Login", isEqualTo: login)
      .where("Senha", isEqualTo: password)
      .get()
      .then((QuerySnapshot querySnapshot) {
    if (querySnapshot.size > 0) {
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
    String? description, String? login) async {
  var response = await FirebaseFirestore.instance
      .collection("projetos")
      .where("Nome", isEqualTo: name)
      .get()
      .then((QuerySnapshot querySnapshot) async {
    if (querySnapshot.size > 0) {
      return false;
    } else {
      await FirebaseFirestore.instance
          .collection("projetos")
          .add(<String, String?>{
        'Nome': name,
        'Data_inicio': start_date,
        'Data_termino': end_date,
        'Descricao': description,
        'Inspetor': login,
        'Imagem' : "",  
      });
    }
    return true;
  });

  return response;
}

Future<List<Map?>?> get_build(String? login) async {
  var response = await FirebaseFirestore.instance
      .collection("projetos")
      .where("Inspetor", isEqualTo: login)
      .get()
      .then((QuerySnapshot querySnapshot) {
    List<Map<String, dynamic>>? obras = [];
    for (var docSnapshot in querySnapshot.docs) {
      var dados = docSnapshot.data() as Map<String, dynamic>;
      obras!.add(dados);
    }
    return obras;
  });

  return response;
}
