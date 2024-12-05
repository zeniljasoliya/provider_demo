import 'package:flutter/material.dart';

class CounterProvide extends ChangeNotifier {
  int count = 0;

  void increment() {
    count++;
    print('$count');
    notifyListeners();
  }
}
