import 'package:flutter/material.dart';
import 'package:layoutools/layoutools.dart';
import 'package:sociallyfox/presentation/home/home_screen.dart';
import 'package:sociallyfox/presentation/onboarding/onboarding_funnel.dart';

import '../service/auth.dart';

class Rooter extends StatefulWidget {
  const Rooter({Key? key}) : super(key: key);

  @override
  _RooterState createState() => _RooterState();
}

class _RooterState extends State<Rooter> {
  bool loading = true;

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

    if (Auth.isUserConnected) return const HomeScreen();

    return OnboardingFunnel();
  }

  @override
  Widget build(BuildContext context) {
    return FadeInOutTransitionner(child: buildContent());
  }
}
