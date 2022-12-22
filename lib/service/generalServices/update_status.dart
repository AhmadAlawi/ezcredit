import 'package:flutter/material.dart';

class ClickStatus extends ChangeNotifier {
  int click = 0;

  ClickStatus({required this.click});

  void updateClick() {
    click++;
    notifyListeners();
  }

  void decreaseClick() {
    click--;
    notifyListeners();
  }
}
