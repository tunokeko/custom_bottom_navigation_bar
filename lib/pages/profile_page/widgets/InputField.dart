import 'package:flutter/material.dart';
import 'package:flutter_projject/styleguide/colors.dart';

class InputField extends StatelessWidget {
  final Icon? leftIcon;
  final String label;
  final bool obscure;


  const InputField({super.key, 
    this.leftIcon, 
    this.label = "Name", 
    this.obscure = false,
  });

  const InputField.password({Key? key}) : this(
    key: key,
    leftIcon: const Icon(Icons.lock),
    label: "Password",
    obscure: true,
  );

  const InputField.email({Key? key}) : this(
    key: key,
    leftIcon: const Icon(Icons.email_outlined),
    label: "Email"
  );

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: leftIcon,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.only(left: 36,top: 18,bottom: 18),
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          borderSide: BorderSide(color: Colors.black.withOpacity(0.1))
        ),
      ),
    );
  }
}