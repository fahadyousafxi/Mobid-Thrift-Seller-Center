import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../appbar/My_appbar.dart';
import '../providers/chats_provider.dart';
import 'chat_room.dart';

class Chats extends StatefulWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  ChatsProvider chatsProvider = ChatsProvider();

  @override
  void initState() {
    ChatsProvider chatsProvider = Provider.of(context, listen: false);
    chatsProvider.getChatsData();
    super.initState();
  }

  final _auth = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    chatsProvider = Provider.of(context);
    print('*********************');
    print(chatsProvider.getChatsDataList.length);
    print('*********************');
    return Scaffold(
      appBar: MyAppbar().mySimpleAppBar(context, title: 'Chats'),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: ListView.builder(
          itemCount: chatsProvider.getChatsDataList.length,
          itemBuilder: (BuildContext context, int index) {
            var data = chatsProvider.getChatsDataList[index];
            return Column(
              children: [
                ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22)),
                  tileColor: Colors.grey.shade400,
                  textColor: Colors.black,
                  iconColor: Colors.black,
                  splashColor: Colors.blue.shade100,
                  leading: data.sellerPhoto == ''
                      ? Icon(
                          Icons.person_3_rounded,
                          size: 33,
                        )
                      : CircleAvatar(
                          backgroundImage: NetworkImage(
                            data.buyerPhoto.toString(),
                          ),
                          radius: 25,
                        ),
                  // Image.network(data.sellerPhoto.toString()),
                  title: Text(data.buyerName.toString()),
                  subtitle: Text(data.userEmail.toString()),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChatRoom(
                                chatRoomId: data.roomUid,
                                buyerEmail: data.userEmail,
                                buyerUid: data.buyerUid,
                                buyerPhoto: data.buyerPhoto,
                                buyerName: data.buyerName)));
                  },
                ),
                Divider(
                  thickness: 5,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
