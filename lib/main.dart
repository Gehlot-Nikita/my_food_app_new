import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

// IMPORT YOUR HOMESCREEN (correct path लगाना)
import 'screens/home_screen/home_screen.dart';

// IMPORT SIGN IN SCREEN if needed
// import 'auth/sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp();
  } catch (e) {
    debugPrint("FIREBASE ERROR: $e");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      // ---- FOR TESTING ----  
      // HomeScreen चलाना है तो यह रखो:
      home: HomeScreen(),

      // Login पहले दिखाना हो तो:
      // home: SignIn(),
    );
  }
}
