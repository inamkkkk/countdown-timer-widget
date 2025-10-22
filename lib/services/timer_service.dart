import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimerService extends ChangeNotifier {
  late Duration _duration;
  late Timer _timer;
  Duration _currentTime;
  bool _isRunning = false;

  TimerService(Duration duration) : _duration = duration, _currentTime = duration;

  String get currentTime => _formatTime(_currentTime);
  bool get isRunning => _isRunning;

  void start() {
    _isRunning = true;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_currentTime.inSeconds > 0) {
        _currentTime = _currentTime - Duration(seconds: 1);
        notifyListeners();
      } else {
        _timer.cancel();
        _isRunning = false;
        notifyListeners();
      }
    });
  }

  void pause() {
    _timer.cancel();
    _isRunning = false;
    notifyListeners();
  }

  void reset() {
    _timer.cancel();
    _isRunning = false;
    _currentTime = _duration;
    notifyListeners();
  }

  String _formatTime(Duration duration) {
    final hours = duration.inHours.toString().padLeft(2, '0');
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }
}
