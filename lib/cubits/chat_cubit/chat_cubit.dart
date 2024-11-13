import 'package:chat_app/constants.dart';
import 'package:chat_app/cubits/chat_cubit/chat_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(InitialChatState());
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollections);

  void sendMessage({required String message, required String email}) {
    messages.add({
      kMessage: message,
      kCreatedAt: DateTime.now(),
      'id': email,
    });
  }

  void getMessages() {
    messages.orderBy(kCreatedAt, descending: true).snapshots().listen((event) {
      emit(SuccessChatState());
    });
  }
}
