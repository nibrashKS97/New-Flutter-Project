import 'package:firebase_anonymous_login/screens/authenticate/authenticate.dart';
import 'package:firebase_anonymous_login/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class Wrapper extends StatelessWidget {
  Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    if(user != null){
      print ('User: ' + '"' + user.uid + '"' + ' is Logged in already');
      return Home();
    }
    else
    {
      print ('No user logged in');
      return Authenticate();
    }

  }
}
