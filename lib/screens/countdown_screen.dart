import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:countdown_timer/services/timer_service.dart';

class CountdownScreen extends StatefulWidget {
  final Duration duration;

  CountdownScreen({required this.duration});

  @override
  _CountdownScreenState createState() => _CountdownScreenState();
}

class _CountdownScreenState extends State<CountdownScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider( 
      create: (context) => TimerService(widget.duration),
      child: Scaffold(
        appBar: AppBar(title: Text('Countdown Timer')), 
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Consumer<TimerService>(
                builder: (context, timerService, child) {
                  return Text(
                    timerService.currentTime,
                    style: TextStyle(fontSize: 48),
                  );
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<TimerService>(
                    builder: (context, timerService, child) {
                      return ElevatedButton(
                        onPressed: timerService.isRunning ? timerService.pause : timerService.start,
                        child: Text(timerService.isRunning ? 'Pause' : 'Start'),
                      );
                    },
                  ),
                  SizedBox(width: 20),
                  Consumer<TimerService>(
                    builder: (context, timerService, child) {
                      return ElevatedButton(
                        onPressed: timerService.reset,
                        child: Text('Reset'),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
