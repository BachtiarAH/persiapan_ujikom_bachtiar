import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pertemuan11/acara3/LoginScreen.dart';
import 'package:pertemuan11/persiapan/Lokasi.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null) {
      print(auth.currentUser!.email);
    }
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
                IconButton(onPressed: () {}, icon: Icon(Icons.extension)),
              ],
            ),
            SizedBox(
              height: 37,
            ),
            Text.rich(
              TextSpan(children: [
                TextSpan(
                    text: "Welcom, \n",
                    style: TextStyle(color: Colors.blue[300])),
                TextSpan(
                    text: auth.currentUser!.email,
                    style: TextStyle(color: Colors.blue[900]))
              ]),
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            
            Container(
              child: ElevatedButton(
                  onPressed: () {
                    _signOut().then((value) => Navigator.of(context)
                        .pushReplacement(
                            MaterialPageRoute(builder: (context) => LoginScreen(),)));
                  },
                  child: Text("Logout")),
            ),
            SizedBox(height: 20,),
            Lokasi(),
          ],
        ),
      ),
    );
  }
}