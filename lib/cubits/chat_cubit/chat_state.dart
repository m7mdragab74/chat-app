abstract class ChatState {}

class InitialChatState extends ChatState {}

class SuccessChatState extends ChatState {}

class FailureChatState extends ChatState {
  final String errorMessage;

  FailureChatState(this.errorMessage);
}
