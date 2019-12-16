import 'dart:async';

import 'package:flutter/material.dart';

import '../home/home.dart';
import '../user/users.dart';


class Splash extends StatefulWidget {

  @override
  _SplashState createState()=> _SplashState();

}

class _SplashState extends State<Splash>{

  @override
  void initState() {
    super.initState();
    startSplashCount();
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: null,

      body: Column(
        children: <Widget>[

          Container(
            margin: EdgeInsets.only(top: 300),
            child: Center(
              child: Column(

                children: <Widget>[

                  CircularProgressIndicator(
                    // backgroundColor: Colors.deepOrange,
                    semanticsLabel: 'Loading',
                  ),

                  SizedBox( height: 32.0, ),
                  
                  Text('Alien DB',
                    style: TextStyle( 
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 32 
                    ),),

                ],

              ),
          ),
          )

        ],
      )

    );
  }// Widget build(BuildContext context) { .. }

  
  Future<Timer> startSplashCount() async {
    return new Timer(Duration(seconds: 3), goToHomePage);
  }
  goToHomePage() async {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context)=> UsersScreen()
      )
    );
  }

}