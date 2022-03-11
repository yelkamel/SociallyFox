import 'package:flutter/material.dart';

import '../../model/step_model.dart';

class StepMainButton extends StatelessWidget {
  final FunnelStep step;
  final PageController pageCtrl;

  const StepMainButton({Key? key, required this.step, required this.pageCtrl})
      : super(key: key);

  void onPressStepMainButton() {
    if (step.isNext) {
      pageCtrl.nextPage(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Theme.of(context).colorScheme.primary,
      child: Text(
        step.type!,
        style: Theme.of(context)
            .textTheme
            .button!
            .copyWith(color: Theme.of(context).colorScheme.onPrimary),
      ),
      onPressed: onPressStepMainButton,
    );
  }
}
