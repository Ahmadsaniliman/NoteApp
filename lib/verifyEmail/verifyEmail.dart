// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login/firebase_options.dart';
import 'dart:developer' as devtool show log;

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Email'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: FutureBuilder(
            future: Firebase.initializeApp(
                options: DefaultFirebaseOptions.currentPlatform),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  return Column(
                    children: [
                      const Text(
                        "we've sent you am email to verify your accout",
                      ),
                      const Text(
                        "ddid'nt recieved the mail please press the the button below",
                      ),
                      TextButton(
                        onPressed: () async {
                          final user = FirebaseAuth.instance.currentUser;
                          if (user != null) {
                            if (user.emailVerified) {
                              devtool.log('Email is Verified');
                            } else {
                              const VerifyEmail();
                            }
                          } else {
                            user?.sendEmailVerification();
                          }
                        },
                        child: const Text('Send Email Verification'),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Restart',
                        ),
                      ),
                    ],
                  );
                default:
                  break;
              }
              return const CircularProgressIndicator();
            }),
      ),
    );
  }
}
