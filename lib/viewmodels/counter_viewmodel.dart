import 'package:flutter/material.dart';
import '../models/counter_model.dart';

class CounterViewModel extends ChangeNotifier {
  final CounterModel _counter = CounterModel(0);

  int get count => _counter.count;

  void increment() {
    _counter.count++;
    notifyListeners();
  }

  void decrement() {
    _counter.count--;
    notifyListeners();
  }

  void reset() {
    _counter.count = 0; // 👈 Reinicia el contador
    notifyListeners();
  }
}
