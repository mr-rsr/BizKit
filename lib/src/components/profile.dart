import 'package:bizkit/src/res/styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    return Center(
      child: Card(
        elevation: 3,
        shadowColor: Colors.amber,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.amberAccent, width: 1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: LayoutBuilder(builder: (context, constraint) {
          return Padding(
            padding: constraint.maxWidth < 500
                ? const EdgeInsets.all(16)
                : constraint.maxWidth < 720
                    ? const EdgeInsets.all(24)
                    : const EdgeInsets.all(48),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Email:",
                      style: customTextStyle(18),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "rajaryan.rsr",
                      style: customTextStyle(18),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.amber)),
                    onPressed: () {},
                    child: Text(
                      "Logout",
                      style: customTextStyle(16, fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          );
        }),
      ),
    );
  }
}
