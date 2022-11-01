import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pertemuan11/model/Pengguna.dart';

class DatabaseUjikom {
  var db = FirebaseFirestore.instance;

  getDataById({required String id}) {
    Pengguna pengguna = Pengguna(
        id: "id",
        username: "username",
        password: "password",
        name: "nam",
        NomerTelpon: "nomertelpon");
    // db
    //     .collection("ujikom")
    //     .where("id", isEqualTo: id)
    //     .get()
    //     .then((event) {
    //   for (var doc in event.docs) {
    //     pengguna = Pengguna(
    //         id: doc.get("id"),
    //         username: doc.get("UserName"),
    //         password: doc.get("Password"),
    //         name: doc.get("Name"),
    //         NomerTelpon: doc.get("NomerTelepon"));
    //   }
    // });
    db.collection("ujikom").where("id", isEqualTo: 1).get().then(
          (res) => pengguna = Pengguna(
              id: res.docs[0].get("id"),
              name: res.docs[0].get("Name"),
              username: res.docs[0].get("UserName"),
              password: res.docs[0].get("Password"),
              NomerTelpon: res.docs[0].get("NomerTelepon")),
          onError: (e) => print("Error completing: $e"),
        );
    return pengguna;
  }
}
