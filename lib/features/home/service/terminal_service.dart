import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:onego_rider/features/auth/services/auth_services.dart';
import 'package:onego_rider/features/home/model/terminal_model.dart';

class TerminalService {
  static final AuthenticationRepo authenticationRepo =
      Get.find<AuthenticationRepo>();
  static final CollectionReference terminalRef =
      FirebaseFirestore.instance.collection('terminals');
  final CollectionReference<dynamic> userCollectionRef =
      FirebaseFirestore.instance.collection('users');

  Future<List<TerminalModel>> getTerminals() async {
    final QuerySnapshot<Object?> querySnapshot = await terminalRef.get();

    final List<TerminalModel> list =
        querySnapshot.docs.map((QueryDocumentSnapshot<Object?> doc) {
      return TerminalModel.fromMap(<String, dynamic>{
        ...(doc.data() ?? {}) as Map<String, dynamic>,
        'id': doc.id,
      });
    }).toList();

    return list;
  }
}
