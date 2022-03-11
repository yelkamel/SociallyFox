import 'package:flutter/material.dart';

import '../model/step_model.dart';
import 'body.dart';

class StepScaffold extends StatelessWidget {
  final FunnelStep step;
  final PageController pageCtrl;
  const StepScaffold({
    Key? key,
    required this.step,
    required this.pageCtrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(step.toString())),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: StepBody(
          step: step,
          pageCtrl: pageCtrl,
        ),
      ),
    );
  }
}
