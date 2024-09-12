// lib/widgets/wysiwyg_editor.dart
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:thesiswizard/widgets/colors.dart';

class WysiwygEditor extends StatefulWidget {
  @override
  _WysiwygEditorState createState() => _WysiwygEditorState();
}

class _WysiwygEditorState extends State<WysiwygEditor> {
  final quill.QuillController _controller = quill.QuillController.basic();
  String _filename = 'untitled';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppColors.accent,
          body: Column(
            children: [
              // The rich text editor
              Expanded(
                child: Container(
                  color: Colors.black87,
                  padding: EdgeInsets.all(16.0),
                  child: quill.QuillEditor.basic(
                    controller: _controller,
                  ),
                ),
              ),
            ],
          ),
        ),
        // Floating toolbar for text formatting
        Positioned(
          bottom: 50,
          left: 20,
          right: 20,
          child: Container(),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: FloatingActionButton(
            onPressed: () {
              setState(() {});
            },
            backgroundColor: Colors.black54,
            child: Icon(Icons.format_bold, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
