import 'package:bizkit/src/components/section.dart';
import 'package:bizkit/src/res/styles.dart';
import 'package:flutter/material.dart';

class BMC extends StatefulWidget {
  const BMC({super.key});

  @override
  State<BMC> createState() => _BMCState();
}

class _BMCState extends State<BMC> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      // height: 1000,
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(5)),
      child: SizedBox(
        height: 1200,
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
                        style: customTextStyle(14, fontWeight: FontWeight.w600),
                      )),
                ),
              ),
            ),
            // const SizedBox(height: 10),
            const Expanded(
              flex: 5,
              child: Row(
                children: [
                  SizedBox(width: 2),
                  SectionComponent(
                    label: "Key Benefits",
                  ),
                  SizedBox(width: 2),
                  Expanded(
                    child: Column(
                      children: [
                        SectionComponent(
                          label: "Key Activities",
                        ),
                        SectionComponent(
                          label: "Key Resources",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 2),
                  SectionComponent(
                    label: "Value Propositions",
                  ),
                  SizedBox(width: 2),
                  Expanded(
                    child: Column(
                      children: [
                        SectionComponent(
                          label: "Customer Relations",
                        ),
                        SectionComponent(
                          label: "Customer Channels",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 2),
                  SectionComponent(
                    label: "Customer Segments",
                  ),
                  SizedBox(width: 2),
                ],
              ),
            ),
            const Expanded(
              flex: 2,
              child: Row(children: [
                SectionComponent(
                  label: "Cost Structure",
                ),
                SizedBox(width: 2),
                SectionComponent(
                  label: "Revenue Streams",
                ),
              ]),
            )
          ],
        ),
      ),
    ));
  }
}
