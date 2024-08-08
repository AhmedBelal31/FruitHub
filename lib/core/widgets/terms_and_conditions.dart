import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants.dart';
import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/app_text_styles.dart';

class TermsAndConditions extends StatefulWidget {

  final ValueChanged<bool> onChanged ;
  const TermsAndConditions({
    super.key, required this.onChanged,
  });

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  bool isTermsAccepted = false  ;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          isChecked: isTermsAccepted,
          onChecked: (value)
          {
            setState(() {
             isTermsAccepted = value;
            widget.onChanged(value);
            });
          },
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'من خلال إنشاء حساب ، فإنك توافق على ',
                  style: TextStyles.semiBold13.copyWith(
                    color: const Color(0xFF949D9E),
                  ),
                ),
                TextSpan(
                  text: 'الشروط والأحكام الخاصة بنا ',
                  style: TextStyles.semiBold13.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CustomCheckBox extends StatelessWidget {
  final bool isChecked;
  final Function(bool) onChecked;
  const CustomCheckBox({super.key, required this.isChecked, required this.onChecked});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
        onChecked(!isChecked);
      },
      child: AnimatedContainer(
        width: 24,
        height: 24,
        duration: const Duration(
          milliseconds: 200,
        ),
        decoration: ShapeDecoration(
          color: isChecked ? AppColors.primaryColor : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: BorderSide(
              width: 1.5,
              color: isChecked ? Colors.transparent : const Color(0xFFDCDEDE),
            ),
          ),
        ),
        child: isChecked ?  Padding(
          padding: const EdgeInsets.all(2.0),
          child: SvgPicture.asset(
            Assets.assetsImagesCheck ,

          ),
        ) : const SizedBox(),
      ),
    );
  }
}