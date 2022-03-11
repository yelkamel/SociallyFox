import 'package:flutter/material.dart';

import '../model/step_model.dart';
import 'button/main.dart';
import 'button/secondary.dart';

class StepBody extends StatelessWidget {
  final FunnelStep step;
  final PageController pageCtrl;

  const StepBody({Key? key, required this.step, required this.pageCtrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (step.isNext) {
      return Stack(
        children: [
          Center(child: Text(step.text!)),
          Align(
              alignment: Alignment.bottomCenter,
              child: StepMainButton(pageCtrl: pageCtrl, step: step))
        ],
      );
    }
    if (step.isAction) {
      return Stack(
        children: [
          Center(child: Text(step.text!)),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                StepSecondaryButton(pageCtrl: pageCtrl, step: step),
                StepMainButton(pageCtrl: pageCtrl, step: step),
              ],
            ),
          )
        ],
      );
    }
    return Container();
  }
}
