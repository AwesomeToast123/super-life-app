import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:super_life_app/providers/expense_provider.dart';

class ExpenseTrackerUpper extends StatefulWidget {
  const ExpenseTrackerUpper({super.key});

  @override
  State<ExpenseTrackerUpper> createState() => _ExpenseTrackerUpperState();
}

class _ExpenseTrackerUpperState extends State<ExpenseTrackerUpper> {

  final TextEditingController _controllerWhatDidYouSpend = TextEditingController();
  final TextEditingController _controllerTextFieldAmount = TextEditingController();
  final TextEditingController _controllerTextFieldItem = TextEditingController();
  String? _selectedValue;
  late double _priceValue;


  @override
  void initState() {
    _controllerWhatDidYouSpend.text = "What did you spend on?";
    _controllerTextFieldAmount.text = "Amount";
    _controllerTextFieldItem.text = "Item";
    super.initState();
  }

  double _convertDouble(String textValue) {
    double? convertPriceDouble = double.tryParse(textValue);
    return convertPriceDouble!;
  }

  @override
  Widget build(BuildContext context) {
    
    
    final expenseProvider = context.watch<ExpenseProvider>();
    
    return SizedBox(
      width: 500,
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              SizedBox(
                width: 200,
                height: 50,
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    hintText: "Select Unit",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'Food', child: Text('Food')),
                    DropdownMenuItem(value: 'Misc', child: Text('Misc')),
                    DropdownMenuItem(value: 'Clothes', child: Text('Hours')),
                  ],
                  onChanged: (value) {
                    setState(() => _selectedValue = value);
                  },
                  value: _selectedValue,
                ),
              ),
              Gap(20),
              SizedBox(
                width: 100,
                height: 40,
                child: TextFormField(
                  controller: _controllerTextFieldAmount,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    hintText: "Amount",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(25),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Gap(20),
          Row(
            children: [
              SizedBox(
                width: 300,
                height: 40,
                child: TextFormField(
                  controller: _controllerTextFieldItem,
                  decoration: const InputDecoration(
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
              Gap(40),
              IconButton(
                onPressed: () {
                  _priceValue = _convertDouble(_controllerTextFieldAmount.text);
                  expenseProvider.addExpense(
                     _controllerTextFieldItem.text,
                     _selectedValue.toString(),
                     _priceValue,
                  );
              }, icon: Icon(
                 Icons.add_circle,
                 color: Colors.green,
                 size: 50,
                ),
              ),
              Divider(),
            ],
          ),
        ],
      ),
    );
  }
}
