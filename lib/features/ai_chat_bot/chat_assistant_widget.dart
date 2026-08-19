


import 'package:firebase_ai/firebase_ai.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ai_toolkit/flutter_ai_toolkit.dart';


class ChatAssistantWidget extends StatelessWidget {
  const ChatAssistantWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AI Assistant"),),
      body: LlmChatView(
          provider: FirebaseProvider(
              model: FirebaseAI.googleAI().generativeModel(
                  model: 'gemini-3.6-flash'
              )
          )
      ),
    );
  }
}
