import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CustomProgressHud extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  const CustomProgressHud(
      {super.key, required this.isLoading, required this.child});

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: child,
    );
  }
}
