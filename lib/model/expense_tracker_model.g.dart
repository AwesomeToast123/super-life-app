// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_tracker_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExpenseTrackerModelAdapter extends TypeAdapter<ExpenseTrackerModel> {
  @override
  final int typeId = 0;

  @override
  ExpenseTrackerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExpenseTrackerModel(
      item: fields[2] as String,
      amount: fields[1] as double,
      category: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ExpenseTrackerModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.category)
      ..writeByte(1)
      ..write(obj.amount)
      ..writeByte(2)
      ..write(obj.item);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExpenseTrackerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
