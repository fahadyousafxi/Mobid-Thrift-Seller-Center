import 'package:flutter/material.dart';

import '../../appbar/My_appbar.dart';
import '../widgets/chat/messages.dart';
import '../widgets/chat/new_messages.dart';

class ChatScreen extends StatefulWidget {
  final String? uId;
  final String? name;

  const ChatScreen({super.key, this.uId, this.name});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar().myAppBar(context),
      body: Column(
        children: [
          Expanded(
            child: Messages(
              name: widget.name,
              uId: widget.uId,
              key: widget.key,
            ),
          ),
          NewMessages(
            sellerName: widget.name,
            sellerUid: widget.uId,
          ),
        ],
      ),
    );
  }
}
