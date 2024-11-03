import 'package:flutter/material.dart';
import 'package:ihm/constants.dart';

class Mytextfield extends StatelessWidget {
  final Widget? icon;
  final String label;
  final bool obsecure;
  final TextEditingController controller;
  final TextInputType? keyboardType; 

  const Mytextfield({super.key, this.icon, required this.label, required this.obsecure, required this.controller, this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(label, style: TextStyle(color: primaryColor),textAlign: TextAlign.right,),
        ),
        TextFormField(
                  obscureText: obsecure,
                  controller: controller,
                  keyboardType: keyboardType,
                  decoration: InputDecoration(
            suffixIcon: icon,
                    enabledBorder: OutlineInputBorder(
                      borderSide:  BorderSide(color: primaryColor),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:  BorderSide(color: primaryColor, width: 2.0),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    // Inner padding for better text alignment
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  ),
                ),
      ],
    );
  }
}