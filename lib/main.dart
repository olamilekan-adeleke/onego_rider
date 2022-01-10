import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:onego_rider/app.dart';

import 'features/notification/services/firebase_messaging_utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await PushNotificationService.initNotification();
  runApp(const OneGoRiderApp());
}
