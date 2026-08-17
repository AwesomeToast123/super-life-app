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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          timer.setTimer(timerVariable.timerValue ?? 0);
                        },
                        child: Row(
                          children: [
                            Text(
                              timerVariable.timerName ?? "Name",
                              style: TextStyle(fontSize: 20),
                            ),
                            Gap(50),
                            Text(
                              timerVariable.timerTitle ?? "Title",
                              style: TextStyle(fontSize: 20),
                            ),
                            Gap(50),
                            IconButton(
                              onPressed: () => timer.deleteTimer(index),
                              icon: Icon(Icons.delete, color: Colors.green),
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
