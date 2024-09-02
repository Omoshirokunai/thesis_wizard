// lib/screens/home_page.dart
// import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:desktop_split_pane/desktop_split_pane.dart';
import '../widgets/sidebar.dart';
import '../widgets/wysiwyg_editor.dart';
import '../widgets/preview_page.dart';
import '../widgets/status_bar.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isEditorVisible = true;
  bool _isPreviewVisible = true;
  bool _isSidebarVisible = true;
  String filename = 'Untitled';

  List<double> _calculateFractions() {
    if (_isEditorVisible && _isPreviewVisible) {
      return [0.5, 0.5];
    } else if (_isEditorVisible) {
      return [1.0];
    } else if (_isPreviewVisible) {
      return [1.0];
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(filename)),
        backgroundColor: const Color.fromARGB(245, 34, 34, 34),
        toolbarHeight: 35,
        actions: [
          IconButton(
            icon: Icon(SolarIconsOutline.card),
            onPressed: () {
              setState(() {
                _isSidebarVisible = !_isSidebarVisible;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.code),
            onPressed: () {
              setState(() {
                _isEditorVisible = !_isEditorVisible;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.visibility_off),
            onPressed: () {
              setState(() {
                _isPreviewVisible = !_isPreviewVisible;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.print),
            onPressed: () {
              // Handle print functionality here
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: _isSidebarVisible ? 40 : 0,
                  child: _isSidebarVisible ? Sidebar() : null,
                ),
                // Expanded(
                SizedBox(
                  width: MediaQuery.of(context).size.width - 50,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final fractions = _calculateFractions();
                      return fractions.isEmpty
                          ? Container() // Show empty container if both are invisible
                          : HorizontalSplitPane(
                              constraints: constraints,
                              separatorColor: Colors.black,
                              separatorThickness: 4.0,
                              fractions: fractions,
                              children: [
                                if (_isEditorVisible) WysiwygEditor(),
                                if (_isPreviewVisible) PreviewPage(),
                              ],
                            );
                    },
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
