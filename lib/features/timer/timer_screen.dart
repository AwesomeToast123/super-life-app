import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_duration_picker/flutter_time_duration_picker.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:super_life_app/features/timer/widget/timer_preference_list_widget.dart';
import 'package:super_life_app/features/timer/widget/timer_save_preference_widget.dart';
import 'package:super_life_app/features/timer/widget/timer_widget_manual.dart';
import 'package:super_life_app/providers/timer_provider.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  @override
  Widget build(BuildContext context) {
    final timerProvider = context.watch<TimerProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Timer')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: 300,
                child: TimerWidgetManual(duration: timerProvider.duration)
            ),
            Gap(130),
            SizedBox(
              width: 400,
              height: 100,
              child: TimerPreferenceListWidget(timer: timerProvider,),
            ),
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
