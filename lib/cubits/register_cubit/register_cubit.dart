import 'package:chat_app/cubits/register_cubit/register_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(InitialRegisterState());
  Future<void> registerUser(
      {required String email, required String password}) async {
    emit(LoadingRegisterState());
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(SuccessRegisterState());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'weak-password') {
        emit(
          FailureRegisterState('weak password'),
        );
      } else if (ex.code == 'email-already-in-use') {
        emit(
          FailureRegisterState('email already in use'),
        );
      }
    } catch (e) {
      emit(FailureRegisterState('there are error please try again: $e'));
    }
  }
}
