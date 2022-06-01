import 'package:firebase_anonymous_login/screens/home/home.dart';
import 'package:firebase_anonymous_login/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AnonLogin extends StatefulWidget {
  const AnonLogin({Key? key}) : super(key: key);

  @override
  State<AnonLogin> createState() => _AnonLoginState();
}

class _AnonLoginState extends State<AnonLogin> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        elevation: 0.0,
        title: Text('Login'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 120.0),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
          ),
          child: Text ('Anonymous Login'),
          onPressed: () async {
            dynamic result = await _auth.logInAnon();
            if (result == null) {
              print ('Error while logging in as Guest');
            } else {
              print ('Signed in as Guest');
              print (result);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            }
          },
        ),
      ),
    );
  }
}
