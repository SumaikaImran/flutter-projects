import 'package:check_internet/social_auth/home_page.dart';
import 'package:check_internet/social_auth/home_page1.dart';
import 'package:check_internet/social_auth/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final user = snapshot.data!;
            final providerId = user.providerData[0].providerId;

            // Detect the provider
            if (providerId == 'google.com') {
              return HomePage();
            } else if (providerId == 'facebook.com') {
              return HomePage1(
                displayName: user.displayName ?? '',
                email: user.email ?? '',
                photoURL: user.photoURL ?? '',
              );
            } else {
              // Fallback in case of unknown provider
              return Center(child: Text('Unknown login provider.'));
            }
          } else {
            return Login(); // Not signed in
          }
        },
      ),
    );
  }
}
