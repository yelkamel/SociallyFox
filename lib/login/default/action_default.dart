import 'package:flutter/material.dart';

class LoginActionDefault extends StatelessWidget {
  final void Function() onLogin;
  final void Function() onRegister;

  const LoginActionDefault({
    Key? key,
    required this.onLogin,
    required this.onRegister,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MaterialButton(child: Text("Inscription"), onPressed: onRegister),
          const SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Vous avez déjà un compte ?',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      )),
              RawMaterialButton(
                onPressed: onLogin,
                child: Text(
                  ' Se connecter',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xffF2BD5C),
                      ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
