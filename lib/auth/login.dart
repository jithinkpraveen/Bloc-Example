import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study/auth/logic/login_bloc.dart';
import 'package:study/auth/logic/login_event.dart';
import 'package:study/auth/logic/login_stat.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? userNAme;
  String? password;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Login success')));
          } else if (state is LoginFaild) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Login Faild')));
          }
        },
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: "User Name"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      userNAme = value;
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Password"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      password = value;
                      return null;
                    },
                  ),
                  ElevatedButton(
                    onPressed: state is Loading
                        ? null
                        : () {
                            if (_formKey.currentState!.validate()) {
                              BlocProvider.of<LoginBloc>(context).add(
                                  LoginSubmit(
                                      password: password, userName: userNAme));
                            }
                          },
                    child: state is Loading
                        ? CircularProgressIndicator.adaptive()
                        : Text('Submit'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
