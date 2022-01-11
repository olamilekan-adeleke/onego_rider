import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onego_rider/cores/components/custom_button.dart';
import 'package:onego_rider/cores/components/custom_text_widget.dart';
import 'package:onego_rider/cores/utils/sizer_utils.dart';
import 'package:onego_rider/features/home/controllers/termial_controller.dart';

class MarkAsAvailableScreen extends StatelessWidget {
  const MarkAsAvailableScreen({Key? key}) : super(key: key);

  static final TerminalController terminalController =
      Get.find<TerminalController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: sizerHeight(95),
          child: Padding(
            padding: EdgeInsets.all(sizerSp(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: sizerSp(40.0)),
                CustomTextWidget(
                  'Please ensure you are at the terminal before tapping the Confirm button to avoid  unnecessary delay of passengers and to aviod any form of sanction.',
                  fontWeight: FontWeight.w600,
                  fontSize: sizerSp(16),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: sizerSp(40.0)),
                Obx(() {
                  return DropdownButton<int>(
                    hint: const Text('Select Number of available seat'),
                    isExpanded: true,
                    value: terminalController.seatNumber.value,
                    items: seatNumber.map((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                    onChanged: (int? val) {
                      if (val == null) return;
                      terminalController.seatNumber.value = val;
                    },
                  );
                }),
                SizedBox(height: sizerSp(40.0)),
                CustomTextWidget(
                  'By tapping the Confirm button, you confirm to be;',
                  fontWeight: FontWeight.w300,
                  fontSize: sizerSp(14),
                ),
                SizedBox(height: sizerSp(5.0)),
                CustomTextWidget(
                  '1. At the terminal',
                  fontWeight: FontWeight.w300,
                  fontSize: sizerSp(14),
                ),
                CustomTextWidget(
                  '2. Ready to pickup passengers',
                  fontWeight: FontWeight.w300,
                  fontSize: sizerSp(14),
                ),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: 'Cancel',
                        color: Colors.grey.shade400,
                        onTap: () {
                          Get.back();
                          Get.back();
                        },
                      ),
                    ),
                    SizedBox(width: sizerSp(40.0)),
                    Expanded(
                      child: CustomButton(
                        text: 'Confirm',
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}

const List<int> seatNumber = [
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  12,
  13,
  14,
  15,
  16,
  17,
  18,
  19,
  20
];
