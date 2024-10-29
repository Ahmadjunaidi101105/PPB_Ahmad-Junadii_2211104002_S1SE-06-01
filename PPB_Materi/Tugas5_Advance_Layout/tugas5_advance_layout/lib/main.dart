import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'mypage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    super.initState();
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    const initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    const initializationSettingsIOS = IOSInitializationSettings();
    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) async {
        final payload = notificationResponse.payload;
        if (payload != null) {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            return MyPage(payload: payload);
          }));
        }
      },
    );
  }

  Future<void> showNotification() async {
    const android = AndroidNotificationDetails(
      'id', 'channel', 'description',
      priority: Priority.high,
      importance: Importance.max,
    );
    const iOS = IOSNotificationDetails();
    const platform = NotificationDetails(android: android, iOS: iOS);
    await flutterLocalNotificationsPlugin.show(
      0,
      'Notification Title',
      'This is the notification body',
      platform,
      payload: 'Welcome to the Notification demo',
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter Navigation and Notification Demo')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyPage(payload: 'Hello from Main Page!')),
                  );
                },
                child: const Text('Navigate to My Page'),
              ),
              ElevatedButton(
                onPressed: showNotification,
                child: const Text('Show Notification'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
