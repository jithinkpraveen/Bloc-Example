class LoginEvent {}

class LoginSubmit extends LoginEvent {
  String? userName;
  String? password;
  LoginSubmit({this.password, this.userName});
}
