import 'package:flutter/material.dart';
import 'package:workmanager/workmanager.dart';
import 'screens/funny_screen.dart';
import 'screens/list_screen.dart';
import 'screens/real_time_screen.dart';
import 'screens/notification_screen.dart';
import 'widgets/bottom_nav_bar.dart';
import 'services/notification_service.dart';

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) {
    NotificationService().showNotification(); // Trigger a notification
    return Future.value(true);
  });
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager().initialize(
    callbackDispatcher,
    isInDebugMode: true, // Enable this for debugging
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    FunnyScreen(),
    ListScreen(),
    RealTimeScreen(),
    NotificationScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
