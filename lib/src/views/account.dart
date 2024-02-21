import 'package:bizkit/src/components/profile.dart';
import 'package:bizkit/src/components/sign_in_sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    return auth.currentUser != null
        ? const ProfileScreen()
        : LayoutBuilder(builder: (context, constraints) {
            return Padding(
                padding: constraints.maxWidth < 500
                    ? const EdgeInsets.all(8)
                    : constraints.maxWidth < 720
                        ? const EdgeInsets.all(24)
                        : const EdgeInsets.all(48),
                child: constraints.maxHeight < 460
                    ? const SingleChildScrollView(
                        child: SizedBox(height: 500, child: SignUpSignIn()),
                      )
                    : const SignUpSignIn());
          });
  }
}
