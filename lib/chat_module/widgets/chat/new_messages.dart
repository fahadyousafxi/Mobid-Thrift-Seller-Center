import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobidthrift_seller_center/providers/user_provider.dart';
import 'package:provider/provider.dart';

class NewMessages extends StatefulWidget {
  final String? sellerName;
  final String? sellerUid;

  const NewMessages({super.key, this.sellerName, this.sellerUid});

  @override
  State<NewMessages> createState() => _NewMessagesState();
}

class _NewMessagesState extends State<NewMessages> {
  var _enteredMessage = '';
  final TextEditingController _messagesController = TextEditingController();

  var index = 0;
  Future<void> _sendMessage() async {
    FocusScope.of(context).unfocus();

    var userData = Provider.of<UserProvider>(context).dataUser();

    FirebaseFirestore.instance.collection('chat').add({
      'text': _enteredMessage,
      'createdAt': Timestamp.now(),
      'userId': userData.elementAt(index).uId,
      'username': userData.elementAt(index).name,
      'sellerId': widget.sellerUid,
      'sellerName': widget.sellerName,
    });

    _messagesController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              textCapitalization: TextCapitalization.sentences,
              autocorrect: true,
              enableSuggestions: true,
              controller: _messagesController,
              decoration: const InputDecoration(
                labelText: 'Send your message...',
              ),
              onChanged: (value) {
                setState(() {
                  _enteredMessage = value;
                });
              },
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.send,
              color: Theme.of(context).colorScheme.primary,
            ),
            onPressed: _enteredMessage.trim().isEmpty ? null : _sendMessage,
          ),
        ],
      ),
    );
  }
}
