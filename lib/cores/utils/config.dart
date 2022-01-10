import 'package:get_storage/get_storage.dart' as storage;
import '../../features/notification/services/firebase_messaging_utils.dart';

class Config {
  

  /// init local database using get storage.
  static Future<void> setUpHiveLocalDB() async {
    await storage.GetStorage.init('box');
    await PushNotificationService.initNotification();
  }

}
