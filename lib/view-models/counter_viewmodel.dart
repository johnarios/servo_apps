import 'package:flutter/material.dart';

class CounterViewModel extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void setIncrementCounter() async {
    _count++;
    notifyListeners();
  }
}