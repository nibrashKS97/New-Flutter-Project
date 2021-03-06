import 'package:firebase_anonymous_login/screens/authenticate/authenticate.dart';
import 'package:firebase_anonymous_login/screens/leaderboard/leaderboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_anonymous_login/services/auth.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 5.0,
        title: Text('Home page'),
      ),
      body: Center (
          child: Column (
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  children: [
                    Container(
                      child: Text (
                        'Welcome USER: ',
                        style: TextStyle ( fontSize: 15,fontWeight: FontWeight.bold, color: Colors.black38),
                      ),
                    ),
                    Container(
                      child: Text (
                        user!.uid,
                        style: TextStyle (color: Colors.black38),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Container(
                  child: Text (
                    '____________________________________',
                    style: TextStyle (color: Colors.black38),
                  ),
                ),
              ),

              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
                ),
                child: Text ('DO SOMETHING', style: TextStyle (color: Colors.white, fontSize: 20)),
                onPressed: () {
                  if (_auth.currentUser!.isAnonymous){
                    print ('User logged in as Guest');
                  }
                  else {
                    print ('User NOT logged in as Guest');
                  }
                },
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
                  ),
                  label: Text ('LEADERBOARD', style: TextStyle (fontSize: 20),),
                  icon: Icon(Icons.leaderboard),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) =>  Leaderboard()));
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top:24.0,bottom: 40.0),
                child: Container(
                  child: Text (
                    '____________',
                    style: TextStyle (color: Colors.black38),
                  ),
                ),
              ),

              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                child: Text ('LOGOUT and DELETE account'),
                onPressed: () { alertGuest(context);
                },
              ),

            ]
        ),
      ),
    );
  }

  void alertGuest (BuildContext context){
    var guestAlertDialog = AlertDialog (
        title: Text ('YOU ARE IN GUEST MODE',textAlign: TextAlign.center),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        contentPadding: EdgeInsets.all(0.0),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(36.0),
              child: Text ('Please choose "Continue" to continue in Guest mode or "Register" to create an account and login',textAlign: TextAlign.center,style: TextStyle(color: Colors.black)
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(child: _registerButton(true)),
                Container(
                  width: 2.0,
                  height: 55.0,
                  color: Colors.black,
                ),
                Expanded(child: _registerButton(false)),
              ],
            ),
          ],
        ),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return guestAlertDialog;
        }
    );
  }


  Widget _registerButton(bool isYes) {
    var borderRadius = isYes
        ? BorderRadius.only(bottomLeft: Radius.circular(16))
        : BorderRadius.only(bottomRight: Radius.circular(16));

    return InkWell(
      borderRadius: borderRadius,
      child: Container(
        height: 55.0,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: isYes ? Colors.blueGrey : Colors.lightBlue[900],
        ),
        child: Center(
          child: Text(
            isYes ? 'Continue' : 'Register',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      onTap: () {
        if (isYes) {
          Navigator.of(context).pop();
        } else {
          FirebaseAuth.instance.currentUser?.delete();
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) =>  Authenticate()), (route) => false);
        }

      },
    );
  }
}
