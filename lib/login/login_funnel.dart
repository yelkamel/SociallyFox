import 'package:flutter/material.dart';
import 'package:layoutools/layoutools.dart';

import 'login_enum.dart';
import 'login_extension.dart';

import 'default/action_default.dart';
import 'widget/top.dart';

class LoginFunnel extends StatefulWidget {
  final void Function()? onClose;
  final Widget? loadingWidget;
  final Widget? backWidget;
  final bool Function(String)? onNameValidation;
  final bool Function(String)? onEmailValidation;
  final bool Function(String)? onPasswordValidation;
  final Future<bool> Function(bool, String, String, String)? onAuthSubmit;
  final Widget Function(
    BuildContext,
    void Function() onConnect,
    void Function() onRegister,
  )? actionBuilder;

  const LoginFunnel({
    Key? key,
    this.loadingWidget,
    this.backWidget,
    this.onClose,
    this.onNameValidation,
    this.onEmailValidation,
    this.onPasswordValidation,
    required this.onAuthSubmit,
    this.actionBuilder,
  }) : super(key: key);

  @override
  State<LoginFunnel> createState() => _LoginFunnelState();
}

class _LoginFunnelState extends State<LoginFunnel> {
  TextEditingController inputController = TextEditingController();
  LoginStep step = LoginStep.init;

  bool createAccount = true;
  String name = '';
  String email = '';
  String password = '';

  void nameFinish() {
    name = inputController.text.trim().capitalizeFirst;
    final res = widget.onNameValidation?.call(name) ?? false;
    if (!res) return;

    inputController.text = "";
    setState(() => step = LoginStep.email);
  }

  void emailFinish() {
    email = inputController.text.trim();
    final res = widget.onEmailValidation?.call(name) ?? false;
    if (!res) return;
    setState(() => step = LoginStep.pwd);
    inputController.text = "";
  }

  void pwdFinish() async {
    password = inputController.text.trim();
    final res = widget.onPasswordValidation?.call(name) ?? false;
    if (!res) return;

    setState(() => step = LoginStep.loading);

    final authRes =
        await widget.onAuthSubmit?.call(createAccount, name, email, password) ??
            false;

    if (!authRes) {
      setState(() => step = LoginStep.pwd);
      inputController.text = "";
      return;
    }
  }

  void goNext() {
    if (step == LoginStep.pwd) pwdFinish();
    if (step == LoginStep.email) emailFinish();
    if (step == LoginStep.name) nameFinish();
  }

  void goBack() {
    final close = step == LoginStep.init && widget.onClose != null;
    if (close) widget.onClose?.call();

    if (step == LoginStep.name) setState(() => step = LoginStep.init);

    if (step == LoginStep.email) {
      step = createAccount ? LoginStep.name : LoginStep.init;
      inputController.text = name;
    }

    if (step == LoginStep.pwd) {
      setState(() => step = LoginStep.email);
      inputController.text = email;
    }
    if (step == LoginStep.loading) setState(() => step = LoginStep.pwd);
  }

  void onSubmitAction(bool _) {
    createAccount = _;
    setState(() => step = _ ? LoginStep.name : LoginStep.email);
  }

  void onRegister() {
    setState(() {
      createAccount = true;
      step = LoginStep.name;
    });
  }

  void onLogin() {
    setState(() {
      createAccount = true;
      step = LoginStep.email;
    });
  }

  Widget buildContent() {
    switch (step) {
      case LoginStep.loading:
        return Center(
          child: widget.loadingWidget ?? CircularProgressIndicator(),
        );
      case LoginStep.init:
        return widget.actionBuilder?.call(context, onRegister, onLogin) ??
            LoginActionDefault(
              onLogin: onLogin,
              onRegister: onRegister,
            );
      default:
        return LoginTop(
          enableClose: widget.onClose != null,
          goBack: goBack,
          inputCtrl: inputController,
          onNext: goNext,
          step: step,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: RawMaterialButton(
          onPressed: goBack,
          child: widget.backWidget ?? Icon(Icons.arrow_back),
        ),
        actions: [],
      ),
      body: FadeInOutTransitionner(child: buildContent()),
    );
  }
}
