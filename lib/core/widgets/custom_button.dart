import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';

import '../utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;

  const CustomButton({super.key, this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          // gradient: const LinearGradient(
          //   colors: [
          //     AppColors.kButtonPrimaryColor,
          //     AppColors.kButtonSecondaryColor,
          //   ],
          // ),
          color: AppColors.primaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.6),
              spreadRadius: 4,
              blurRadius: 8,
              offset: const Offset(0, 1), // changes position of shadow
            )
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyles.bold16.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
