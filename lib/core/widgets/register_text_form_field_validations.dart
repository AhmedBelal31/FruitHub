String? validateName(String? value) {
  if (value == null || value.isEmpty) {
    return 'الرجاء ادخال الاسم كامل';
  } else if (value.length < 3) {
    return 'يجب الا يقل الاسم عن 3 حروف';
  } else if (value.length > 20) {
    return 'يجب الا يزيد الاسم عن 20 حروف';
  } else if (!isValidName(value)) {
    return 'الاسم يحتوي على حروف غير صالحة';
  }
  return null;
}

bool isValidName(String value) {
  final nameRegExp = RegExp(r'^[a-zA-Z\s\u0600-\u06FF]+$');
  return nameRegExp.hasMatch(value);
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'الرجاء ادخال البريد الالكتروني';
  } else if (!isValidEmail(value)) {
    return 'البريد الالكتروني غير صحيح';
  }
  return null;
}

bool isValidEmail(String value) {
  final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  return emailRegExp.hasMatch(value);
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'الرجاء ادخال كلمة المرور';
  } else if (value.length < 6) {
    return 'يجب الا يقل كلمة المرور عن 6 حروف';
  } else if (value.length > 20) {
    return 'يجب الا يزيد كلمة المرور عن 20 حروف';
  } else if (!hasValidPasswordCharacters(value)) {
    return 'كلمة المرور يجب ان تحتوي على حرف كبير وصغير ورقم ورمز';
  }
  return null;
}

bool hasValidPasswordCharacters(String value) {
  final passwordRegExp = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,20}$');
  return passwordRegExp.hasMatch(value);
}