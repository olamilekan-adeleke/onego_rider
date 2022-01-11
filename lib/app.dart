import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onego_rider/features/auth/views/pages/wrapper.dart';
import 'package:sizer/sizer.dart';

import 'cores/constants/color.dart';
import 'cores/utils/route_name.dart';
import 'features/auth/binding/auth_binding.dart';
import 'features/auth/views/pages/forgot_password_screen.dart';
import 'features/auth/views/pages/login_screen.dart';
import 'features/auth/views/pages/set_wallet_pin_screen.dart';
import 'features/auth/views/pages/signup_screen.dart';
import 'features/auth/views/pages/update_profile_screen.dart';
import 'features/home/controllers/home_controller.dart';
import 'features/home/views/screens/home_screen.dart';

class OneGoRiderApp extends StatelessWidget {
  const OneGoRiderApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (_, __, ___) {
      return GetMaterialApp(
        enableLog: true,
        defaultTransition: Transition.cupertino,
        opaqueRoute: Get.isOpaqueRouteDefault,
        popGesture: Get.isPopGestureEnable,
        title: '1go Rider',
        theme: ThemeData(
          primaryColor: kcPrimaryColor,
          backgroundColor: const Color(0xffECE8E8),
        ),
        initialRoute: RouteName.login,
        getPages: pages(),
        initialBinding: AuthenticationBinding(),
      );
    });
  }
}

List<GetPage<dynamic>>? pages() {
  return <GetPage<dynamic>>[
    GetPage<Widget>(
      page: () => const WrapperScreen(),
      name: '/',
    ),
    GetPage<Widget>(
      page: () => const LoginScreen(),
      name: RouteName.login,
    ),
    GetPage<Widget>(
      page: () => const SignUpScreen(),
      name: RouteName.signUp,
    ),
    GetPage<Widget>(
      page: () => const ForgotPasswordScreen(),
      name: RouteName.forgotPassword,
    ),
    GetPage<Widget>(
      page: () => const HomeScreen(),
      name: RouteName.home,
      bindings: [HomeBinding()],
    ),
    GetPage<Widget>(
      page: () => const UpdateProfilePicScreen(),
      name: '/update-profile',
    ),
    GetPage<Widget>(
      page: () => const CreateWalletPinScreen(),
      name: '/create-wallet-pin',
    ),
  ];
}
