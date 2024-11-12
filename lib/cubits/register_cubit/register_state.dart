abstract class RegisterState {}

class InitialRegisterState extends RegisterState {}

class LoadingRegisterState extends RegisterState {}

class SuccessRegisterState extends RegisterState {}

class FailureRegisterState extends RegisterState {
  final String errorMessage;

  FailureRegisterState(this.errorMessage);
}
