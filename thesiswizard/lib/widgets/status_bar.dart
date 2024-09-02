// lib/widgets/status_bar.dart
import 'package:flutter/material.dart';

class StatusBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[900],
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('AI vs human score:', style: TextStyle(color: Colors.white)),
          Text('Word count goal: ', style: TextStyle(color: Colors.white)),
          Text('Word count: 0', style: TextStyle(color: Colors.white)),
          Text('Grammar checker', style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
