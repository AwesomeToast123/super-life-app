import 'package:flutter/material.dart';

class NotesSelectionWidget extends StatefulWidget {
  const NotesSelectionWidget({
    this.title = "July",
    super.key,
  });

  final String title;

  @override
  State<NotesSelectionWidget> createState() => _NotesSelectionWidgetState();
}

class _NotesSelectionWidgetState extends State<NotesSelectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(widget.title),
          GridView.builder(
            shrinkWrap: true,
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
            ),
            itemBuilder: (context, item) {
              return Text("");
            },
          ),
        ],
      ),
    );
  }
}
