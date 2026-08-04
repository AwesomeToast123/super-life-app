import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:super_life_app/model/expense_tracker_model.dart';



class ExpenseTrackerTotalSpentWidget extends StatefulWidget {
  const ExpenseTrackerTotalSpentWidget({
    super.key,
  });
  
  @override
  State<ExpenseTrackerTotalSpentWidget> createState() => _ExpenseTrackerTotalSpentWidgetState();
}

class _ExpenseTrackerTotalSpentWidgetState extends State<ExpenseTrackerTotalSpentWidget>
{
  double calculateTotal(){
     final expenseBox = Hive.box<ExpenseTrackerModel>('myBox');
     return expenseBox.values.fold(0.0, (sum, current) => sum + current.amount);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Hive.box<ExpenseTrackerModel>('myBox').listenable(),
        builder: (context, Box<ExpenseTrackerModel> box, _) {
          final total = calculateTotal();
          return Column(
            children: [
              Divider(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Total:",
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  Gap(100),
                  Text(total.toStringAsFixed(2), style: TextStyle(fontSize: 20)),
                ],
              ),
            ],
          );
        }
    );
  }
}
