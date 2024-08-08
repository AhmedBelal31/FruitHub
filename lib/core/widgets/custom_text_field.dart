import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;

  final void Function(String)? onFieldSubmitted;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Widget? suffixIcon;

  final AutovalidateMode? autovalidateMode;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.controller,
    this.keyboardType,
    this.obscureText,
    this.suffixIcon,
    this.onSaved,
    this.autovalidateMode,

  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: autovalidateMode,
      validator: validator,
      onSaved: onSaved,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      cursorColor: AppColors.kButtonPrimaryColor,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyles.bold13.copyWith(
          color: const Color(0xFF949D9E),
        ),
        suffixIcon: suffixIcon,
        border: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        fillColor: const Color(0xFFF9FAFA),
        filled: true,
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(
          color: Color(0xFFE6E9E9),
          width: 1.0,
        ));
  }
}
