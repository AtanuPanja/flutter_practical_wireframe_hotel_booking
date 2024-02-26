import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.logoutAction,
  });

  final VoidCallback logoutAction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeInn'),
      ),
      body: ElevatedButton(
        child: Text('Logout'),
        onPressed: () {
          Navigator.of(context).pop();
          logoutAction();
        },
      ),
    );
  }
}