import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study/auth/data/authServices.dart';
import 'package:study/auth/logic/login_event.dart';
import 'package:study/auth/logic/login_stat.dart';

LoginServices loginRepo = LoginServices();

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(InitialState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginSubmit) {
      yield Loading();
      var data = await loginRepo.login(event.userName!, event.password!);
      if (data['success'] == true) {
        yield LoginSuccess();
      } else if (data == false) {
        yield Error();
      } else {
        yield LoginFaild();
      }
    }
  }
}
