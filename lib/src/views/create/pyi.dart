import 'package:bizkit/src/res/styles.dart';
import 'package:bizkit/src/views/create/identity.dart';
import 'package:flutter/material.dart';

class Pyi extends StatefulWidget {
  const Pyi({super.key});

  @override
  State<Pyi> createState() => _PyiState();
}

class _PyiState extends State<Pyi> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            // height: 1000,
            decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(5)),
            child: SizedBox(
                // height: 1200,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
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
                              style: customTextStyle(14,
                                  fontWeight: FontWeight.w600),
                            )),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(2.0),
                    child: FourSection(
                      label1: "Applications and Target Customer Segments",
                      label2: "Customer Problem Statement",
                      label3: "Better Solution",
                      label4: "Competition Landscape and Competing Features",
                    ),
                  ),
                ]))));
  }
}
