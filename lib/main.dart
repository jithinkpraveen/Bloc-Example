import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study/auth/logic/login_bloc.dart';
import 'package:study/auth/login.dart';
import 'package:study/users/usersList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<LoginBloc>(create: (context) => LoginBloc())],
      child: MaterialApp(
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        children: [
          MaterialButton(
            color: Colors.amberAccent,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UsersList(
                            page: "1",
                          )));
            },
            child: Text("Future Builder page 1"),
          ),
          MaterialButton(
            color: Colors.amberAccent,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UsersList(
                            page: "2",
                          )));
            },
            child: Text("Future Builder page 2"),
          ),
          MaterialButton(
              color: Colors.amberAccent,
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
              child: Text("Login"))
        ],
      )),
    );
  }
}
