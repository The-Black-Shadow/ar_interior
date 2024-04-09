import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obsecureText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obsecureText,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obsecureText,
        style: TextStyle(color: theme.textTheme.displayMedium!.color),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: theme.colorScheme.onBackground),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: theme.primaryColor),
          ),
          fillColor: theme.colorScheme.onSurface,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
            color: theme.colorScheme.primary.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
