import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sociallyfox/widget/fade_transitionner.dart';
import 'package:sociallyfox/widget/splash_screen.dart';

import 'second.dart';

class MainFirst extends HookWidget {
  const MainFirst({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final splash = useState(true);
    return FadeTranstionner(
      splash.value,
      SplashScreen(
        FlutterLogo(),
        Text('B'),
        onEnd: () => splash.value = false,
      ),
      MainSecond(),
    );
  }
}
