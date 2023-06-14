import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class ChatService {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

  Future<void> sendMessage(String messageText) async {
    await _fireStore.collection('messageReal').add({
      'textOfCus': messageText,
      'cusMail': getCurrentUser().email,
    });
  }

  auth.User getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        return user;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
