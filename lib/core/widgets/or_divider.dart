import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
            child: Divider(
          color: Color(0xFFDCDEDE),
        )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Text(
            'أو',
            style: TextStyles.semiBold16.copyWith(),
          ),
        ),
        const Expanded(
            child: Divider(
          color: Color(0xFFDCDEDE),
        )),
      ],
    );
  }
}
