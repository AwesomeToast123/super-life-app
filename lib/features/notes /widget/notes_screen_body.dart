import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

class NotesScreenBody extends StatefulWidget {
  const NotesScreenBody({super.key});

  @override
  State<NotesScreenBody> createState() => _NotesScreenBodyState();
}

class _NotesScreenBodyState extends State<NotesScreenBody> {
  final TextEditingController _controllerTextAreaNotes = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;
  int _wordCount = 0;


  void _updateWordCount(String text) {
    final trimmedText = text.trim().replaceAll(RegExp(r'\s+'), ' ');
    setState(() {
      _wordCount = trimmedText.isEmpty ? 0 : trimmedText.split(' ').length;
    });
  }

  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickFile = await _picker.pickImage(
        source: source,
    );

    if(pickFile != null) {
      setState(() {
        _selectedImage = File(pickFile.path);
      });
    }
  }

  Future<void> _pickMultipleImages() async {
    final List<XFile> pickerFiles = await _picker.pickMultiImage(
      imageQuality: 85,
    );

    if(pickerFiles.isNotEmpty) {
      setState(() {
        //_selectedImage = pickedFiles.map((xfile) => File(xfile.path)).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 500,
          child: TextField(
            controller: _controllerTextAreaNotes,
            onChanged: _updateWordCount,
            keyboardType: TextInputType.multiline,
            minLines: 5,
            maxLines: 5,
            decoration: InputDecoration(
              hintText: 'Enter your notes here...',
              border: InputBorder.none,
            ),
          ),
        ),
        Gap(10),
        Divider(),
        Row(
          children: [
            Gap(10),
            ElevatedButton(
              onPressed: () => _pickImage(ImageSource.gallery),
              child: Text("Media", style: TextStyle(color: Colors.black)),
            ),
            Gap(10),
            ElevatedButton(
              onPressed: () => {},
              child: Text("Add Note", style: TextStyle(color: Colors.black)),
            ),
            Gap(50),
            Text("word count: $_wordCount", style: TextStyle(fontSize: 15)),
          ],
        ),
      ],
    );
  }
}
