import 'package:flutter/material.dart';
import 'package:login/Home/main_screen.dart';
import 'package:login/LoginView/loginView.dart';
import 'package:login/RegisterView/registerView.dart';
import 'package:login/constansts/route.dart';
import 'package:login/verifyEmail/verifyEmail.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App',
      theme: ThemeData(),
      home: const RegisterView(),
      routes: {
        registerRoute: (context) => const RegisterView(),
        loginRoute: (context) => const LoginView(),
        mainRoute: (context) => const MainScreenView(),
        verifyEmailRoute: (context) => const VerifyEmail(),
      },
    );
  }
}
