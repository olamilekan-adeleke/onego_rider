import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onego_rider/cores/components/custom_button.dart';
import 'package:onego_rider/cores/components/custom_scaffold_widget.dart';
import 'package:onego_rider/cores/components/custom_text_widget.dart';
import 'package:onego_rider/cores/utils/sizer_utils.dart';
import 'package:onego_rider/cores/utils/snack_bar_service.dart';
import 'package:onego_rider/features/home/controllers/termial_controller.dart';
import 'package:onego_rider/features/home/model/terminal_model.dart';

class SelectTerminalScreen extends StatelessWidget {
  const SelectTerminalScreen({Key? key}) : super(key: key);

  static final TerminalController terminalController =
      Get.find<TerminalController>();

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWidget(
      body: SizedBox(
        height: sizerHeight(90),
        child: Padding(
          padding: EdgeInsets.all(sizerSp(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: sizerSp(15.0)),
              CustomTextWidget(
                'Select terminal',
                fontWeight: FontWeight.w600,
                fontSize: sizerSp(17),
                textAlign: TextAlign.center,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: terminalController.terminals.length,
                  itemBuilder: (_, int index) {
                    final TerminalModel terminal =
                        terminalController.terminals[index];

                    return Obx(() {
                      return CheckboxListTile(
                        value: terminalController.selectedTerminalText.value
                                .toLowerCase() ==
                            terminal.name.toLowerCase(),
                        title: CustomTextWidget(
                          terminal.name,
                          fontSize: sizerSp(15),
                          fontWeight: FontWeight.w600,
                        ),
                        onChanged: (_) => terminalController
                            .updateSelectedTerminal(terminal.name),
                      );
                    });
                  },
                ),
              ),
              const Spacer(),
              Obx(() {
                if (terminalController.selectedTerminalText.value.isEmpty) {
                  return CustomButton(
                    text: 'Continue',
                    onTap: () {
                      showWarningSnackBar('Select A Terminal!');
                    },
                    color: Colors.grey.shade400,
                  );
                }
                return CustomButton(
                  text: 'Continue',
                  onTap: () {},
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
