import 'package:bizkit/src/components/four_section.dart';
import 'package:bizkit/src/res/styles.dart';
import 'package:flutter/material.dart';

class IdentityPage extends StatelessWidget {
  const IdentityPage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("identity");
    return Container(
      // height: 1000,
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(5)),
      child: SizedBox(
        //height: 800,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  height: 30,
                  width: 150,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 2,
                          backgroundColor: Colors.amber,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {},
                      child: Text(
                        "Fill All Section",
                        style: customTextStyle(14, fontWeight: FontWeight.w600),
                      )),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(2.0),
              child: FourSection(
                label1: "Business Name",
                label2: "Slogan",
                label3: "Vision",
                label4: "Elevator Pitch",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
