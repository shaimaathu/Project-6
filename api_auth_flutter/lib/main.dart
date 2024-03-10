import 'package:api_auth_flutter/pages/signin%20page/sign_in.dart';
import 'package:api_auth_flutter/utils/set_up.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignIn(),
      debugShowCheckedModeBanner: false,
    );
  }
}
