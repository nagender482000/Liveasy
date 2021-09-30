import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../screens/profile_selection.dart';
import '../screens/transporter_home.dart';
import '../screens/lang.dart';
import '../screens/shipper_home.dart';
import '../screens/mobile_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Liveasy',
        theme: ThemeData(
          fontFamily: 'Roboto',
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          LoginScreen.routeName: (ctx) => LoginScreen(),
          ShipHomeScreen.routeName: (ctx) => ShipHomeScreen(),
          TransHomeScreen.routeName: (ctx) => TransHomeScreen(),
          Language.routeName: (ctx) => Language(),
          ProfileSelection.routeName: (ctx) => ProfileSelection(),
        },
        home: InitializerWidget());
  }
}

class InitializerWidget extends StatefulWidget {
  @override
  _InitializerWidgetState createState() => _InitializerWidgetState();
}

class _InitializerWidgetState extends State<InitializerWidget> {
  late FirebaseAuth _auth;

  User? _user;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _auth = FirebaseAuth.instance;
    _user = _auth.currentUser;
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
            // ignore: unnecessary_null_comparison
          )
        // ignore: unnecessary_null_comparison
        : _user == null
            ? LoginScreen()
            : Language();
  }
}
