// user_token_model.dart
import 'package:firebase_auth/firebase_auth.dart';

class UserToken {
  UserCredential data;

  UserToken({required this.data});

  String get uid => data.user?.uid ?? '';
}
