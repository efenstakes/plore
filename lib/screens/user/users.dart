import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:plore/models/user.dart';
import 'package:plore/screens/user/user_details.dart';
import 'package:plore/screens/user/fav_alien_list.dart';
import 'package:plore/screens/user/user_list.dart';



class UsersScreen extends StatefulWidget {

  @override 
  _UsersScreenState createState()=> _UsersScreenState();

}

class _UsersScreenState extends State<UsersScreen> {

  List<User> users = [
    User(email: 'change.gmail', name: 'change', id: 2),
    User(email: 'Kim.gmail', name: 'Kim', id: 2),
    User(email: 'Kol.gmail', name: 'Kol', id: 2),
    User(email: 'Wik.gmail', name: 'Wik', id: 2),
    User(email: 'Alonzo.gmail', name: 'Alonzo', id: 2),
    User(email: 'Mendoza.gmail', name: 'Mendoza', id: 2),
  ];
  List<User> favAliens = [
    User(email: 'flash@gmail.com', name: 'flash', id: 2),
    User(email: 'mando@gmail.com', name: 'mando', id: 2),
    User(email: 'jill@gmail.com', name: 'jill', id: 2),
    User(email: 'superman@gmail.com', name: 'superman', id: 2),
    User(email: 'batman@gmail.com', name: 'batman', id: 2),
    User(email: 'batwoman@gmail.com', name: 'batwoman', id: 2),
  ];
  
  bool isLoading = false;

  @override 
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Alien List'),
      ),
      // extendBodyBehindAppBar: true,
      
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: <Widget>[
        
          Text('Favorite Aliens'),

          // famous aliens
          FamousAlienList(aliens: favAliens),

          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              Container(
                child: RaisedButton(
                        child: Text('Get Aliens'),
                        onPressed: getUsers,
                        shape: StadiumBorder(
                          side: BorderSide(width: 1)
                        ),
                    ),
              ),
              Container(
                child: Text('Found '+ users.length.toString() + ' aliens')
              ),


            ],
          ),
          ),


          isLoading ? 
          CircularProgressIndicator() : 
          Expanded(
            child: UserListScreen(users: users),
          )


        ],

      ),

    );
  }



  void getUsers() async {
    setState((){ isLoading = true; });
    List<User> users = [];

    http.Response response = await http.get('https://jsonplaceholder.typicode.com/users');

    print(response.statusCode);
    if( response.statusCode != 200 ) {
      setState((){ isLoading = false; });
    }

    List<dynamic> responseJson = jsonDecode(response.body);

    users = responseJson.map((usrJson) {
      return User.fromJson(usrJson);
    }).toList();
    
    users.forEach((usr)=> print(usr.name));
    
    setState((){ this.users = users; });

  }// void getUsers() async { .. }


}


