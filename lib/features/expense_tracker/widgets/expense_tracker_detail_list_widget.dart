import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:super_life_app/providers/expense_provider.dart';

import 'expense_tracker_total_spent_widget.dart';

class ExpenseTrackerDetailListWidget extends StatefulWidget {
  const ExpenseTrackerDetailListWidget({super.key});

  @override
  State<ExpenseTrackerDetailListWidget> createState() =>
      _ExpenseTrackerDetailListWidgetState();
}

class _ExpenseTrackerDetailListWidgetState extends State<ExpenseTrackerDetailListWidget>
{
  @override
  Widget build(BuildContext context) {
    final expenseProvider = context.watch<ExpenseProvider>();
    
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: expenseProvider.Expense.length,
              itemBuilder: (context, index) {
                final expense = expenseProvider.Expense[index];
                return SingleChildScrollView(
                  child:  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(expense.item),
                        Gap(130),
                        Text(expense.amount.toString()),
                        IconButton(
                          onPressed: () => expenseProvider.deleteExpense(index),
                          icon: Icon(Icons.delete, color: Colors.green),
                        ),
                      ],
                    ),
                    subtitle: Text(expense.category),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 200,
            width: 300,
            child:  ExpenseTrackerTotalSpentWidget(),
          ),
        ],
      ),
    );
  }
}
