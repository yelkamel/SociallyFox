import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sociallyfox/presentation/main/first.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const Begin();
}

class Begin extends StatelessWidget {
  const Begin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(home: MainFirst());
  }
}
