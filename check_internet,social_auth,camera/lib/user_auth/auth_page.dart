import 'package:check_internet/user_auth/auth_service.dart';
import 'package:check_internet/user_auth/home_page.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  void initState() {
    super.initState();
    authInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Local Auth')),
      body: Center(
        child: IconButton(
          onPressed: () async {
            authInit();
          },
          icon: Icon(Icons.fingerprint, size: 70),
        ),
      ),
    );
  }

  void authInit() async {
    bool check = await AuthService().authenticateLocally();
    if (check) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
  }
}
