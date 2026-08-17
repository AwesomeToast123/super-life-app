// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimerModelAdapter extends TypeAdapter<TimerModel> {
  @override
  final int typeId = 1;

  @override
  TimerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimerModel(
      timerValue: fields[0] as int?,
      timerName: fields[1] as String?,
      timerTitle: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TimerModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.timerValue)
      ..writeByte(1)
      ..write(obj.timerName)
      ..writeByte(2)
      ..write(obj.timerTitle);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
