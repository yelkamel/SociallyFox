import 'package:flutter/material.dart';
import 'package:sociallyfox/login/login_funnel.dart';
import 'package:sociallyfox/service/auth.dart';

class LoginScreen extends StatelessWidget {
  final void Function() onFinish;
  const LoginScreen({Key? key, required this.onFinish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoginFunnel(
      onAuthSubmit: (createAccount, name, email, pwd) async {
        if (!createAccount) {
          final res = await Auth.signInWithEmailAndPassword(email, pwd);
          if (!res) return false;
        }

        final res = await Auth.registerWithEmailAndPassword(email, pwd);
        if (!res) return false;

        Auth.updateDisplayName(name);
        onFinish.call();
        return true;
      },
    );
  }
}
