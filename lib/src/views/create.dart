import 'package:bizkit/src/components/custom_textfield.dart';
import 'package:bizkit/src/res/styles.dart';
import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  TextEditingController industryController = TextEditingController();
  TextEditingController targetAudience = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController benefitsController = TextEditingController();
  @override
  void initState() {
    super.initState();
    industryController.addListener(() => setState(() {}));
    targetAudience.addListener(() => setState(() {}));
    descriptionController.addListener(() => setState(() {}));
    benefitsController.addListener(() => setState(() {}));
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
                          onPressed: () => {},
                          child: Text(
                            "Generate",
                            style: customTextStyle(
                              14,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                    ),
                  )
                ],
              ),
            ),
          )),
    )));
  }
}

class InputDetailRow extends StatelessWidget {
  const InputDetailRow({
    super.key,
    required this.industryController,
    required this.label,
    required this.hint,
  });

  final TextEditingController industryController;
  final String label;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .5,
        child: LayoutBuilder(builder: (context, constraint) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: customTextStyle(16, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: constraint.maxWidth * .6,
                child: CustomTextfield(
                  controller: industryController,
                  hint: hint,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
