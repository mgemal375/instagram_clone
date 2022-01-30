import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
 
 final TextEditingController? textEditingController; 
 final String? hintText;
 final bool? isPass;
final TextInputType? textInputtype;



  const TextFieldInput({Key? key,
   required this.textEditingController, 
   required this.hintText,
   this.isPass=false,
   required this.textInputtype}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context));
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText:hintText! ,
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled:true,
        contentPadding: EdgeInsets.all(8.0)
              ),
        keyboardType: textInputtype,
        obscureText: isPass!,
    );
  }
}