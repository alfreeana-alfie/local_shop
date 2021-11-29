import 'package:flutter/material.dart';
import 'package:local_shop/constant/app_color.dart';
import 'package:local_shop/constant/constants.dart';

class CustomInitialTextField extends StatefulWidget {
  const CustomInitialTextField({
    required this.onSaved, 
    required this.hintText,
    required this.initialValue,
  });

  // final Key fieldKey;
  // final int maxLength;
  final String hintText;
  final String initialValue;
  // final String labelText;
  // final String helperText;
  final FormFieldSetter<String> onSaved;
  // final FormFieldValidator<String> validator;
  // final ValueChanged<String> onFieldSubmitted;

  @override
  _CustomInitialTextFieldState createState() => _CustomInitialTextFieldState();
}

class _CustomInitialTextFieldState extends State<CustomInitialTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: horizontalValue, vertical: verticalValue),
      child: TextFormField(
        initialValue: widget.initialValue,
        onChanged: widget.onSaved,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.black12.withOpacity(0.05),
          hintText: widget.hintText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
