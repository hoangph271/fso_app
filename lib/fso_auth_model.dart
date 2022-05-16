import 'package:flutter/foundation.dart';

class FsoAuthModel extends ChangeNotifier {
  String? _username;

  void signin(String username) {
    _username = username;
    notifyListeners();
  }

  void signout() {
    _username = null;
    notifyListeners();
  }

  bool isAuthed() {
    return _username != null;
  }
}
