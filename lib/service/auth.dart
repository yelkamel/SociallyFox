import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class Auth {
  static bool get isUserConnected => FirebaseAuth.instance.currentUser != null;

  static Stream<User?> userFirebase() =>
      FirebaseAuth.instance.authStateChanges();

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
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar("Oups", "Aucun utilisateur trouvé pour cet email.");
      } else if (e.code == 'wrong-password') {
        Get.snackbar("Oups", "Mot de passe incorrect.");
      }
      return false;
    } catch (e) {
      print("===> [Auth] login error $e ");
      return false;
    }
  }

  static Future<void> updateDisplayName(String? name) async {
    if (FirebaseAuth.instance.currentUser != null) {
      FirebaseAuth.instance.currentUser!.updateDisplayName(name);
    }
  }

  static Future<bool> registerWithEmailAndPassword(
      String email, String pwd) async {
    try {
      final UserCredential res =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
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
