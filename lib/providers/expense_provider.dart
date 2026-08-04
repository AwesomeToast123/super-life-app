import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:super_life_app/model/expense_tracker_model.dart';

class ExpenseProvider extends ChangeNotifier {

   final Box<ExpenseTrackerModel> _myBox = Hive.box<ExpenseTrackerModel>('myBox');

   List<ExpenseTrackerModel> get Expense => _myBox.values.toList();

   void addExpense(String item, String subItem, double price) {
      final expense = ExpenseTrackerModel(
          item: item,
          amount: price,
          category: subItem,
      );
      _myBox.add(expense);
      notifyListeners();
    }

    void deleteExpense(int index) {
      _myBox.deleteAt(index);
      notifyListeners();
    }

}