import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_duration_picker/flutter_time_duration_picker.dart';
import 'package:gap/gap.dart';
import 'package:super_life_app/features/timer/widget/timer_preference_list_widget.dart';
import 'package:super_life_app/features/timer/widget/timer_save_preference_widget.dart';
import 'package:super_life_app/features/timer/widget/timer_widget_manual.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Timer')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(child: TimerWidgetManual(duration: 1000)),
            TimerPreferenceListWidget(itemTime: 123),
            Gap(130),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Preferences"),
                Gap(40),
                ElevatedButton(
                  onPressed: () => showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return TimerSavePreferenceWidget();
                    },
                  ),
                  child: const Text("Add Preference"),
                ),
              ],
            ),
            Gap(30),
          ],
        ),
      ),
    );
  }
}

