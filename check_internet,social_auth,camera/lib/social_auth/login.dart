import 'package:check_internet/social_auth/home_page1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  login() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> SignInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              // onPressed: () {},
              onPressed: (() => login()),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'Sign In with Google',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
          ),
          SizedBox(height: 21),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                try {
                  final UserCredential userCredential =
                      await SignInWithFacebook();

                  if (context.mounted) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage1(
                          displayName: userCredential.user!.displayName ?? '',
                          photoURL: userCredential.user!.photoURL ?? '',
                          email: userCredential.user!.email ?? '',
                        ),
                      ),
                    );
                  }
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'account-exists-with-different-credential') {
                    final email = e.email;
                    final pendingCredential = e.credential;

                    // Fetch list of providers linked to the email
                    final List<String> providers = await FirebaseAuth.instance
                        .fetchSignInMethodsForEmail(email!);

                    String message =
                        'An account already exists with this email using: ${providers.join(", ")}. Please log in with that method.';

                    if (context.mounted) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Login Conflict'),
                          content: Text(message),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  } else {
                    // Handle other FirebaseAuth errors
                    if (context.mounted) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Login Failed'),
                          content: Text('Error: ${e.message}'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  }
                } catch (e) {
                  // Non-Firebase errors
                  if (context.mounted) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Error'),
                        content: Text('Unexpected error: $e'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'Sign in with Facebook',
                  style: TextStyle(fontSize: 23),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
