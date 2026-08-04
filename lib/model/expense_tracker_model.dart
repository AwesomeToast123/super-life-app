import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'expense_tracker_model.g.dart';


@HiveType(typeId: 0)
class ExpenseTrackerModel extends HiveObject {
   ExpenseTrackerModel({
    required this.item,
    required this.amount,
    required this.category,
   });

   @HiveField(0)
   final String category;
   @HiveField(1)
   final double amount;
   @HiveField(2)
   final String item;
}