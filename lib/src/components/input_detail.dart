import 'package:bizkit/src/components/custom_textfield.dart';
import 'package:bizkit/src/res/styles.dart';
import 'package:flutter/material.dart';

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
