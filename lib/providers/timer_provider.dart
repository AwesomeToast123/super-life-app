
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:super_life_app/model/timer_model.dart';

class TimerProvider extends ChangeNotifier {
    final Box<TimerModel> _myBox = Hive.box<TimerModel>('timerBox');
    List<TimerModel> get Timer => _myBox.values.toList();
     int duration = 0;

    void addTimer(int timerValue, String timerName, String hhmmss) {
      final timer = TimerModel(
        timerValue: timerValue,
        timerName: hhmmss,
        timerTitle: timerName,
      );
      _myBox.add(timer);
      notifyListeners();
    }

    void updateTimer(int index, int timerValue, String timerName, String hhmmss) {
      final timer = TimerModel(
        timerValue: timerValue,
        timerName: hhmmss,
        timerTitle: timerName,
      );

      _myBox.putAt(index, timer);
      notifyListeners();
    }

    void setTimer(int durationChange) {
      duration = durationChange;
      notifyListeners();
    }

    void deleteTimer(int index) {
      _myBox.deleteAt(index);
      notifyListeners();
    }
}

