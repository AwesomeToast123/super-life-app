import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:super_life_app/features/expense_tracker/widgets/expense_tracker_detail_list_widget.dart';
import 'package:super_life_app/features/expense_tracker/widgets/expense_tracker_total_spent_widget.dart';
import 'package:super_life_app/features/expense_tracker/widgets/expense_tracker_upper.dart';

class ExpenseTracker extends StatefulWidget {
  const ExpenseTracker({super.key});

  @override
  State<ExpenseTracker> createState() => _ExpenseTrackerState();
}

class _ExpenseTrackerState extends State<ExpenseTracker> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Expense Tracker"),
       ),
       body: Column(
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           ExpenseTrackerUpper(),
           Expanded(
             child: ExpenseTrackerDetailListWidget(),
           ),
         ],
       ),
     );
  }
}

