import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  static Future<String?> register(
      String email, password, firstName, lastName) async {
    try {
      var db = FirebaseFirestore.instance;
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.trim().toLowerCase(),
        password: password.trim().toLowerCase(),
      );
      final user = <String, dynamic>{
        "firstName": firstName.trim(),
        "lastName": lastName.trim(),
      };
      await db.collection("users").doc(email.trim().toLowerCase()).set(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'Пользователь не найден';
      } else if (e.code == 'wrong-password') {
        return 'Неверные данные для входа';
      } else if (e.code == 'invalid-credential') {
        return 'Неверные данные для входа';
      }
    }
    return null;
  }

  static login(String email, password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim().toLowerCase(),
        password: password.trim().toLowerCase(),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'Пользователь не найден';
      } else if (e.code == 'wrong-password') {
        return 'Неверные данные для входа';
      } else if (e.code == 'invalid-credential') {
        return 'Неверные данные для входа';
      }
    }
    return null;
  }
}
