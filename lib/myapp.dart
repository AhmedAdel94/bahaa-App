import 'package:bahaa/UI/login.dart';
import 'package:bahaa/UI/signup.dart';
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
      initialRoute: '/signUp',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => Login(),
        '/signUp': (BuildContext context) => SignUp(),
      }
    );
  }
}