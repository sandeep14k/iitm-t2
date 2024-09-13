import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:workmanager/workmanager.dart';
import '../services/notification_service.dart';

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

  void scheduleNotification() {
    Workmanager().registerPeriodicTask(
      'task_id', // A unique task ID
      'simpleTask', // The name of the task
      frequency: Duration(minutes: 5), // Repeat every hour
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notification Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => notificationService.showNotification(),
              child: Text('Show Notification Now'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: scheduleNotification,
              child: Text('Schedule Hourly Notification'),
            ),
          ],
        ),
      ),
    );
  }
}
