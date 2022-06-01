import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // anonymous login
  Future logInAnon () async {
    try {
      UserCredential uCred = await _auth.signInAnonymously();
      User user = uCred.user!;
      return user;

    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // email & pass login

}