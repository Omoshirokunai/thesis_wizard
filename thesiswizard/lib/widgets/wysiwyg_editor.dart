// lib/widgets/wysiwyg_editor.dart
import 'package:flutter/material.dart';
import 'package:thesiswizard/widgets/colors.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:flutter_math_fork/flutter_math.dart';

class WysiwygEditor extends StatefulWidget {
  @override
  _WysiwygEditorState createState() => _WysiwygEditorState();
}

class _WysiwygEditorState extends State<WysiwygEditor> {
  final quill.QuillController _controller = quill.QuillController.basic();
  String _filename = 'untitled';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_filename, style: TextStyle(color: AppColors.text)),
        backgroundColor: AppColors.primary,
      ),
      body: Column(
        children: [
          // Toolbar for text formatting
          quill.QuillToolbar.simple(controller: _controller),

          // The actual editor
          Expanded(
            child: Container(
              color: AppColors.background,
              padding: EdgeInsets.all(8.0),
              child: quill.QuillEditor.basic(
                controller: _controller,
                // readOnly: false, // Editor is interactive
              ),
            ),
          ),
        ],
      ),
    );
  }
}
