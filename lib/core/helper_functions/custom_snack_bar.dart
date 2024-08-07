import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

enum CustomSnackBarType {
  success,
  info,
  error,
}

void customSnackBar({
  required BuildContext context,
  required CustomSnackBarType type,
  required String message,
}) {
  final CustomSnackBar snackBar;

  if (type == CustomSnackBarType.success) {
    snackBar = CustomSnackBar.success(message: message);
  } else if (type == CustomSnackBarType.info) {
    snackBar = CustomSnackBar.info(message: message);
  } else if (type == CustomSnackBarType.error) {
    snackBar = CustomSnackBar.error(message: message);
  } else {
    snackBar = CustomSnackBar.info(message: message); // Default case
  }

  showTopSnackBar(
    Overlay.of(context),
    snackBar,
  );




}
