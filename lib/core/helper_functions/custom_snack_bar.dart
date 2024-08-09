import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

enum SnackBarType {
  success,
  info,
  error,
}

void customSnackBar({
  required BuildContext context,
  required SnackBarType type,
  required String message,
}) {
  final CustomSnackBar snackBar;

  if (type == SnackBarType.success) {
    snackBar = CustomSnackBar.success(
      message: message,
      backgroundColor: AppColors.primaryColor,
    );
  } else if (type == SnackBarType.info) {
    snackBar = CustomSnackBar.info(
      message: message,
      backgroundColor: Colors.amber,
    );
  } else if (type == SnackBarType.error) {
    snackBar = CustomSnackBar.error(message: message);
  } else {
    snackBar = CustomSnackBar.info(message: message); // Default case
  }

  showTopSnackBar(
    Overlay.of(context),
    snackBar,
  );
}
