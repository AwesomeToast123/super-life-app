import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimerSavePreferenceWidget extends StatefulWidget {
  const TimerSavePreferenceWidget({super.key});

  @override
  State<TimerSavePreferenceWidget> createState() => _TimerSavePreferenceWidgetState();
}

class _TimerSavePreferenceWidgetState extends State<TimerSavePreferenceWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CupertinoTimerPicker(
            mode: CupertinoTimerPickerMode
                .hms, // Activates hours, minutes, and seconds
            initialTimerDuration: const Duration(
              hours: 0,
              minutes: 0,
              seconds: 0,
            ),
            onTimerDurationChanged: (Duration newDuration) {
              // Format the duration into a string: HH:mm:ss
              String hhmmss = _formatDuration(newDuration);
              print("Selected Time: $hhmmss");
            },
          ),
        ),
        ElevatedButton(
            onPressed: () {

            },
            child: const Text("Save")
        ),
        SizedBox(
          height: 100,
        ),
      ],
    );
  }
}

String _formatDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  String hours = twoDigits(duration.inHours);
  String minutes = twoDigits(duration.inMinutes.remainder(60));
  String seconds = twoDigits(duration.inSeconds.remainder(60));
  return "$hours:$minutes:$seconds";
}
