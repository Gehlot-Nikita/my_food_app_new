import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // Google Sign-In Function
  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      return userCredential.user;
    } catch (e) {
      debugPrint("GOOGLE SIGN-IN ERROR: $e");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // BACKGROUND IMAGE
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),

          Positioned.fill(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(height: 50),

                  const Text(
                    "Sign in to continue",
                    style: TextStyle(fontSize: 22, color: Colors.black),
                  ),

                  Text(
                    "Vegi",
                    style: TextStyle(
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade900,
                      shadows: [
                        BoxShadow(
                          color: Colors.green,
                          blurRadius: 8,
                          offset: const Offset(2, 2),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Apple Button
                  SignInButton(
                    Buttons.Apple,
                    text: "Sign in with Apple",
                    onPressed: () {
                     
                    },
                  ),

                  const SizedBox(height: 20),

                  // GOOGLE BUTTON (CONNECTED TO LOGIN)
                  SignInButton(
                    Buttons.Google,
                    text: "Sign in with Google",
                    onPressed: () async {
                      final User? user = await signInWithGoogle();

                      if (user != null && mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Logged in: ${user.displayName}"),
                          ),
                        );
                      }
                    },
                  ),

                  const SizedBox(height: 20),

                  Text(
                    "By signing in you are agreeing to our",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const Text(
                    "Terms and Privacy policy",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
