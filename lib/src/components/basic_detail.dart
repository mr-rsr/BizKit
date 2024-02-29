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
    double width = MediaQuery.of(context).size.width;
    return Center(
        child: SingleChildScrollView(
      child: Card(
          elevation: 3,
          shadowColor: Colors.amber,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.amberAccent, width: 1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: BasicDetailsComponent(
              industryController: industryController,
              targetAudience: targetAudience,
              descriptionController: descriptionController,
              benefitsController: benefitsController,
              onPressed: onPressed)),
    ));
  }
}

class BasicDetailsComponent extends StatelessWidget {
  const BasicDetailsComponent({
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
    return Form(
      child: LayoutBuilder(builder: (context, constraint) {
        return SizedBox(
          width: constraint.maxWidth < 500
              ? constraint.maxWidth * 0.9
              : constraint.maxWidth < 720
                  ? constraint.maxWidth * 0.8
                  : constraint.maxWidth * 0.6,
          child: Padding(
            padding: constraint.maxWidth < 500
                ? const EdgeInsets.all(16)
                : constraint.maxWidth < 720
                    ? const EdgeInsets.all(24)
                    : const EdgeInsets.all(48),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Text("Basic Details",
                      style: customTextStyle(
                          constraint.maxWidth < 720 ? 18 : 24,
                          fontWeight: FontWeight.w600)),
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
        );
      }),
    );
  }
}
