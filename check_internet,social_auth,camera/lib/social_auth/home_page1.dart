import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class HomePage1 extends StatefulWidget {
  final String displayName;
  final String photoURL;
  final String email;

  const HomePage1({
    super.key,
    required this.displayName,
    required this.photoURL,
    required this.email,
  });

  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  Future<void> signOut() async {
    try {
      // Sign out from Firebase

      // Also sign out from Facebook if logged in
      await FacebookAuth.instance.logOut();
      await FirebaseAuth.instance.currentUser?.delete();
      await FirebaseAuth.instance.signOut();
      // Navigate back to login screen
      Navigator.pop(context);
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.photoURL.isNotEmpty)
              CircleAvatar(
                backgroundImage: NetworkImage(widget.photoURL),
                radius: 50,
              ),
            const SizedBox(height: 20),
            Text(
              'Welcome, ${widget.displayName}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(widget.email),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: signOut,
        child: const Icon(Icons.logout),
      ),
    );
  }
}
