import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../models/user.dart';
import 'package:plore/screens/user/user_details.dart';


class Home extends StatefulWidget {

  _HomeState createState()=> _HomeState();

}


class _HomeState extends State<Home> {
  List<User> users = [];


  @override 
  void initState() {
    super.initState();
    // get_users();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: Text('Home')
        ),

        body: FutureBuilder(

              future: getUsers(),

              builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {

                 if( snapshot.hasData ) {

                    List<User> usrs = snapshot.data;
                    return ListView(  
                      children:  usrs.map((user) {
                          return userTile(user);
                        }).toList()
                    );

                 } else {

                    return Center( child: CircularProgressIndicator(), );

                 }

              },

            )
    

    );
  }// Widget build(BuildContext context) { .. }



  // get users
  Future<List<User>> getUsers() async {
    http.Response response = await http.get('https://jsonplaceholder.typicode.com/users');

    List<dynamic> responseJson = jsonDecode(response.body);
    
    // print(responseJson);

    List<User> users = responseJson.map((userJson) {
      return User.fromJson(userJson);
    }).toList(); 

    users.forEach((usr) {
      print(usr.name);
    });

    return users;
  }// Future<List<User>> get_users() { .. }

  viewUserDetails(user) async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context)=> UserDetails(user: user)
      )
    );
  }

  Widget userTile(User user) {
    return Container(
              // height: 80,
              padding: EdgeInsets.symmetric(vertical: 0),
              child: ListTile(
                      leading: CircleAvatar(
                        child: Image.network(
                          'https://media.geeksforgeeks.org/wp-content/uploads/20190719161521/core.jpg',
                          fit: BoxFit.cover
                        ),
                      ),
                      title: Text(user.name),
                      subtitle: Text(user.email),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: (){
                        viewUserDetails(user);
                      },
                    ),
            );
  }


}