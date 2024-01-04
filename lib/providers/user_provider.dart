import 'package:flutter/foundation.dart';
import 'package:instagram_clone_app/models/user.dart';
import 'package:instagram_clone_app/resources/auth_methods.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final AuthMethods _authMethods = AuthMethods();

  User? get user => _user;

  void refreshUser() async {
    _user = await _authMethods.getUserDetails();
    notifyListeners();
  }
}
