import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsappclone/Screens/camera_screen.dart';
import 'package:whatsappclone/newScreen/landing_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  cameras =await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "OpenSans",
        colorScheme: ColorScheme.fromSwatch(
          // Use a predefined MaterialColor
        ).copyWith(
          primary: const Color(0xFF075E54), // Your custom primary color
          secondary: Colors.white, // Secondary color
        ),
         
        scaffoldBackgroundColor: Colors.white, // Set background color
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF075E54), // Ensure FAB uses primary color
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF075E54), // Ensure AppBar uses primary color
          foregroundColor: Colors.white, // Set text/icon color in AppBar
        ),
     
      
      ),
      home: const LandingPage(),
    );
  }
}
