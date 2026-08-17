import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'timer_model.g.dart';

@HiveType(typeId: 1)
class TimerModel extends HiveObject {
  TimerModel({
    this.timerValue,
    this.timerName,
    this.timerTitle,
  });

  @HiveField(0)
  final int? timerValue;
  @HiveField(1)
  final String? timerName;
  @HiveField(2)
  final String? timerTitle;
}
