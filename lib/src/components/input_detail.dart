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
        // width: MediaQuery.of(context).size.width * .5,
        child: LayoutBuilder(builder: (context, constraint) {
          List<Widget> children = [
            Text(
              label,
              style: customTextStyle(constraint.maxWidth > 400 ? 16 : 14,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: constraint.maxWidth > 400
                  ? (constraint.maxWidth * .6)
                  : constraint.maxWidth,
              child: CustomTextfield(
                controller: industryController,
                hint: hint,
              ),
            ),
          ];
          return constraint.maxWidth > 400
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisSize: MainAxisSize.min,
                  children: children)
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.min,
                  children: children);
        }),
      ),
    );
  }
}
