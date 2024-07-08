import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';

import '../utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;

  const CustomButton({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            AppColors.kButtonPrimaryColor,
            AppColors.kButtonSecondaryColor,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            spreadRadius: 8,
            blurRadius: 10,
            offset: const Offset(0, 1), // changes position of shadow
          )
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyles.bold16.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
