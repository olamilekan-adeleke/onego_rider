import 'package:onego_rider/cores/components/custom_textfiled.dart';
import 'package:onego_rider/cores/utils/validator.dart';

import '../../../../cores/components/custom_button.dart';
import '../../../../cores/components/custom_scaffold_widget.dart';
import '../../../../cores/components/custom_text_widget.dart';
import '../../../../cores/utils/emums.dart';
import '../../../../cores/utils/sizer_utils.dart';
import '../../../../features/auth/controllers/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
// import 'package:sms_autofill/sms_autofill.dart';

class CreateWalletPinScreen extends StatelessWidget {
  const CreateWalletPinScreen({Key? key}) : super(key: key);

  static final RegisterController registerController =
      Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWidget(
      body: ListView(
        children: [
          SizedBox(height: sizerSp(50)),
          Center(
            child: SvgPicture.asset(
              'assets/images/wallet.svg',
              height: sizerSp(100),
              width: sizerSp(150),
            ),
          ),
          SizedBox(height: sizerSp(40)),
          CustomTextWidget(
            'Wallet Setup',
            fontWeight: FontWeight.w600,
            fontSize: sizerSp(18),
          ),
          CustomTextWidget(
            'All transactions shall be made via your wallet',
            fontWeight: FontWeight.w300,
            fontSize: sizerSp(13),
          ),
          SizedBox(height: sizerSp(30)),
          CustomTextWidget(
            'Create your wallet PIN',
            fontWeight: FontWeight.w600,
            fontSize: sizerSp(18),
          ),
          SizedBox(height: sizerSp(20)),
          // PinFieldAutoFill(
          //   codeLength: 4,
          //   decoration: UnderlineDecoration(
          //     textStyle: const TextStyle(fontSize: 20, color: Colors.black),
          //     colorBuilder: FixedColorBuilder(Colors.black.withOpacity(0.3)),
          //   ),
          //   onCodeChanged: (String? code) {
          //     if (code!.length == 4) {
          //       FocusScope.of(context).requestFocus(FocusNode());
          //     }

          //     registerController.walletPinController.text = code;
          //   },
          // ),
          CustomTextField(
            hintText: 'Enter Wallet Pin',
            textEditingController: registerController.walletPinController,
            validator: (String? value) =>
                formFieldValidator(value, 'wallet pin', 3),
          ),
          SizedBox(height: sizerSp(60)),
          Obx(() {
            if (registerController.createWalletPinState.value ==
                ControllerState.busy) {
              return const CustomButton.loading();
            }
            return CustomButton(
              text: 'Create Pin',
              onTap: () => registerController.createWalletPin(),
            );
          }),
        ],
      ),
    );
  }
}
