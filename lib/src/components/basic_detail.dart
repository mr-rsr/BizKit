import 'package:bizkit/src/components/input_detail.dart';
import 'package:bizkit/src/res/styles.dart';
import 'package:flutter/material.dart';

class BasicDetailCard extends StatelessWidget {
  const BasicDetailCard({
    super.key,
    required this.industryController,
    required this.targetAudience,
    required this.descriptionController,
    required this.benefitsController,
    required this.onPressed,
  });

  final TextEditingController industryController;
  final TextEditingController targetAudience;
  final TextEditingController descriptionController;
  final TextEditingController benefitsController;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
            elevation: 3,
            shadowColor: Colors.amber,
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.amberAccent, width: 1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Form(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: ListView(
                  padding: const EdgeInsets.all(48),
                  shrinkWrap: true,
                  children: [
                    Center(
                      child: Text("Basic Details",
                          style:
                              customTextStyle(24, fontWeight: FontWeight.w600)),
                    ),
                    const SizedBox(height: 20),
                    InputDetailRow(
                        label: "Industry",
                        industryController: industryController,
                        hint: "Inventory Management"),
                    InputDetailRow(
                        label: "Target Audience",
                        industryController: targetAudience,
                        hint: "Warehouse"),
                    InputDetailRow(
                        label: "Description",
                        industryController: descriptionController,
                        hint: "A Software..."),
                    InputDetailRow(
                        label: "Key Benefits",
                        industryController: benefitsController,
                        hint: "smart stock management, ..."),
                    const SizedBox(height: 20),
                    UnconstrainedBox(
                      child: SizedBox(
                        width: 150,
                        height: 30,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 2,
                                backgroundColor: Colors.amber,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: onPressed,
                            child: Text(
                              "Generate",
                              style: customTextStyle(
                                14,
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
