import 'package:bizkit/src/components/custom_textfield.dart';
import 'package:bizkit/src/res/styles.dart';
import 'package:bizkit/src/services/network/auth_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpSignIn extends StatefulWidget {
  const SignUpSignIn(
      {super.key,
      required this.emailController,
      required this.passwordController,
      this.confirmPasswordController,
      required this.onPressed,
      required this.elevatedOnPressed,
      required this.isSignIn});

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController? confirmPasswordController;
  final VoidCallback onPressed;
  final VoidCallback elevatedOnPressed;
  final bool isSignIn;

  @override
  State<SignUpSignIn> createState() => _SignUpSignInState();
}

class _SignUpSignInState extends State<SignUpSignIn> {
  @override
  void dispose() {
    super.dispose();
    widget.emailController.dispose();
    widget.passwordController.dispose();
    widget.confirmPasswordController!.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);
    if (!widget.isSignIn && widget.confirmPasswordController == null) {
      throw "if isSignIn is set then confirmPasswordController can't be null";
    }
    return Form(
      key: _formKey,
      child: ListView(
        shrinkWrap: true,
        children: [
          Center(
            child: Text(
                widget.isSignIn
                    ? "Sign in to your account"
                    : "Create a new account",
                style: customTextStyle(20, fontWeight: FontWeight.w600)),
          ),
          const SizedBox(height: 30),
          Text("Email",
              style: customTextStyle(16, fontWeight: FontWeight.w600)),
          const SizedBox(height: 5),
          Flexible(child: CustomTextfield(controller: widget.emailController)),
          //const SizedBox(height: 10),
          Text("Password",
              style: customTextStyle(16, fontWeight: FontWeight.w600)),
          const SizedBox(height: 5),
          Flexible(
              child: CustomTextfield(
            controller: widget.passwordController,
            obscure: true,
          )),
          //  const SizedBox(height: 10),
          widget.isSignIn
              ? const SizedBox()
              : Text("Confirm Password",
                  style: customTextStyle(16, fontWeight: FontWeight.w600)),
          const SizedBox(height: 5),
          widget.isSignIn
              ? const SizedBox()
              : Expanded(
                  child: CustomTextfield(
                      obscure: true,
                      controller: widget.confirmPasswordController!)),
          const SizedBox(height: 5),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                    widget.isSignIn
                        ? "Don’t have an account?"
                        : "Already have an account?",
                    style: customTextStyle(
                      16,
                    )),
              ),
              TextButton(
                  onPressed: widget.onPressed,
                  child: Text(widget.isSignIn ? "Sign Up" : "Sign In",
                      style: customTextStyle(16, color: Colors.amber)))
            ],
          ),
          const SizedBox(height: 30),
          Center(
            child: SizedBox(
              width: 200,
              height: 40,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 2,
                      backgroundColor: Colors.amber,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () async {
                    if (widget.isSignIn) {
                      if (_formKey.currentState!.validate()) {
                        await auth
                            .handleSignInEmail(widget.emailController.text,
                                widget.passwordController.text)
                            .then((value) {})
                            .catchError((onError) => debugPrint(onError));
                      }
                    } else {
                      if (_formKey.currentState!.validate()) {
                        if (widget.confirmPasswordController!.text ==
                            widget.passwordController.text) {
                          await auth
                              .handleSignUp(widget.emailController.text,
                                  widget.passwordController.text)
                              .then((value) {})
                              .catchError((e) => debugPrint(e));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "Confirm password and password should be same")));
                        }
                      }
                    }
                  },
                  child: Text(
                    widget.isSignIn ? "Sign In" : "Sign Up",
                    style: customTextStyle(
                      16,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
