import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:super_life_app/providers/timer_provider.dart';

class TimerPreferenceListWidget extends StatelessWidget {
  const TimerPreferenceListWidget({required this.timer, super.key});

  final TimerProvider timer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Saved Preferences"),
        Expanded(
          child: ListView.builder(
            itemCount: timer.Timer.length,
            itemBuilder: (context, index) {
              final timerVariable = timer.Timer[index];
              return SingleChildScrollView(
                child: ListTile(
                  title: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          timer.setTimer(timerVariable.timerValue);
                        },
                        child: Row(
                          children: [
                            Text(
                              timerVariable.timerName,
                              style: TextStyle(fontSize: 20),
                            ),
                            Gap(50),
                            Text(
                              timerVariable.timerValue.toString(),
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
