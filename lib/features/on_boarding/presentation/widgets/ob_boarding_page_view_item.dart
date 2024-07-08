
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_text_styles.dart';

class PageViewItem extends StatefulWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.backgroundImage,
    required this.subtitle,
    required this.title,
    required this.isVisible,
  });

  final String image, backgroundImage;
  final String subtitle;
  final Widget title;

  final bool isVisible;

  @override
  State<PageViewItem> createState() => _PageViewItemState();
}

class _PageViewItemState extends State<PageViewItem> {
  bool isChanged = false  ;
  @override
  void initState() {

    Future.delayed(const Duration(milliseconds: 800), () {
      setState(() {
        isChanged = true;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  widget.backgroundImage,
                  fit: BoxFit.fill,
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                curve: Curves.bounceInOut,
                bottom:isChanged  ? 0 : 200,
                left: 0,
                right: 0,
                child: SvgPicture.asset(
                  widget.image,
                ),
              ),
              Visibility(
                visible: widget.isVisible,
                child: GestureDetector(
                  onTap: () {
                    // Prefs.setBool(kIsOnBoardingViewSeen, true);

                    // Navigator.of(context).pushReplacementNamed(
                    //    SigninView.routeName,
                    //     );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'تخطي',
                      style: TextStyles.regular13.copyWith(
                        color: const Color(0xFF949D9E),
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
        const SizedBox(
          height: 64,
        ),
        widget.title,
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 37,
          ),
          child: Text(
            widget.subtitle,
            textAlign: TextAlign.center,
            // style: TextStyles.semiBold13.copyWith(
            //   color: const Color(0xFF4E5456),
            // ),
          ),
        )
      ],
    );
  }
}


