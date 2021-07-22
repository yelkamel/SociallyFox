import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SplashScreen extends HookWidget {
  final Widget logo;
  final Widget bottom;
  final void Function()? onEnd;

  const SplashScreen(this.logo, this.bottom, {Key? key, this.onEnd})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textValue = useState(0.0);
    final logoValue = useState(0.0);

    final style = Theme.of(context).textTheme.bodyText1!.copyWith(
          fontSize: 27,
          fontWeight: FontWeight.w300,
          letterSpacing: -0.37,
        );

    useEffect(() {
      textValue.value = 1;
      logoValue.value = 1;

      return;
    }, []);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/splashcreen.png"),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: logoValue.value,
              duration: const Duration(milliseconds: 1700),
              child: logo,
              onEnd: onEnd,
            ),
            const SizedBox(width: double.infinity, height: 100),
            AnimatedOpacity(
              opacity: textValue.value,
              duration: const Duration(seconds: 1),
              child: bottom,
            )
          ],
        ),
      ),
    );
  }
}
