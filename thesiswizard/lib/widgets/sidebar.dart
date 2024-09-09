// lib/widgets/sidebar.dart
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sidebarx/sidebarx.dart';
// import 'package:flutter_side_menu/flutter_side_menu.dart';
import 'package:thesiswizard/widgets/colors.dart';
// import 'package:solar_icons/solar_icons.dart';

// sidebar widget
// Sidebar widget
// lib/widgets/sidebar.dart

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 10,
      child: Row(
        children: [
          SidebarX(
            controller: SidebarXController(selectedIndex: 0),
            showToggleButton: false,
            items: const [
              SidebarXItem(icon: Icons.home),
              SidebarXItem(icon: Icons.search),
            ],
          ),
        ],
      ),
    );
  }
}
