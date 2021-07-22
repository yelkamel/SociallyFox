import 'package:flutter/material.dart';
import 'package:sociallyfox/presentation/widget/fade_transitionner.dart';

class SelectGoal extends StatelessWidget {
  const SelectGoal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(builder: (context, _) {
      final isA = false;
      return FadeTransitionner(Text("D"));
    });
  }
}
