import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              logo(),
              SizedBox(
                height: 10,
              ),
              loginText(),
              SizedBox(
                height: 30,
              ),
              auth(),
              SizedBox(
                height: 30,
              ),
              loginButton(),
              SizedBox(
                height: 10,
              ),
              createAccount(),
            ],
          ),
        ),
      ),
    );
  }

  Widget logo() {
    return Container(
      height: 150,
      child: Center(
        child: Image.asset('assets/images/africa.png'),
      ),
    );
  }

  Widget loginText() {
    return Center(
      child: Text(
        'Log In',
        style: TextStyle(
            color: Color(0xff0dbea8),
            fontSize: 40,
            fontWeight: FontWeight.w800),
      ),
    );
  }

  Widget auth() {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xffe7e7e7),
            borderRadius: BorderRadius.all(Radius.circular(50))),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            formField("Email", emailController, false),
            SizedBox(
              height: 10,
            ),
            formField("Password", passwordController, true),
          ],
        ),
      ),
    );
  }

  Widget formField(
      String hint, TextEditingController controller, bool obscure) {
    return Container(
      margin: EdgeInsets.only(left: 40, right: 40, bottom: 30),
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        validator: (value) {
          if (value.isEmpty) {
            return 'This field is required';
          }
        },
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Color(0xffc0bbc1), fontSize: 20),
        ),
      ),
    );
  }

  Widget loginButton() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/home');
        },
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xff0dbea8),
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 3,
                blurRadius: 3,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          width: double.infinity,
          height: 60,
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Text(
                    "LOG IN",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xff0dbea8),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget createAccount() {
    return Column(
      children: <Widget>[
        Text(
          "Don't have an account?",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/signUp');
          },
          child: Text(
            "Create an account.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Color(0xff0dbea8)),
          ),
        ),
      ],
    );
  }
}
