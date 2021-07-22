import 'package:flutter/material.dart';
import 'package:sociallyfox/widget/fade_transitionner.dart';

class MainSecond extends StatelessWidget {
  const MainSecond({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(builder: (context, _) {
      final isA = false;
      return FadeTranstionner(
        isA,
        Text('Home'),
        Text('Authentification'),
      );
    });
  }
}
