import '../../features/auth/model/rider_details_model.dart';
import 'package:get_storage/get_storage.dart';

class LocalDatabaseRepo {
  static const String userDataBoxName = 'user_data';
  static final GetStorage box = GetStorage('box');

  Future<void> saveUserDataToLocalDB(Map<String, dynamic> data) async {
    await box.write(userDataBoxName, data);
  }

  Future<RiderDetailsModel> getUserDataFromLocalDB() async {
    final Map<String, dynamic> userData =
        await box.read(userDataBoxName) as Map<String, dynamic>;
    return RiderDetailsModel.fromMap(userData);
  }
}
