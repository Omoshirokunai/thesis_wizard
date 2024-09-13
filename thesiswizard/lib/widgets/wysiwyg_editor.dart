// lib/widgets/wysiwyg_editor.dart
import 'package:flutter/material.dart';
import 'package:thesiswizard/widgets/colors.dart';

class WysiwygEditor extends StatefulWidget {
  @override
  _WysiwygEditorState createState() => _WysiwygEditorState();
}

class _WysiwygEditorState extends State<WysiwygEditor> {
  TextEditingController _controller = TextEditingController();
  String _filename = 'untitled';

  // Example LaTeX template with placeholders
  String _latexTemplate = r"""
  \documentclass{article}
  \usepackage{amsmath}
  \usepackage{xcolor}

  \begin{document}

  \title{Dynamic LaTeX Document}
  \author{User Input}

  \maketitle

  \section{Introduction}
  {{content}}

  \end{document}
  """;

  String _currentLaTeX = "";

  // Method to update the LaTeX content with user input
  void _updateLaTeXContent() {
    setState(() {
      // Inject user input into the LaTeX template
      _currentLaTeX = _latexTemplate.replaceFirst(
        '{{content}}',
        _controller.text,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      color: AppColors.background,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              style: TextStyle(color: AppColors.text),
              decoration: InputDecoration(
                hintStyle: TextStyle(color: AppColors.text),
                hintText: "Enter your Thesis content here...",
              ),
              scrollPadding: EdgeInsets.all(20.0),
              keyboardType: TextInputType.multiline,
              // maxLines: 99999,
              maxLines: 99999,
              autofocus: true,
            )
          ],
        ),
      ),
    );
  }
}
