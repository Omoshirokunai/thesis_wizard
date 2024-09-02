// lib/widgets/sidebar.dart
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

// sidebar widget
// Sidebar widget
// lib/widgets/sidebar.dart
class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Draggable(
      feedback: Material(
        child: _buildSidebar(), // Providing the sidebar as the feedback widget
        elevation: 6.0,
      ),
      childWhenDragging: Opacity(
        opacity: 0.5,
        child: _buildSidebar(),
      ),
      child: _buildSidebar(),
      onDragEnd: (details) {
        // move sidebar widget to the opposite side
        if (details.offset.dx > MediaQuery.of(context).size.width / 2) {
          // move sidebar widget to the right
          print('Moved to the right');
        } else {
          // move sidebar widget to the left
          print('Moved to the left');
        }
      },
    );
  }

  Widget _buildSidebar() {
    return Container(
      width: 40,
      color: Colors.grey[900],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.only(top: 10.0, left: 15.0)),
          IconButton(
            icon: Icon(
              SolarIconsBold.file,
            ),
            onPressed: () {
              // Handle file functionality here
            },
          ),
          IconButton(
            icon: Icon(SolarIconsOutline.folder),
            onPressed: () {
              // Handle folder functionality here
            },
          ),
          IconButton(
            icon: Icon(SolarIconsOutline.diskette),
            onPressed: () {
              // Handle save functionality here
            },
          ),
          IconButton(
            icon: Icon(SolarIconsOutline.printer),
            onPressed: () {
              // Handle print functionality here
            },
          ),
        ],
      ),
    );
  }
}


// class Sidebar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Draggable(
//       feedback: move sidebar widget to the opposite side,
//       child: sidebar_widget
//     );
//   }
// }
