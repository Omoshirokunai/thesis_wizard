// import 'package:flutter/material.dart';
// import 'api_service.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Llama Integration',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final ApiService apiService = ApiService();
//   final TextEditingController _controller = TextEditingController();
//   String _response = '';

//   void _callLlama() async {
//     String prompt = _controller.text;
//     String response = await apiService.callLlama(prompt);
//     setState(() {
//       _response = response;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Llama Integration'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _controller,
//               decoration: InputDecoration(labelText: 'Enter prompt'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _callLlama,
//               child: Text('Call Llama'),
//             ),
//             SizedBox(height: 20),
//             Text(_response),
//           ],
//         ),
//       ),
//     );
//   }
// }
// lib/main.dart
import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/welcome_page.dart';
import 'widgets/colors.dart';
import 'dart:io';
import 'dart:ui';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Check if the app is running on a desktop platform
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    appWindow.title = 'Thesis Wizard';
    // appWindow.hide();
    runApp(MyApp());
    // runApp(MyApp());
    //get screen size
    doWhenWindowReady(() {
      const initialSize = Size(1920.0, 1080.0);
      const minsize = Size(1020.0, 1000.0);
      appWindow.size = initialSize;
      appWindow.minSize = minsize;
      appWindow.alignment = Alignment.center;
      appWindow.show();
    });
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Llama Integration',
      theme: ThemeData(
        primaryColor: AppColors.accent,
        scaffoldBackgroundColor: AppColors.background,
        useMaterial3: false,
      ), // Use a dark theme for the black background
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomePage(),
        '/home': (context) => MyHomePage(),
      },
    );
  }
}

// Function to set window size and restrict resizing below 500x500