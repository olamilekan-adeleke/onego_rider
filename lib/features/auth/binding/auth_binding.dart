
import 'package:get/instance_manager.dart';
import 'package:onego_rider/features/auth/controllers/login_controller.dart';
import 'package:onego_rider/features/auth/controllers/register_controller.dart';
import 'package:onego_rider/features/auth/services/auth_services.dart';
import 'package:onego_rider/features/home/controllers/home_controller.dart';
import 'package:onego_rider/features/home/controllers/termial_controller.dart';

import '../../../cores/utils/local_database_repo.dart';
import '../controllers/auth_state_controller.dart';
import '../controllers/forgot_password_controller.dart';

class AuthenticationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LocalDatabaseRepo>(LocalDatabaseRepo());
    Get.put<AuthenticationRepo>(AuthenticationRepo());
    Get.put<AuthStateController>(AuthStateController());
    Get.put<RegisterController>(RegisterController());
    Get.put<LoginControllers>(LoginControllers());
    Get.put<ForgotPasswordController>(ForgotPasswordController());
  }
}


class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
    Get.put<TerminalController>(TerminalController());
    
  }
}
