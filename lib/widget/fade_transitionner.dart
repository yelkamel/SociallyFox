import 'package:flutter/material.dart';

class FadeTranstionner extends StatelessWidget {
  final Widget A;
  final Widget B;
  final bool isA;
  const FadeTranstionner(
    this.isA,
    this.A,
    this.B, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("TEST");
  }
}
