import 'package:bizkit/src/components/custom_textfield.dart';
import 'package:bizkit/src/res/styles.dart';
import 'package:bizkit/src/services/network/auth_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpSignIn extends StatefulWidget {
  const SignUpSignIn({
    super.key,
  });

  @override
  State<SignUpSignIn> createState() => _SignUpSignInState();
}

class _SignUpSignInState extends State<SignUpSignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isSignIn = true;
  @override
  void initState() {
    super.initState();
    emailController.addListener(() => setState(() {}));
    passwordController.addListener(() => setState(() {}));
    confirmPasswordController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  double labelFontSize = 16;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);

    return SizedBox.expand(
        child: Center(
            child: Card(
                elevation: 3,
                shadowColor: Colors.amber,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.amberAccent, width: 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: LayoutBuilder(builder: (context, constraint) {
                  return SizedBox(
                    width: constraint.maxWidth < 500
                        ? MediaQuery.of(context).size.width * 0.8
                        : MediaQuery.of(context).size.width * 0.7,
                    child: Padding(
                      padding: constraint.maxWidth < 500
                          ? const EdgeInsets.all(0)
                          : constraint.maxWidth < 720
                              ? const EdgeInsets.all(24)
                              : const EdgeInsets.all(48),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            constraint.maxWidth < 635
                                ? const SizedBox()
                                : const Flexible(
                                    child: Image(
                                      image: AssetImage(
                                          '../../../assets/images/onboarding.png'),
                                    ),
                                  ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 28.0),
                                child: Form(
                                  key: _formKey,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      //  shrinkWrap: true,
                                      children: [
                                        Center(
                                          child: Text(
                                              isSignIn
                                                  ? "Sign in to your account"
                                                  : "Create a new account",
                                              style: customTextStyle(
                                                  constraint.maxWidth < 400
                                                      ? 14
                                                      : 20,
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                        const SizedBox(height: 30),
                                        Text("Email",
                                            style: customTextStyle(
                                                constraint.maxWidth < 400
                                                    ? 12
                                                    : 16,
                                                fontWeight: FontWeight.w600)),
                                        const SizedBox(height: 5),
                                        Flexible(
                                            child: CustomTextfield(
                                                label: "Email",
                                                controller: emailController)),
                                        const SizedBox(height: 10),
                                        Text("Password",
                                            style: customTextStyle(
                                                constraint.maxWidth < 400
                                                    ? 12
                                                    : 16,
                                                fontWeight: FontWeight.w600)),
                                        const SizedBox(height: 5),
                                        Flexible(
                                            child: CustomTextfield(
                                          label: "Password",
                                          controller: passwordController,
                                          obscure: true,
                                        )),
                                        const SizedBox(height: 10),
                                        isSignIn
                                            ? const SizedBox()
                                            : Text("Confirm Password",
                                                style: customTextStyle(
                                                    constraint.maxWidth < 400
                                                        ? 12
                                                        : 16,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                        const SizedBox(height: 5),
                                        isSignIn
                                            ? const SizedBox()
                                            : Expanded(
                                                child: CustomTextfield(
                                                    label: "Confirm Password",
                                                    obscure: true,
                                                    controller:
                                                        confirmPasswordController)),
                                        const SizedBox(height: 5),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                  isSignIn
                                                      ? "Don’t have an account?"
                                                      : "Already have an account?",
                                                  style: customTextStyle(
                                                    constraint.maxWidth < 400
                                                        ? 10
                                                        : 16,
                                                  )),
                                            ),
                                            TextButton(
                                                onPressed: () => setState(() {
                                                      isSignIn = !isSignIn;
                                                    }),
                                                child: Text(
                                                    isSignIn
                                                        ? "Sign Up"
                                                        : "Sign In",
                                                    style: customTextStyle(
                                                        constraint.maxWidth <
                                                                400
                                                            ? 10
                                                            : 16,
                                                        color: Colors.amber)))
                                          ],
                                        ),
                                        const SizedBox(height: 30),
                                        Center(
                                          child: SizedBox(
                                            width: constraint.maxWidth,
                                            height: constraint.maxWidth < 400
                                                ? 30
                                                : 35,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    elevation: 2,
                                                    backgroundColor:
                                                        Colors.amber,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10))),
                                                onPressed: () async {
                                                  if (isSignIn) {
                                                    if (_formKey.currentState!
                                                        .validate()) {
                                                      await auth
                                                          .handleSignInEmail(
                                                              emailController
                                                                  .text,
                                                              passwordController
                                                                  .text)
                                                          .then((value) {})
                                                          .catchError(
                                                              (onError) =>
                                                                  debugPrint(
                                                                      onError));
                                                    }
                                                  } else {
                                                    if (_formKey.currentState!
                                                        .validate()) {
                                                      if (confirmPasswordController
                                                              .text ==
                                                          passwordController
                                                              .text) {
                                                        await auth
                                                            .handleSignUp(
                                                                emailController
                                                                    .text,
                                                                passwordController
                                                                    .text)
                                                            .then((value) {})
                                                            .catchError((e) =>
                                                                debugPrint(e));
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                const SnackBar(
                                                                    content: Text(
                                                                        "Confirm password and password should be same")));
                                                      }
                                                    }
                                                  }
                                                },
                                                child: Text(
                                                  isSignIn
                                                      ? "Sign In"
                                                      : "Sign Up",
                                                  style: customTextStyle(
                                                    constraint.maxWidth < 400
                                                        ? 14
                                                        : 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                    ),
                  );
                }))));
  }
}
