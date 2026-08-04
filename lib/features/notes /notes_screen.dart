import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:super_life_app/features/notes%20/widget/notes_screen_body.dart';
import 'package:super_life_app/features/notes%20/widget/notes_screen_upper.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notes")),
      body: Column(
        children: [
          NotesScreenUpper(),
          Divider(),
          NotesScreenBody(),
          Gap(50),
        ],
      ),
    );
  }
}
