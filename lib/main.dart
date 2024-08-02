import 'package:flutter/material.dart';
import 'screens/google.dart';
import 'screens/my_unpam.dart';
import 'screens/my_unpam2.dart';
import 'screens/elearning_server1.dart';
import 'screens/elearning_server2.dart';
import 'screens/website_author.dart';
import 'screens/chatgpt.dart';
import 'screens/updateaplikasi.dart';
import 'screens/event_unpam.dart'; // Import the new screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pam Students by Indra Dwi A',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  bool _isDesktopView = false;

  final List<Widget> _pages = [
    const MyUnpamScreen(isDesktopView: false),
    const MyUnpam2Screen(isDesktopView: false),
    const ElearningServer1Screen(isDesktopView: false),
    const ElearningServer2Screen(isDesktopView: false),
    const WebsiteAuthorScreen(isDesktopView: false),
    const ChatGPTScreen(),
    const GoogleScreen(),
    const UpdateAplikasi(),
    const EventUnpamScreen(), // Added Event Unpam Screen
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pam Students by Indra Dwi A'),
        actions: [
          IconButton(
            icon: Icon(_isDesktopView ? Icons.phone_android : Icons.desktop_windows),
            onPressed: () {
              setState(() {
                _isDesktopView = !_isDesktopView;
                for (var i = 0; i < _pages.length - 1; i++) {
                  _pages[i] = _updatePageView(i);
                }
              });
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.black,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home, color: Colors.white),
                title: const Text('My Unpam', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    _selectedIndex = 0;
                    _pages[0] = MyUnpamScreen(isDesktopView: _isDesktopView);
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.home, color: Colors.white),
                title: const Text('My Unpam 2', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    _selectedIndex = 1;
                    _pages[1] = MyUnpam2Screen(isDesktopView: _isDesktopView);
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.school, color: Colors.white),
                title: const Text('E-Learning 1', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    _selectedIndex = 2;
                    _pages[2] = ElearningServer1Screen(isDesktopView: _isDesktopView);
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.school, color: Colors.white),
                title: const Text('E-Learning 2', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    _selectedIndex = 3;
                    _pages[3] = ElearningServer2Screen(isDesktopView: _isDesktopView);
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.person, color: Colors.white),
                title: const Text('Author', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    _selectedIndex = 4;
                    _pages[4] = WebsiteAuthorScreen(isDesktopView: _isDesktopView);
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.chat, color: Colors.white),
                title: const Text('ChatGPT', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    _selectedIndex = 5;
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.search, color: Colors.white), // Icon for Google
                title: const Text('Google', style: TextStyle(color: Colors.white)), // Title for Google
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    _selectedIndex = 6; // Update to GoogleScreen index
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.update, color: Colors.white),
                title: const Text('Update Aplikasi', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    _selectedIndex = 7;
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.event, color: Colors.white), // Icon for Event Unpam
                title: const Text('Event Unpam', style: TextStyle(color: Colors.white)), // Title for Event Unpam
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    _selectedIndex = 8; // Update to EventUnpamScreen index
                  });
                },
              ),
            ],
          ),
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }

  Widget _updatePageView(int index) {
    switch (index) {
      case 0:
        return MyUnpamScreen(isDesktopView: _isDesktopView);
      case 1:
        return MyUnpam2Screen(isDesktopView: _isDesktopView);
      case 2:
        return ElearningServer1Screen(isDesktopView: _isDesktopView);
      case 3:
        return ElearningServer2Screen(isDesktopView: _isDesktopView);
      case 4:
        return WebsiteAuthorScreen(isDesktopView: _isDesktopView);
      case 5:
        return const ChatGPTScreen();
      case 6:
        return const GoogleScreen();
      case 7:
        return const UpdateAplikasi();
      case 8:
        return const EventUnpamScreen();
      default:
        return const SizedBox();
    }
  }
}
