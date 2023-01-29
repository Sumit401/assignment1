import 'dart:async';

import 'package:flutter/material.dart';

class TimerProvider extends ChangeNotifier{

  int timerData = 60;

  void startTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      timerData--;
      notifyListeners();
    });
    notifyListeners();
  }
}