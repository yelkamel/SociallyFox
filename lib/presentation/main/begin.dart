import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sociallyfox/presentation/main/splash.dart';
import 'package:sociallyfox/presentation/widget/fade_transitionner.dart';

import 'select_goal.dart';

class Begin extends HookWidget {
  const Begin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final index = useState(0);

    return SplashScreen(
      FlutterLogo(),
      Text('B'),
      onEnd: () {},
    );
  }
}
