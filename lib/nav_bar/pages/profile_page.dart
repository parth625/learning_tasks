import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        color: Colors.red[200],
        child: Center(
          child: Text('Profile'),
        ),
      ),
    );
  }
}
