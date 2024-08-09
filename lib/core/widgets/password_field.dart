import 'package:flutter/material.dart';
import 'custom_text_field.dart';

class PasswordField extends StatefulWidget {
  final void Function(String?)? onSaved;
 final String? Function(String?)? validator ;
const PasswordField({super.key, this.onSaved, this.validator});

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
      validator:widget.validator ,
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