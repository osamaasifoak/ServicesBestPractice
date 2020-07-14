import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseServiceClass {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  Future<String> requestGenerateToken() async {
    return await _firebaseMessaging.getToken();
  }

  configureFirebase() {
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
      // onBackgroundMessage: Platform.isIOS ? null : myBackgroundMessageHandler,
    );
  }

  requestNotificationPermission() {
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(
            sound: true, badge: true, alert: true, provisional: true));
  }

  registeredIosSettings() {
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings _iosNotificationSettings) {
      print(_iosNotificationSettings);
    });
  }

  static Future<dynamic> myBackgroundMessageHandler(
      Map<String, dynamic> message) {
    print('AppPushs myBackgroundMessageHandler : $message');
    return Future<void>.value();
  }
}
