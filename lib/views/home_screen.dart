import 'package:chat_app/constants.dart';
import 'package:chat_app/model/message.dart';
import 'package:chat_app/widget/chat/build_app_bar.dart';
import 'package:chat_app/widget/chat/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollections);
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final String email = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          Expanded(child: _buildMessagesList(email)),
          _buildMessageInputField(email),
        ],
      ),
    );
  }

  Widget _buildMessagesList(String email) {
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: Text('Something went wrong!'));
        }

        List<Message> messagesList =
            snapshot.data!.docs.map((doc) => Message.fromJson(doc)).toList();

        return ListView.builder(
          reverse: true,
          controller: _scrollController,
          itemCount: messagesList.length,
          itemBuilder: (context, index) {
            return messagesList[index].id == email
                ? ChatBubble(message: messagesList[index])
                : ChatBubbleForFriend(message: messagesList[index]);
          },
        );
      },
    );
  }

  Widget _buildMessageInputField(String email) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: _controller,
        onSubmitted: (message) => _sendMessage(message, email),
        decoration: InputDecoration(
          hintText: 'Send message',
          suffixIcon: Icon(Icons.send, color: kPrimaryColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: kPrimaryColor),
          ),
        ),
      ),
    );
  }

  void _sendMessage(String message, String email) {
    if (message.trim().isEmpty) return;

    messages.add({
      kMessage: message,
      kCreatedAt: DateTime.now(),
      'id': email,
    });

    _controller.clear();
    _scrollController.animateTo(
      _scrollController.position.minScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }
}
