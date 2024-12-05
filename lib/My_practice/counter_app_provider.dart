import 'package:flutter/material.dart';

class ContertwoPrvider extends ChangeNotifier {
  int count = 0, count2 = 0;
  void increment1() {
    count++;
    notifyListeners();
  }

  void decremnt1() {
    count--;
    notifyListeners();
  }

  void increment2() {
    count2++;
    count2 += 1;
    notifyListeners();
  }

  void decremnt2() {
    count2--;
    count2 -= 1;
    notifyListeners();
  }
}
