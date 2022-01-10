import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../cores/constants/error_text.dart';
import '../../../cores/utils/emums.dart';
import '../../../cores/utils/logger.dart';
import '../../../cores/utils/snack_bar_service.dart';
import '../services/auth_services.dart';

class RegisterController extends GetxController {
  final Rx<ControllerState> _controllerStateEnum = ControllerState.init.obs;
  final Rx<ControllerState> smsState = ControllerState.init.obs;
  final Rx<ControllerState> createWalletPinState = ControllerState.init.obs;
  final Rx<ControllerState> imageState = ControllerState.init.obs;
  static final AuthenticationRepo _authenticationRepo =
      Get.find<AuthenticationRepo>();
  final TextEditingController firstnameController =
      TextEditingController(text: '');
  final TextEditingController lastnameController =
      TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController smsCodeController =
      TextEditingController(text: '');
  final TextEditingController walletPinController =
      TextEditingController(text: '');
  final TextEditingController usernameController =
      TextEditingController(text: '');
  final TextEditingController phoneController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');
  final TextEditingController confirmPasswordController =
      TextEditingController(text: '');
  final RxString filePath = ''.obs;
  final ImagePicker _picker = ImagePicker();

  ControllerState get controllerStateEnum => _controllerStateEnum.value;

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      filePath.value = image.path;
    }
  }

  Future<void> uploadImage() async {
    if (filePath.isEmpty) return;

    try {
      imageState.value = ControllerState.busy;
      final String? url =
          await _authenticationRepo.uploadImage(File(filePath.value));

      log(url.toString());

      if (url != null) {
        await _authenticationRepo.updateProfilePicUrl(url);
      }

      CustomSnackBarService.showSuccessSnackBar(
        'Success',
        'Image Updated Successfully!',
      );

      await Future<dynamic>.delayed(const Duration(milliseconds: 500));

      Get.offNamed('create-wallet-pin');

      imageState.value = ControllerState.success;
    } catch (e, s) {
      imageState.value = ControllerState.error;
      CustomSnackBarService.showErrorSnackBar('Error', e.toString());
      log(e.toString());
      log(s.toString());
    }
  }

  Future<void> registerUser() async {
    _controllerStateEnum.value = ControllerState.busy;

    try {
      await _authenticationRepo.registerUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        fullName: '${firstnameController.text.trim()}'
            ' ${lastnameController.text.trim()}',
        number: phoneController.text.trim(),
        username: usernameController.text.trim(),
      );
      _controllerStateEnum.value = ControllerState.success;
      Get.offNamed('update-profile');
      CustomSnackBarService.showSuccessSnackBar(
        'Success',
        'Account Successfully Created!',
      );
    } on SocketException {
      _controllerStateEnum.value = ControllerState.error;
      CustomSnackBarService.showErrorSnackBar(
        'Error',
        noInternetConnectionText,
      );
    } catch (e, s) {
      errorLog('$e', 'Error signing up in user', title: 'sign up', trace: '$s');

      _controllerStateEnum.value = ControllerState.error;
      CustomSnackBarService.showErrorSnackBar('Error', e.toString());
    }
  }

  Future<void> createWalletPin() async {
    if (walletPinController.text.trim().isEmpty) {
      return CustomSnackBarService.showWarningSnackBar(
        'Error',
        'Please Enter Wallet Pin!',
      );
    }

    try {
      createWalletPinState.value = ControllerState.busy;

      final walletPin = walletPinController.text.trim();

      await _authenticationRepo.createWalletPin(walletPin);

      // log(url.toString());

      // if (url != null) {
      //   await _authenticationRepo.updateProfile(url);
      // }

      CustomSnackBarService.showSuccessSnackBar(
        'Success',
        'Wallet Pin Successfully Created!',
      );

      await Future<dynamic>.delayed(const Duration(milliseconds: 500));

      Get.offAllNamed('/home');

      createWalletPinState.value = ControllerState.success;
    } catch (e, s) {
      createWalletPinState.value = ControllerState.error;
      CustomSnackBarService.showErrorSnackBar('Error', e.toString());
      log(e.toString());
      log(s.toString());
    }
  }

  @override
  void onInit() {
    super.onInit();
    if (kDebugMode) {
      firstnameController.text = 'test';
      lastnameController.text = 'rider';
      usernameController.text = 'rider-kodx';
      emailController.text = 'ola100@gmail.com';
      phoneController.text = '07052936789'; // '09016468355'
      passwordController.text = 'test123456';
      confirmPasswordController.text = 'test123456';
    }
  }
}
