import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';


class TimerWidgetManual extends StatefulWidget {
  const TimerWidgetManual({super.key, required this.duration});

  final int duration;

  @override
  State<TimerWidgetManual> createState() => _TimerWidgetManualState();
}

class _TimerWidgetManualState extends State<TimerWidgetManual> {
  late int _duration = widget.duration;
  final CountDownController _controller = CountDownController();

  @override
  void initState() {
    super.initState();
    _duration = widget.duration;
  }

  @override
  void didUpdateWidget(covariant TimerWidgetManual oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.duration != widget.duration) {
      setState(() {
        _duration = widget.duration;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularCountDownTimer(
            width: 200,
            height: 200,
            duration: _duration,
            controller: _controller,
            fillColor: Colors.blue,
            autoStart: false,
            backgroundColor: Colors.white,
            strokeWidth: 10,
            ringColor: Colors.grey,
            isReverseAnimation: false,
            isTimerTextShown: true,
            isReverse: true,
            onStart: () {
              debugPrint('Countdown Started');
            },
            onComplete: () {
              debugPrint('Timer is completed.');
            },
            onChange: (String timeStamp) {
              debugPrint('Countdown Changed $timeStamp');
            },
          ),
          Gap(30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () {
                  _controller.restart(duration: _duration);
                },
                child: const Icon(Icons.play_arrow),
              ),
              const SizedBox(width: 20),
              FloatingActionButton(
                onPressed: () {
                  _controller.pause();
                },
                child: const Icon(Icons.pause),
              ),
              const SizedBox(width: 20),
              FloatingActionButton(
                onPressed: () {
                  _controller.resume();
                },
                child: const Icon(Icons.play_arrow),
              ),
              const SizedBox(width: 20),
              FloatingActionButton(
                onPressed: () {
                  _controller.restart(duration: _duration);
                },
                child: const Icon(Icons.restart_alt),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

