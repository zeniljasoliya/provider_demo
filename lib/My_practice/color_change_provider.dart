import 'package:flutter/material.dart';

class ColorChangeProvider extends ChangeNotifier {
  int? oldIndex, newIndex;
  bool flag = true;
  List<Map<String, dynamic>> griddata = [
    {
      'color': Colors.blue.shade500,
    },
    {
      'color': Colors.red,
    },
    {
      'color': Colors.amber,
    },
    {
      'color': Colors.black,
    },
    {
      'color': Colors.green,
    },
    {
      'color': Colors.deepOrange,
    },
    {
      'color': Colors.pink,
    },
    {
      'color': Colors.purple,
    },
    {
      'color': Colors.cyan,
    }
  ];

  void selectColor(int index) {
    if (flag == true) {
      oldIndex = index;
      flag = false;
    } else {
      newIndex = index;
      Map<String, dynamic> tempData = griddata[oldIndex!];
      griddata[oldIndex!] = griddata[newIndex!];
      griddata[newIndex!] = tempData;
      flag = true;
    }
    notifyListeners();
  }
}
