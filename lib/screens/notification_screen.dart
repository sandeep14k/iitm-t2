import 'package:flutter/material.dart';
import '../services/notification_service.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final NotificationService notificationService = NotificationService();

  @override
  void initState() {
    super.initState();
    requestNotificationPermission();
    notificationService.init();
  }

  Future<void> requestNotificationPermission() async {
    if (await Permission.notification.isDenied) {
      await Permission.notification.request();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notification Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => notificationService.showNotification(),
          child: Text('Show Notification'),
        ),
      ),
    );
  }
}
