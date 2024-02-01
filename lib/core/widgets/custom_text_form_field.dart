import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.hint,this.onSaved ,this.maxLine = 1});

  final String hint;
  final int maxLine;
  final Function(String?)? onSaved ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        border: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
      ),
      maxLines: maxLine,
      onSaved:onSaved,
      validator:(input){
        if(input?.isEmpty ?? true ) //input !=null
          {
            return 'Field is required .' ;
          }
        else
          {
            return null ;
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
