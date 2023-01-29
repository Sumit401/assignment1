import 'dart:async';

import 'package:flutter/material.dart';

class TimerProvider extends ChangeNotifier{

  int timerData = 45;

  void startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if(timerData>0) {
        timerData--;
        notifyListeners();
      }else{
        print("cancel");
        timerData = -10;
        timer.cancel();
        notifyListeners();
      }
      notifyListeners();
    });
    notifyListeners();
  }
}