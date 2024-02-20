import 'package:bizkit/src/components/sign_in_sign_up.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
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
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Center(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 48.0),
            child: Card(
                elevation: 3,
                shadowColor: Colors.amber,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.amberAccent, width: 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(48),
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Expanded(
                            child: Image(
                              image: AssetImage(
                                  '../../../assets/images/onboarding.png'),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 28.0),
                              child: SignUpSignIn(
                                  emailController: emailController,
                                  passwordController: passwordController,
                                  confirmPasswordController:
                                      confirmPasswordController,
                                  onPressed: () => setState(() {
                                        isSignIn = !isSignIn;
                                        
                                      }),
                                  elevatedOnPressed: () {},
                                  isSignIn: isSignIn),
                            ),
                          )
                        ],
                      )),
                ))),
      ),
    );
  }
}

// SignUpSignIn(
//               emailController: emailController,
//               passwordController: passwordController,
//               // confirmPasswordController: confirmPasswordController,
//               label: 'Sign In',
//               onPressed: () => {},
//               isSignIn: true,
//             )