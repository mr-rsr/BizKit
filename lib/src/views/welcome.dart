import 'package:bizkit/src/components/sign_in_sign_up.dart';
import 'package:bizkit/src/res/styles.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: LayoutBuilder(builder: (context, constraint) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            Text(
              "Please SignIn to Continue",
              style: customTextStyle(constraint.maxHeight < 720 ? 16 : 24),
            ),
            const SizedBox(
              height: 24,
            ),
            Flexible(
                child: constraint.maxHeight < 560
                    ? const SingleChildScrollView(
                        child: SizedBox(height: 500, child: SignUpSignIn()),
                      )
                    : const SignUpSignIn()),
            const SizedBox(
              height: 20,
            ),
          ],
        );
      }),
    );
  }
}
