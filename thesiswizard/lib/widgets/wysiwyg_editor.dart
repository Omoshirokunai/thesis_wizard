// lib/widgets/wysiwyg_editor.dart
import 'package:flutter/material.dart';

class WysiwygEditor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: Center(
        child: Text(
          'WYSIWYG and LaTeX Editor',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
