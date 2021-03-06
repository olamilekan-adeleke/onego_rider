import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onego_rider/features/auth/model/rider_details_model.dart';
import '../../../cores/constants/error_text.dart';
import '../../../cores/utils/emums.dart';
import '../../../cores/utils/logger.dart';
import '../../../cores/utils/snack_bar_service.dart';
import '../services/auth_services.dart';

class LoginControllers extends GetxController {
  final Rx<ControllerState> _controllerStateEnum = ControllerState.init.obs;
  static final AuthenticationRepo _authenticationRepo =
      Get.find<AuthenticationRepo>();
  final TextEditingController emailController =
      TextEditingController(text: ' ola@gmail.com');
  final TextEditingController passwordController =
      TextEditingController(text: 'test123456');

  ControllerState get controllerStateEnum => _controllerStateEnum.value;

  Future<void> loginUser() async {
    _controllerStateEnum.value = ControllerState.busy;
    try {
      final RiderDetailsModel userDetails =
          await _authenticationRepo.loginUserWithEmailAndPassword(
        emailController.text.trim(),
        passwordController.text.trim(),
      );
      _controllerStateEnum.value = ControllerState.success;

      if (userDetails.hasCreateWalletPin == false) {
        Get.toNamed('/create-wallet-pin');
      } else {
        Get.offAllNamed('/home');
      }

      CustomSnackBarService.showSuccessSnackBar('Success', 'Login Successful!');
    } on SocketException {
      _controllerStateEnum.value = ControllerState.error;
      CustomSnackBarService.showErrorSnackBar(
        'Error',
        noInternetConnectionText,
      );
    } catch (e, s) {
      errorLog('$e', 'Error logging in user', title: 'login', trace: '$s');
      _controllerStateEnum.value = ControllerState.error;
      CustomSnackBarService.showErrorSnackBar('Error', e.toString());
    }
  }
}
