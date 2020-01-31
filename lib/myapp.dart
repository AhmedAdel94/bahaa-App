import 'package:bahaa2/UI/Details.dart';
import 'package:bahaa2/UI/Home.dart';
import 'package:bahaa2/UI/login.dart';
import 'package:bahaa2/UI/signup.dart';
import 'package:flutter/material.dart';


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  void initState() {


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/details',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => Login(),
        '/signUp': (BuildContext context) => SignUp(),
        '/home': (BuildContext context) => Home(),
        '/details': (BuildContext context) => Details(),
      }
    );
  }
}