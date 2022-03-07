import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth service = FirebaseAuth.instance;
  static bool get isUserConnected => FirebaseAuth.instance.currentUser != null;

  Stream<User?> userFirebase() => service.authStateChanges();

  static Future signOut() => FirebaseAuth.instance.signOut();

  static Future<bool> signInWithEmailAndPassword(
      String email, String pwd) async {
    try {
      final UserCredential res =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: pwd,
      );
      return res.user != null;
    } catch (e) {
      return false;
    }
  }

  static Future resetPasswordWithEmail(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}
