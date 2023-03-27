import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/user_provider.dart';
import 'message_bubble.dart';

class Messages extends StatefulWidget {
  final String? sellerName;
  final String? sellerUid;

  const Messages({super.key, this.sellerName, this.sellerUid});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  void initState() {
    Provider.of<UserProvider>(context, listen: false).dataUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var userData = Provider.of<UserProvider>(context, listen: false).userUid;

    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy('createdAt', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final chatDocs = snapshot.data!.docs;

        return ListView.builder(
          reverse: true,
          itemCount: chatDocs.length,
          itemBuilder: (context, index) => MessageBubble(
            message: chatDocs[index]['text'],
            isMe: chatDocs[index]['sellerId'] == widget.sellerUid,
            sellerName: widget.sellerName!,
            isSell: chatDocs[index]['userId'] == userData![index],
            username: chatDocs[index]['userName'],
            myKey: ValueKey(chatDocs[index].id),
          ),
        );
      },
    );
  }
}
