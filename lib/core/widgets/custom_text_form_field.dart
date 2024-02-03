import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hint,
    this.label,
    this.onSaved,
    this.onChanged,
    this.maxLine = 1,
  });

  final String? hint;
  final String? label;
  final int maxLine;
  final Function(String?)? onSaved;

  final Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        border: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
      ),
      maxLines: maxLine,
      onSaved: onSaved,
      onChanged: onChanged,
      validator: (input) {
        if (input?.isEmpty ?? true) //input !=null
        {
          return 'Field is required .';
        } else {
          return null;
        }
      },
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: const BorderSide(
          color: Colors.white,
        ));
  }
}
