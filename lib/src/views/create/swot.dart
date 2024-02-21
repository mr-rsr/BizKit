import 'package:bizkit/src/components/four_section.dart';
import 'package:bizkit/src/res/styles.dart';
import 'package:bizkit/src/views/create/identity.dart';
import 'package:flutter/material.dart';

class Swot extends StatefulWidget {
  const Swot({super.key});

  @override
  State<Swot> createState() => _SwotState();
}

class _SwotState extends State<Swot> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            // height: 1000,
            decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(5)),
            child: SizedBox(
                //  height: 1200,
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
                      label1: "Strengths",
                      label2: "Weeknesses",
                      label3: "Opportunities",
                      label4: "Elevator Threats",
                    ),
                  ),
                ]))));
  }
}
