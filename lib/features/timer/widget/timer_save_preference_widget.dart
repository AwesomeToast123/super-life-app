import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:super_life_app/providers/timer_provider.dart';

class TimerSavePreferenceWidget extends StatefulWidget {
  const TimerSavePreferenceWidget({super.key});

  @override
  State<TimerSavePreferenceWidget> createState() => _TimerSavePreferenceWidgetState();
}

class _TimerSavePreferenceWidgetState extends State<TimerSavePreferenceWidget>
{
  Duration _selectedDuration = const Duration(hours: 0, minutes: 0, seconds: 0);
  final TextEditingController _controllerTextFieldTimeName = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final timerProvider = context.watch<TimerProvider>();
    return Column(
      children: [
        Expanded(
          child: CupertinoTimerPicker(
            mode: CupertinoTimerPickerMode.hms, // Activates hours, minutes, and seconds
            initialTimerDuration: const Duration(
              hours: 0,
              minutes: 0,
              seconds: 0,
            ),
            onTimerDurationChanged: (Duration newDuration) {
              setState(() {
                _selectedDuration = newDuration;
              });
            },
          ),
        ),
        SizedBox(
          width: 300,
          height: 40,
          child: TextFormField(
            controller: _controllerTextFieldTimeName,
            decoration: const InputDecoration(
              hintText: "Enter Name",
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
            ),
          ),
        ),
        Gap(30),
        ElevatedButton(
            onPressed: () {
               final hhmmss = _formatDuration(_selectedDuration);
               timerProvider.addTimer(_selectedDuration.inSeconds, _controllerTextFieldTimeName.text);
            },
            child: const Text("add preference")
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
