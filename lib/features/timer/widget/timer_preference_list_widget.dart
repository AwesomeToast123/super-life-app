
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

class TimerPreferenceListWidget extends StatelessWidget {
  const TimerPreferenceListWidget({
    super.key,
    required this.itemTime,
  });

  final int itemTime;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Item List:",
            style: TextStyle(
              fontSize: 20
            ),
          ),
          Gap(40),
          Text(
            itemTime.toString(),
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey
            ),
          ),
        ],
      ),
    );
  }
}
