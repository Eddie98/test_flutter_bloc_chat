import 'package:flutter/material.dart';

dynamic appSnackBar(BuildContext context, Color color, String label) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(label),
        backgroundColor: color,
      ),
    );
