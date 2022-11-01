import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pertemuan11/FirebaseStorage/Database.dart';
import 'package:pertemuan11/model/Pengguna.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key});

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  TextEditingController UsernameCOntroler = TextEditingController();
  TextEditingController PasswordCOntroler = TextEditingController();
  TextEditingController NamaCOntroler = TextEditingController();
  TextEditingController NomerTelponCOntroler = TextEditingController();

  FirebaseFirestore db = FirebaseFirestore.instance;

  Map data = {};

  Pengguna UserLoged = Pengguna(
      id: "id",
      name: "name",
      username: "username",
      password: "password",
      NomerTelpon: "NomerTelpon");

  setFieldValue(
      {String username = "",
      String password = "",
      String nama = "",
      String NomerTelpon = ""}) {
    this.UsernameCOntroler.text = username;
    this.PasswordCOntroler.text = password;
    this.NamaCOntroler.text = nama;
    this.NomerTelponCOntroler.text = NomerTelpon;
  }

  readDAta() async {
    await db.collection("ujikom").where("id", isEqualTo: 1).get().then((event) {
      for (var doc in event.docs) {
        // print("${doc.id} => ${doc.data()}");
        data = doc.data();
        // print("data => ${data["UserName"]}");
      }
    });
  }

  setData() {
    int id = 0;
    db
        .collection("ujikom")
        .orderBy("id", descending: true)
        .get()
        .then((value) => id = int.parse(value.docs[0].get("id").toString()));

    final docData = {
      "id": id++,
      "UserName": UsernameCOntroler.text,
      "Name": NamaCOntroler.text,
      "Password": PasswordCOntroler.text,
      "NomerTelepon": NomerTelponCOntroler.text
    };

    final nestedData = {
      "a": 5,
      "b": true,
    };

    docData["objectExample"] = nestedData;

    db
        .collection("ujikom")
        .doc("DnjTVWROHZWS9hNjBk4f")
        .set(docData)
        .onError((e, _) => print("Error writing document: $e"));

    print("ok");
  }

  @override
  Widget build(BuildContext context) {
    readDAta();
    setFieldValue(
        username: data["UserName"],
        nama: data["Name"],
        password: data["Password"],
        NomerTelpon: data["NomerTelepon"]);
    // tesQuery();
    return Scaffold(
      appBar: AppBar(title: Text("Profil"),leading: IconButton(onPressed: () {
        data = {};
        Navigator.of(context).pop();
      }, icon: Icon(Icons.arrow_back)),),
      body: Column(
        children: [
          TextField(
            controller: UsernameCOntroler,
            decoration: InputDecoration(
              labelText: "username",
            ),
          ),
          TextField(
            controller: PasswordCOntroler,
            decoration: InputDecoration(labelText: UserLoged.getPassword),
          ),
          TextField(
            controller: NamaCOntroler,
            decoration: InputDecoration(labelText: "name"),
          ),
          TextField(
            controller: NomerTelponCOntroler,
            decoration: InputDecoration(labelText: "nomer telpon"),
          ),
          // ElevatedButton(
          //     onPressed: () {
          //       setData();
          //     },
          //     child: Text("Save"))
        ],
      ),
    );
  }
}
