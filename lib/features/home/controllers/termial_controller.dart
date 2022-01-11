import 'dart:developer';

import 'package:get/get.dart';
import 'package:onego_rider/cores/utils/snack_bar_service.dart';
import 'package:onego_rider/features/auth/services/auth_services.dart';
import 'package:onego_rider/features/home/model/terminal_model.dart';
import 'package:onego_rider/features/home/service/terminal_service.dart';

class TerminalController extends GetxController {
  static final TerminalService terminalService = TerminalService();
  static final AuthenticationRepo authenticationRepo =
      Get.find<AuthenticationRepo>();
  final RxList<TerminalModel> terminals = <TerminalModel>[].obs;
  Rx<TerminalModel>? selectedTerminalModel;
  final RxString selectedTerminalText = ''.obs;

  void updateSelectedTerminal(String text) {
    final TerminalModel _selectedTerminalModel =
        terminals.firstWhere((TerminalModel terminal) => terminal.name == text);

    selectedTerminalText.value = _selectedTerminalModel.name;
    selectedTerminalModel = Rx<TerminalModel>(_selectedTerminalModel);

    log('Selected Terminal: $_selectedTerminalModel');

    // update list
  }

  Future<void> getTerminals() async {
    try {
      terminals.value = await terminalService.getTerminals();
      // log('terminals: ${terminals.value}');
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      showErrorSnackBar(e.toString());
    }
  }

  @override
  void onReady() {
    getTerminals();
    super.onReady();
  }
}
