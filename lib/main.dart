import 'package:flutter/material.dart';
import 'screens/chatgpt.dart';
import 'screens/elearning_server1.dart';
import 'screens/elearning_server2.dart';
import 'screens/event_unpam.dart';
import 'screens/event_unpam2.dart';
import 'screens/google.dart';
import 'screens/home.dart';
import 'screens/my_unpam.dart';
import 'screens/my_unpam2.dart';
import 'screens/updateaplikasi.dart';
import 'screens/website_author.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pam Students',
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
  bool _isDesktopMode = false;

  List<Widget> _getPages() {
    return [
      const HomeScreen(),
      WebsiteAuthorScreen(isDesktopView: _isDesktopMode),
      ChatGPTScreen(isDesktopView: _isDesktopMode),
      ElearningServer1Screen(isDesktopView: _isDesktopMode),
      ElearningServer2Screen(isDesktopView: _isDesktopMode),
      EventUnpamScreen(isDesktopView: _isDesktopMode),
      EventUnpam2Screen(isDesktopView: _isDesktopMode),
      GoogleScreen(isDesktopView: _isDesktopMode),
      MyUnpamScreen(isDesktopView: _isDesktopMode),
      MyUnpam2Screen(isDesktopView: _isDesktopMode),
      UpdateAplikasi(isDesktopView: _isDesktopMode),
    ];
  }

  void _toggleDesktopMode() {
    setState(() {
      _isDesktopMode = !_isDesktopMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pam Students'),
        actions: [
          IconButton(
            icon: Icon(_isDesktopMode ? Icons.phone_android : Icons.desktop_windows),
            onPressed: _toggleDesktopMode,
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
              _buildDrawerItem('Home', 0, Icons.home),
              _buildDrawerItem('Author', 1, Icons.person),
              _buildDrawerItem('ChatGPT', 2, Icons.chat),
              _buildDrawerItem('E-Learning 1', 3, Icons.school),
              _buildDrawerItem('E-Learning 2', 4, Icons.school),
              _buildDrawerItem('Event Unpam 1', 5, Icons.event),
              _buildDrawerItem('Event Unpam 2', 6, Icons.event),
              _buildDrawerItem('Google', 7, Icons.search),
              _buildDrawerItem('My Unpam', 8, Icons.home),
              _buildDrawerItem('My Unpam 2', 9, Icons.home),
              _buildDrawerItem('Update Aplikasi', 10, Icons.update),
            ],
          ),
        ),
      ),
      body: _getPages()[_selectedIndex],
    );
  }

  Widget _buildDrawerItem(String title, int index, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      onTap: () {
        Navigator.pop(context);
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }
}
