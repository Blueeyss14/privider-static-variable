import 'package:flutter/material.dart';

class BoolCheckProvider with ChangeNotifier {
  List<bool> _checkToggle = List.filled(3, false);
  List<bool> get checkToggle => _checkToggle;

  void boolCheckToggle(int index) {
    _checkToggle[index] = !_checkToggle[index];
    notifyListeners();
  }
}
