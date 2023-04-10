// import 'package:flutter/material.dart';
//
// import '../../appbar/My_appbar.dart';
// import '../widgets/chat/messages.dart';
// import '../widgets/chat/new_messages.dart';
//
// class ChatScreen extends StatefulWidget {
//   final String? sellerUid;
//   final String? sellerName;
//
//   const ChatScreen({super.key, this.sellerUid, this.sellerName});
//
//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }
//
// class _ChatScreenState extends State<ChatScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: MyAppbar().myAppBar(context),
//       body: Column(
//         children: [
//           Expanded(
//             child: Messages(
//               key: widget.key,
//               sellerUid: widget.sellerUid,
//               sellerName: widget.sellerName,
//             ),
//           ),
//           NewMessages(
//             sellerUid: widget.sellerUid,
//             sellerName: widget.sellerName,
//           ),
//         ],
//       ),
//     );
//   }
// }
