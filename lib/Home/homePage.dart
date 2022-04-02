// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login/Home/main_screen.dart';
import 'package:login/LoginView/loginView.dart';
import 'package:login/firebase_options.dart';
import 'package:login/verifyEmail/verifyEmail.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: FutureBuilder(
        future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final user = FirebaseAuth.instance.currentUser;
              if (user != null) {
                if (user.emailVerified) {
                  return const MainScreenView();
                } else {
                  return const VerifyEmail();
                }
              } else {
                return const LoginView();
              }

            default:
              break;
          }
          return const Text('Done');
        },
      ),
    );
  }
}
