// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';
import 'dart:io';

//others
String getCurrentTime() {
  DateTime dataAtual = DateTime.now();
  String time = DateFormat('ddMMyyyyHHmmss').format(dataAtual);
  return time;
}

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
        'Imagem': "",
      });
    }
    return true;
  });

  return response;
}

Future<bool> add_report(
    Map<String, dynamic> report, List<String> images) async {
  try {
    var doc =
        await FirebaseFirestore.instance.collection("relatorios").add(report);
    add_image(images, doc.id);
  } catch (e) {
    return false;
  }

  return true;
}

//Get metodos

Future<List<Map?>?> get_build(String? login) async {
  var response = await FirebaseFirestore.instance
      .collection("projetos")
      .where("Inspetor", isEqualTo: login)
      .get()
      .then((QuerySnapshot querySnapshot) {
    List<Map<String, dynamic>>? obras = [];
    for (var docSnapshot in querySnapshot.docs) {
      var dados = docSnapshot.data() as Map<String, dynamic>;
      dados["Id"] = docSnapshot.id;
      obras.add(dados);
    }
    return obras;
  });

  return response;
}

Future<List<Map?>?> get_report(String? name_project) async {
  var response = await FirebaseFirestore.instance
      .collection("relatorios")
      .where("Projeto", isEqualTo: name_project)
      .get()
      .then((QuerySnapshot querySnapshot) {
    List<Map<String, dynamic>>? reports = [];
    for (var docSnapshot in querySnapshot.docs) {
      var dados = docSnapshot.data() as Map<String, dynamic>;
      dados["Id"] = docSnapshot.id;
      reports.add(dados);
    }
    return reports;
  });

  return response;
}

//Delete

void delete_report(var id) async {
  delete_image(id);
  await FirebaseFirestore.instance.collection("relatorios").doc(id).delete();
}

void delete_build(var projeto) async {
  await FirebaseFirestore.instance
      .collection("relatorios")
      .where("Projeto", isEqualTo: projeto["Nome"])
      .get()
      .then((QuerySnapshot querySnapshot) async {
    for (var docSnapshot in querySnapshot.docs) {
      await FirebaseFirestore.instance
          .collection("relatorios")
          .doc(docSnapshot.id)
          .delete();
    }
  });
  await FirebaseFirestore.instance
      .collection("projetos")
      .doc(projeto["Id"])
      .delete();
}

//add image storage

void add_image(List<String> images, String id) async {
  final storageRef = FirebaseStorage.instance.ref(id);
  final currentTime = getCurrentTime();
  for (int i = 0; i < images.length; i++) {
    var imageRef = storageRef.child(currentTime + i.toString());
    try {
      File image = File(images[i]);
      await imageRef.putFile(image);
    } catch (e) {
      print(e);
    }
  }
}

Future<List<Uint8List?>> get_image(String id) async {
  final storageRef = FirebaseStorage.instance.ref().child(id);
  final resultList = await storageRef.listAll();

  List<Uint8List?> images = [];
  for (var image in resultList.items) {
    var imageRef = storageRef.child(image.name);
    images.add(await imageRef.getData());
  }

  return images;
}

//Delete image

void delete_image(String id) async {
  var storageRef = FirebaseStorage.instance.ref().child(id);
  final resultList = await storageRef.listAll();
  for (var image in resultList.items) {
    image.delete();
  }
  storageRef.delete();
}
