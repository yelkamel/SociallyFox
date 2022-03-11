import 'package:flutter/material.dart';
import 'package:layoutools/layoutools.dart';
import 'package:sociallyfox/funnel/funnel.dart';
import 'package:sociallyfox/funnel/template/onboarding_steps.dart';
import 'package:sociallyfox/presentation/login_streen.dart';

class Rooter extends StatefulWidget {
  const Rooter({Key? key}) : super(key: key);

  @override
  _RooterState createState() => _RooterState();
}

class _RooterState extends State<Rooter> {
  bool loading = true;
  String base = 'onboarding';

  @override
  void initState() {
    super.initState();
    checkUserConnexion();
  }

  Future<void> checkUserConnexion() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() => loading = false);
  }

  Widget buildContent() {
    if (loading) return const LoadingCircle();
    if (base == 'onboarding') {
      return Funnel(
          steps: onboardingstep,
          stops: ['login', 'pvd-evolum'],
          onFinish: (key) {
            setState(() => base = key);
          });
    }
    if (base == 'login') {
      return LoginScreen(onFinish: () {
        setState(() => base = 'home');
      });
    }
    return Funnel(
        steps: onboardingstep,
        stops: ['login', 'pvd-evolum'],
        onFinish: (key) {
          setState(() => base = key);
        });
  }

  @override
  Widget build(BuildContext context) {
    return FadeInOutTransitionner(child: buildContent());
  }
}
