import 'package:flutter/material.dart';

class TicTocProvider extends ChangeNotifier {
  List<String> data = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  bool flag = true;
  String x = 'X';
  String o = 'O';
  int player = 0;
  int playerX = 0;
  int playerO = 0;

  void tapcontainer(int index, BuildContext context) {
    if (flag == true) {
      // ignore: unrelated_type_equality_checks
      if (data[index] != x && data[index] != 0) {
        data[index] = x;
        flag = false;
      }
    } else {
      // ignore: unrelated_type_equality_checks
      if (data[index] != x && data[index] != 0) {
        data[index] = o;
        flag = true;
      }
    }
    notifyListeners();
  }

  void checkcondition() {
//xxxxxx.........................
//Row
    if (data[0] == x && data[1] == x && data[2] == x) {
      player = 1;
      playerX++;
      reset();
      flag = true;
    }
    if (data[3] == x && data[4] == x && data[5] == x) {
      player = 1;
      playerX++;
      reset();
      flag = true;
    }
    if (data[6] == x && data[7] == x && data[8] == x) {
      player = 1;
      playerX++;
      reset();
      flag = true;
    }

    //Column
    if (data[0] == x && data[3] == x && data[6] == x) {
      player = 1;
      playerX++;
      reset();
      flag = true;
    }
    if (data[1] == x && data[4] == x && data[7] == x) {
      player = 1;
      playerX++;
      reset();
      flag = true;
    }
    if (data[2] == x && data[5] == x && data[8] == x) {
      player = 1;
      playerX++;
      reset();
      flag = true;
    }

    //Diagonal
    if (data[0] == x && data[4] == x && data[8] == x) {
      player = 1;
      playerX++;
      reset();
      flag = true;
    }
    if (data[2] == x && data[4] == x && data[6] == x) {
      player = 1;
      playerX++;
      reset();
      flag = true;
    }

    //oooooo.........................
//Row
    if (data[0] == o && data[1] == o && data[2] == o) {
      player = 2;
      playerO++;
      reset();
      flag = true;
    }
    if (data[3] == o && data[4] == o && data[5] == o) {
      player = 2;
      playerO++;
      reset();
      flag = true;
    }
    if (data[6] == o && data[7] == o && data[8] == o) {
      player = 2;
      playerO++;
      reset();
      flag = true;
    }

    //Column
    if (data[0] == o && data[3] == o && data[6] == o) {
      player = 2;
      playerO++;
      reset();
      flag = true;
    }
    if (data[1] == o && data[4] == o && data[7] == o) {
      player = 2;
      playerO++;
      reset();
      flag = true;
    }
    if (data[2] == o && data[5] == o && data[8] == o) {
      player = 2;
      playerO++;
      reset();
      flag = true;
    }

    //Diagonal
    if (data[0] == o && data[4] == o && data[8] == o) {
      player = 2;
      playerO++;
      reset();
      flag = true;
    }
    if (data[2] == o && data[4] == o && data[6] == o) {
      player = 2;
      playerO++;
      reset();
      flag = true;
    }
    notifyListeners();

    // row
    // if ((data[0] == x && data[1] == x && data[2] == x) &&
    //     (data[0] == o && data[1] == o && data[2] == o)) {
    //   player = 1;
    //   player = 2;
    //   playerX++;
    //   playerO++;
    //   reset();
    //   flag = true;
    // }
    // if ((data[3] == x && data[4] == x && data[5] == x) &&
    //     (data[3] == o && data[4] == o && data[5] == o)) {
    //   player = 1;
    //   player = 2;
    //   playerX++;
    //   playerO++;
    //   reset();
    //   flag = true;
    // }
    // if ((data[6] == x && data[7] == x && data[8] == x) &&
    //     (data[6] == o && data[7] == o && data[8] == o)) {
    //   player = 1;
    //   player = 2;
    //   playerX++;
    //   playerO++;
    //   reset();
    //   flag = true;
    // }

    // column
    // if ((data[0] == x && data[3] == x && data[6] == x) &&
    //     (data[0] == o && data[3] == o && data[6] == o)) {
    //   player = 1;
    //   player = 2;
    //   playerX++;
    //   playerO++;
    //   reset();
    //   flag = true;
    // }
    // if ((data[1] == x && data[4] == x && data[7] == x) &&
    //     (data[1] == o && data[4] == o && data[7] == o)) {
    //   player = 1;
    //   player = 2;
    //   playerX++;
    //   playerO++;
    //   reset();
    //   flag = true;
    // }
    // if ((data[2] == x && data[5] == x && data[8] == x) &&
    //     (data[2] == o && data[5] == o && data[8] == o)) {
    //   player = 1;
    //   player = 2;
    //   playerX++;
    //   playerO++;
    //   reset();
    //   flag = true;
    // }

    // cross
    // if ((data[0] == x && data[4] == x && data[8] == x) &&
    //     (data[0] == o && data[4] == o && data[8] == o)) {
    //   player = 1;
    //   player = 2;
    //   playerX++;
    //   playerO++;
    //   reset();
    //   flag = true;
    // }
    // if ((data[2] == x && data[4] == x && data[6] == x) &&
    //     (data[2] == o && data[4] == o && data[6] == o)) {
    //   player = 1;
    //   player = 2;
    //   playerX++;
    //   playerO++;
    //   reset();
    //   flag = true;
    // }
  }

  void reset() {
    data = [
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
    ];
    notifyListeners();
  }

  restart() {
    reset();
    playerX = 0;
    playerO = 0;
    notifyListeners();
  }
}
