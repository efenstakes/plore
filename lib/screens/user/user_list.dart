import 'package:flutter/material.dart';
import 'package:plore/models/user.dart';
import 'package:plore/screens/user/user_details.dart';


class UserListScreen extends StatelessWidget {

  final List<User> users;

  UserListScreen({this.users}) {
    users.forEach((user)=> print(user.email));
  }


  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),

      itemCount: users.length,
      itemBuilder: (BuildContext context, int index) {

        return Dismissible(
          key: Key(users[index].name),
          child: ListTile(
                  title: Text(users[index].name),
                  subtitle: Text(users[index].email),
                  trailing: Icon(Icons.keyboard_arrow_right),

                  onTap: () {
                    _seeUserDetails(user: users[index], context: context);
                  },
                ),

          onDismissed: (direction) {

            Scaffold.of(context).showSnackBar(
              SnackBar( 
                content: Text('dismissed '+ users[index].name),
              )
            );

          },// onDismissed: (direction) { .. }

          background: Container(
            color: Colors.lightGreen,
          ),

        );

      },

      separatorBuilder: (BuildContext context, int index) {
        return Divider( color: Colors.deepOrange );
      },

    );
  }


  _seeUserDetails({ User user, BuildContext context}) async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context)=> UserDetails(user: user)
      )
    );
  }// void _seeUserDetails(user) async { .. }





}

