import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class ProgressBar extends StatelessWidget {
  final double? value;

  const ProgressBar({Key? key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      left: false,
      right: false,
      child: FAProgressBar(
        currentValue: (value! * 100).round(),
        size: 8,
        borderRadius: BorderRadius.circular(30),
        progressColor: Theme.of(context).colorScheme.secondary,
        backgroundColor:
            Theme.of(context).colorScheme.secondary.withOpacity(0.7),
        changeProgressColor:
            Theme.of(context).colorScheme.onSecondary.withOpacity(0.7),
      ),
    );
  }
}
