import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class AuthRepository {
  static Future<String?> register(
      String email, password, firstName, lastName) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.trim().toLowerCase(),
        password: password.trim().toLowerCase(),
      );
      final user = <String, dynamic>{
        "email": email.trim().toLowerCase(),
        "firstName": firstName.trim(),
        "lastName": lastName.trim(),
      };
      var key = FirebaseDatabase.instance.ref("users").push().key;
      var userRef = FirebaseDatabase.instance.ref("users/$key");
      userRef.set(user);
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
