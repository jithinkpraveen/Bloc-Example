import 'package:flutter/material.dart';
import 'package:study/users/data/userModel.dart';
import 'package:study/users/data/userServices.dart';

class UsersList extends StatefulWidget {
  final String page;
  const UsersList({Key? key, required this.page}) : super(key: key);

  @override
  _UsersListState createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: UserServices().getUser(widget.page),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              List<UserModel> users = snapshot.data as List<UserModel>;
              return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, i) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(users[i].profilePic!),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "${users[i].firstName}  ${users[i].lastName}"),
                              Text("${users[i].email}")
                            ],
                          )
                        ],
                      ),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator.adaptive());
            }
          }),
    );
  }
}
