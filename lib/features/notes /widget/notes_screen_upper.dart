import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

class NotesScreenUpper extends StatefulWidget {
  const NotesScreenUpper({super.key});

  @override
  State<NotesScreenUpper> createState() => _NotesScreenUpperState();
}

class _NotesScreenUpperState extends State<NotesScreenUpper> {
  final TextEditingController _controllerTitle = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controllerTitle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 200,
                child: TextField(
                  controller: _controllerTitle,
                  decoration:  InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Title',
                  ),
                ),
              ),
              Gap(50),
              Text("Saved", style: TextStyle(color: Colors.green),),
            ],
          ),
        ],
      ),
    );
  }
}
