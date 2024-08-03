import 'package:flutter/material.dart';
import 'dart:async'; // Import untuk Timer
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late String _formattedDateTime;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _updateDateTime();
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      _updateDateTime();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateDateTime() {
    final DateTime now = DateTime.now();
    setState(() {
      _formattedDateTime = DateFormat('dd MMMM yyyy HH:mm:ss').format(now);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      body: Center(
        child: Text(
          'Welcome to Pam Students!\n$_formattedDateTime\n\nCreated by Indra Dwi A\nMy Portfolio: https://s.id/28RdC\n\nVersion 1.3.0\n© ${DateTime.now().year}. All rights reserved.',
          style: const TextStyle(color: Colors.black, fontSize: 18), // Set text color to black
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
