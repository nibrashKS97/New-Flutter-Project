import 'package:firebase_anonymous_login/screens/authenticate/authenticate.dart';
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
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        elevation: 0.0,
        title: Text('Home page'),
      ),
      body: Center (
          child: Column (
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  child: Text (
                    'Welcome USER: ' + user!.uid,
                    style: TextStyle (color: Colors.white),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Container(
                  child: Text (
                    '_____________________________',
                    style: TextStyle (color: Colors.white),
                  ),
                ),
              ),

              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                ),
                child: Text ('Do Something'),
                onPressed: () {
                  if (_auth.currentUser!.isAnonymous){
                    alertGuest (context);
                    print ('User logged in as Guest');
                  }
                  else {
                    print ('User NOT logged in as Guest');
                  }
                },
              ),

              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                ),
                child: Text ('LOGOUT and DELETE account'),
                onPressed: () async {
                  User? user = FirebaseAuth.instance.currentUser;
                  await user?.delete();

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Authenticate()),
                  );
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
          /*children: <Widget>[
            Row (
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    child: Text(
                      'Continue as Guest',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
                ElevatedButton(
                    child: Text(
                      'Register',
                      textAlign: TextAlign.center
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    })
              ]
            )
          ],*/
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
