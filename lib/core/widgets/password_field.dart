
import 'package:flutter/material.dart';

import 'custom_text_field.dart';
import 'register_text_form_field_validations.dart';

class PasswordField extends StatefulWidget {
  final void Function(String?)? onSaved;

  const PasswordField({super.key, this.onSaved});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
   bool obscureText = true ;
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hintText: 'كلمة المرور',
      keyboardType: TextInputType.visiblePassword,
      obscureText: obscureText,
      onSaved: widget.onSaved,
      validator: validatePassword,
      suffixIcon:  IconButton(
        onPressed: (){
          setState(() {
            obscureText = !obscureText;
          });
        },
        icon : obscureText ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
        color: const Color(0xFFC9CECF),
      ),
    );
  }
}