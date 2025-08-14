// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class NotificationService extends GetxService {
//   static final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
//   final FlutterLocalNotificationsPlugin _localNotificationsPlugin = FlutterLocalNotificationsPlugin();

//   final RxInt unreadCount = 0.obs;

//   Future<NotificationService> init() async {
//     await _requestPermissions();
//     await _initLocalNotifications();
//     _initFirebaseMessaging();
//     return this;
//   }

//   Future<void> _requestPermissions() async {
//     // iOS permissions
//     NotificationSettings settings = await _firebaseMessaging.requestPermission(
//       alert: true,
//       badge: true,
//       sound: true,
//     );

//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       print('🔔 Notification permission granted');
//     } else {
//       print('❌ Notification permission denied');
//     }
//   }

//   Future<void> _initLocalNotifications() async {
//     const AndroidInitializationSettings androidInitSettings = AndroidInitializationSettings('@mipmap/ic_launcher');

//     final DarwinInitializationSettings iosInitSettings = DarwinInitializationSettings();

//     final InitializationSettings initSettings = InitializationSettings(
//       android: androidInitSettings,
//       iOS: iosInitSettings,
//     );

//     await _localNotificationsPlugin.initialize(
//       initSettings,
//       onDidReceiveNotificationResponse: _onTapNotification,
//     );
//   }

//   void _initFirebaseMessaging() {
//     // Foreground
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       _showLocalNotification(message);
//       unreadCount.value++;
//     });

//     // When app opened from terminated state
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       _handleMessageClick(message);
//     });
//   }

//   Future<void> _showLocalNotification(RemoteMessage message) async {
//     const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
//       'default_channel_id',
//       'Default',
//       importance: Importance.max,
//       priority: Priority.high,
//     );

//     const NotificationDetails notificationDetails = NotificationDetails(
//       android: androidDetails,
//     );

//     await _localNotificationsPlugin.show(
//       message.hashCode,
//       message.notification?.title,
//       message.notification?.body,
//       notificationDetails,
//     );
//   }

//   void _onTapNotification(NotificationResponse response) {
//     // You can use payload to navigate
//     print("🟢 Notification tapped: ${response.payload}");
//     // Example:
//     // Get.to(() => NotificationDetailPage());
//   }

//   void _handleMessageClick(RemoteMessage message) {
//     print("📩 Message opened: ${message.data}");
//     // Example: navigate to a specific page using `message.data`
//   }

//   Future<String?> getFcmToken() async {
//     return await _firebaseMessaging.getToken();
//   }

//   Future<void> resetBadge() async {
//     unreadCount.value = 0;
//   }
// }
