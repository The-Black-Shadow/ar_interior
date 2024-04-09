import 'package:flutter/material.dart';

class HomeScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        centerTitle: true,
        title: Text(
          "Augmented reality",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 3.0,
            color: theme.textTheme.bodyLarge!.color,
            shadows: [
              Shadow(
                color: theme.colorScheme.onPrimary,
                blurRadius: 5.0,
                offset: const Offset(1.5, 1.5),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Text(
          "Welcome to AR",
          style: TextStyle(
            fontSize: 24,
            color: theme.textTheme.bodyLarge!.color,
          ),
        ),
      ),
    );
  }
}
