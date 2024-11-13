import 'package:chat_app/model/message.dart';

abstract class ChatState {}

class InitialChatState extends ChatState {}

class SuccessChatState extends ChatState {
  List<Message> messages;
  SuccessChatState({required this.messages});
}
