import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'mobile_screen.dart';

class TransHomeScreen extends StatefulWidget {
  @override
  _TransHomeScreenState createState() => _TransHomeScreenState();
  static const routeName = '/transhome';
}

class _TransHomeScreenState extends State<TransHomeScreen> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        brightness: Brightness.light,
        automaticallyImplyLeading: true,
        title: Text(
          "Transporter HomeScreen",
          style: TextStyle(
            fontFamily: "Montserrat",
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w400,
            letterSpacing: 1,
          ),
        ),
        leading: Icon(Icons.arrow_back),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Center(
        child: Image.asset('assets/images/cs.jpg'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _auth.signOut();
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        },
        child: Icon(Icons.logout),
      ),
    );
  }
}
