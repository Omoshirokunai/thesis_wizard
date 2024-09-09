// lib/screens/welcome_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thesiswizard/widgets/colors.dart';

class WelcomePage extends StatelessWidget {
  final String logo = 'assets/images/white_logo.svg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                SvgPicture.asset(
                  logo,
                  semanticsLabel: 'Thesis wizard logo',
                  colorFilter:
                      ColorFilter.mode(AppColors.blue, BlendMode.srcIn),
                ),
                Text(
                  'Welcome to Llama Integration',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Navigate to a new page to create a project
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: Text('Create a Project'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to a new page to open an existing project
                // You can implement a file picker or similar
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: Text('Open a Project'),
            ),
          ],
        ),
      ),
    );
  }
}
