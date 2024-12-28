import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mit_app/screens/sign_up_screen.dart';
import 'package:mit_app/screens/login_screen.dart';
import 'package:mit_app/screens/dashboard_screen.dart';
import 'package:mit_app/screens/announcements_screen.dart';
import 'package:mit_app/screens/notes_screen.dart';
import 'package:mit_app/screens/assignments_screen.dart';
import 'package:mit_app/announcements/announcements_list_screen.dart'; // Include this as part of the new feature.

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Initialize Firebase based on the platform (Web or Mobile).
    if (kIsWeb) {
      await Firebase.initializeApp(
        options: FirebaseOptions(
          apiKey: "AIzaSyBn2zJB9iQyYEl5AQR3IbUV07FI8teX3lw",
          appId: "1:459850274295:web:9d9ebd39e199ecf1368af2",
          messagingSenderId: "459850274295",
          projectId: "mitapp-28b9e",
          databaseURL: "https://mitapp-28b9e-default-rtdb.firebaseio.com",
        ),
      );
    } else {
      await Firebase.initializeApp();
    }
  } catch (e) {
    debugPrint('Error initializing Firebase: $e');
  }

  runApp(MyCollegeApp());
}

class MyCollegeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'College Helper App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'Poppins', // Default font for the app.
      ),
      // Starting screen is LoginScreen.
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(), // Login screen.
        '/signup': (context) => SignUpScreen(), // Sign up screen.
        '/dashboard': (context) => DashboardScreen(), // Dashboard screen.
        '/announcements': (context) =>
            AnnouncementsScreen(), // Announcements module.
        '/notes': (context) => NotesScreen(), // Notes module.
        '/assignments': (context) => AssignmentsScreen(), // Assignments module.
        '/announcements_list': (context) =>
            AnnouncementsListScreen(), // New announcements list.
      },
    );
  }
}
