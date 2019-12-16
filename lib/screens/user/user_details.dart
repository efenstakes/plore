import 'package:flutter/material.dart';
import 'package:plore/models/user.dart';

class UserDetails extends StatelessWidget {

  User user;

  UserDetails({this.user});

  @override 
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar( 
        title: Text(user.name), 
      ),

      body: ListView(
        // scrollDirection: Axis.horizontal,

        children: <Widget>[

          Padding(

            padding: EdgeInsets.symmetric(
              vertical: 20.0, horizontal: 10.0
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,

              children: <Widget>[

                Container(
                  height: 300, 
                  decoration: BoxDecoration( 
                    border: Border.all( 
                      color: Colors.white, width: 3.0 
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0)
                    ),
                    image: DecorationImage( 
                      fit: BoxFit.cover,
                      image: NetworkImage('https://media.geeksforgeeks.org/wp-content/uploads/20190719161521/core.jpg')
                    ) 
                  ),
                ),



              ],
            )

          ),


          Column(


            children: <Widget>[

              Text('name here'),
              Text(user.email),




            ],

          ),


          Padding(
            padding: EdgeInsets.all(10.0),

            child: Text('data'),

          ),

          Container(
            child: Text('poll'),
          ),

          ListTile(
            title: Text('title 1'),
          )

          
        ],

      ),

    );
  }// Widget build(BuildContext context) { .. }

}