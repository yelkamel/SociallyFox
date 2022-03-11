import 'dart:math';

import 'package:flutter/material.dart';
import 'package:layoutools/layoutools.dart';

import '../login_enum.dart';
import 'inputs.dart';
import 'next_button.dart';

class LoginTop extends StatelessWidget {
  final bool? enableClose;
  final TextEditingController inputCtrl;
  final LoginStep step;
  final void Function() goBack;
  final bool createAccount;
  final void Function()? onNext;

  const LoginTop({
    this.enableClose,
    Key? key,
    required this.inputCtrl,
    required this.step,
    required this.goBack,
    this.createAccount = true,
    required this.onNext,
  }) : super(key: key);

  double getStepValue() {
    if (step == LoginStep.name) return 0.3;
    if (step == LoginStep.email) return 0.6;
    if (step == LoginStep.pwd) return 0.9;
    return 1;
  }

  String headerTitle() {
    switch (step) {
      case LoginStep.email:
        return 'Votre e-mail ?';
      case LoginStep.name:
        return 'Quel est votre joli prénom ?';
      case LoginStep.pwd:
        return createAccount
            ? "Choisissez votre mot de passe"
            : "Quel est votre mot de passe ?";
      default:
        return "";
    }
  }

  void randomizeInputs() {
    if (step == LoginStep.name) {
      inputCtrl.text = "name_${DateTime.now().millisecond}";
    }
    if (step == LoginStep.email) {
      inputCtrl.text = "${Random().nextInt(999999).toString()}@yopmail.com";
    }
    if (step == LoginStep.pwd) {
      inputCtrl.text = "azerty";
    }
  }

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.bodyText1!.copyWith(
          fontSize: 30,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.4,
        );
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // ProgressBar(value: getStepValue(state)),
        SizedBox(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: GestureDetector(
              onLongPress: randomizeInputs,
              child: FadeInOutTransitionner(
                child: Text(
                  headerTitle(),
                  key: Key(step.toString()),
                  style: titleStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 75,
          child: LoginInput(
            inputCtrl: inputCtrl,
            step: step,
            onNext: onNext,
          ),
        ),
        LoginNextButton(
          onNext: onNext,
          step: step,
        ),
      ],
    );
  }
}
