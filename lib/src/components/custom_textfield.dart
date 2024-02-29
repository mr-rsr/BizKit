///[CustomTextfield] is textformfield to get the user input.
/// This class reduce the rewriting of the same code again and again
/// [controller] is text field controller.
/// [label] is the label to the text field.
/// [hint] is the hint string.
/// [keyboardType] is the type of keyboard needed to take the input.
/// [validate] is the function which validate the input.

import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield(
      {super.key,
      required this.controller,
      this.label,
      this.hint,
      this.keyboardType,
      this.validate,
      this.onTap,
      this.suffixIcon,
      this.maxLine,
      this.obscure});

  final TextEditingController controller;
  final String? label;
  final String? hint;
  final TextInputType? keyboardType;
  final String? Function(String?)? validate;
  final String? Function()? onTap;
  final Widget? suffixIcon;
  final int? maxLine;
  final bool? obscure;

  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context);
    //bool isDark = themeProvider.getDarkMode;
    return TextFormField(
      obscureText: obscure ?? false,
      onTap: onTap,
      validator: validate ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter $label';
            }
            return null;
          },
      keyboardType: keyboardType,
      controller: controller,
      maxLines: 1,
      minLines: 1,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
        labelText: null,
        hintText: hint,
        hintStyle: TextStyle(
            overflow: TextOverflow.ellipsis,
            fontSize: 16,
            color: const Color.fromARGB(255, 128, 127, 127).withOpacity(0.5),
            fontWeight: FontWeight.w400),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: suffixIcon ??
            (controller.text.isEmpty
                ? null
                : IconButton(
                    onPressed: () => controller.clear(),
                    icon: const Icon(
                      Icons.close,
                      color: Color.fromARGB(255, 128, 127, 127),
                    ))),
        labelStyle: const TextStyle(
            fontSize: 18,
            color: Color.fromARGB(255, 128, 127, 127),
            fontWeight: FontWeight.w400),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 128, 127, 127),
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 128, 127, 127),
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
