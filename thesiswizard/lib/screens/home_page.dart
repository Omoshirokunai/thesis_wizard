// lib/screens/home_page.dart
// import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:solar_icons/solar_icons.dart';
import 'package:desktop_split_pane/desktop_split_pane.dart';
import '../widgets/wysiwyg_editor.dart';
import '../widgets/preview_page.dart';
import '../widgets/status_bar.dart';
import '../widgets/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isEditorVisible = true;
  bool _isPreviewVisible = true;
  String filename = 'Untitled';

  List<double> _calculateFractions() {
    if (_isEditorVisible && _isPreviewVisible) {
      return [0.5, 0.5];
    } else if (_isEditorVisible) {
      return [1.0];
    } else if (_isPreviewVisible) {
      return [1.0];
    } else {
      _isEditorVisible = true;
      return [1.0];
    }
  }

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: SvgPicture.asset(
                'assets/images/white_logo.svg',
                width: 30,
                height: 30,
                semanticsLabel: 'Thesis wizard logo',
                colorFilter: ColorFilter.mode(AppColors.blue, BlendMode.srcIn),
              ),
            ),
            Center(
                child: Text(filename,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'IBM Plex Sans'))),
          ],
        ),
        backgroundColor: AppColors.background,
        toolbarHeight: 40,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Row(
              children: [
                IconButton(
                  hoverColor: Colors.white,
                  tooltip: 'Save as pdf',
                  splashRadius: 20,
                  icon: SvgPicture.asset(
                    'assets/images/pdf.svg',
                    width: 40,
                    height: 40,
                  ),
                  onPressed: () {
                    // Handle save functionality here
                  },
                ),
                IconButton(
                  hoverColor: Colors.white,
                  tooltip: 'Editor',
                  splashRadius: 20,
                  icon: SvgPicture.asset(
                    'assets/images/sidebar-code.svg',
                    width: 40,
                    height: 40,
                  ),
                  onPressed: () {
                    // Handle showing editor functionality here
                    setState(() {
                      _isEditorVisible = !_isEditorVisible;
                    });
                  },
                ),
                IconButton(
                  hoverColor: Colors.white,
                  tooltip: 'Preview Page',
                  splashRadius: 20,
                  icon: SvgPicture.asset(
                    'assets/images/expand-left.svg',
                    width: 40,
                    height: 40,
                    // colorFilter:ColorFilter.mode(AppColors.blue, BlendMode.srcIn),
                  ),
                  onPressed: () {
                    // Handle preview functionality here
                    setState(() {
                      _isPreviewVisible = !_isPreviewVisible;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                // Expanded(
                Padding(
                  padding: const EdgeInsets.only(right: 2.0),
                  child: Container(
                    color: AppColors.text,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 7,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final fractions = _calculateFractions();
                          return fractions.isEmpty
                              ? Container() // Show empty container if both are invisible
                              : HorizontalSplitPane(
                                  constraints: constraints,
                                  separatorColor: Colors.black,
                                  separatorThickness: 2.0,
                                  fractions: fractions,
                                  children: [
                                    if (_isEditorVisible) WysiwygEditor(),
                                    if (_isPreviewVisible) PreviewPage(),
                                  ],
                                );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          StatusBar(),
        ],
      ),
    );
  }
}
