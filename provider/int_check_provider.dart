import 'package:flutter/material.dart';

class IntCheckProvider with ChangeNotifier {
  final List<int> _value = [10, 20, 20];
  List<int> get value => _value;
}
