import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth service = FirebaseAuth.instance;

  Stream<User?> userFirebase() => service.authStateChanges();
}
