import 'package:flutter/material.dart';
import 'package:my_movie_app/core/utils/constants.dart';
import 'package:my_movie_app/core/utils/validator.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controler;
  final String hinttext;
  final bool obsecuretext;
  const MyTextField({
    super.key,
    required this.controler,
    required this.hinttext,
    required this.obsecuretext,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        validator: (value) {
          if (Validator.nullValidator(value: value!)) {
            return 'Please enter $hinttext';
          }
          return null;
        },
        controller: controler,
        obscureText: obsecuretext,
        decoration: fieldDecoration(),
      ),
    );
  }

  InputDecoration fieldDecoration() {
    return InputDecoration(
        hintText: hinttext,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400)),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kBorderColor)),
        fillColor: Colors.grey.shade100,
        filled: true);
  }
}
