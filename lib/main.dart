import 'package:flutter/material.dart';

import 'package:plore/screens/splash/splash.dart';



// run the app
void main()=> runApp(MyApp());


// app main widget
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Plore App',

      home: Splash(),

      theme: ThemeData(
        primaryColor: Colors.deepOrange,
        accentColor: Colors.deepOrangeAccent,
        focusColor: Colors.deepOrangeAccent[50],
        buttonColor: Colors.deepOrangeAccent[500],

        appBarTheme: AppBarTheme(
          color: Colors.deepOrangeAccent[300],
          elevation: 8,
          iconTheme: IconThemeData(
            color: Colors.deepOrangeAccent[240],
            // opacity: 0.1, 
            size: 40
          ),
          textTheme: TextTheme(
            
          title: TextStyle(
            fontSize: 24, 
            fontWeight: FontWeight.w800,
            color: Colors.black
          ),

          )
        ),

        snackBarTheme: SnackBarThemeData(),

        buttonBarTheme: ButtonBarThemeData(
          buttonTextTheme: ButtonTextTheme.primary
        ),

        textTheme: TextTheme(

          headline: TextStyle( 
            fontSize: 40, fontWeight: FontWeight.w800,
          ),

          title: TextStyle(
            fontSize: 32, fontWeight: FontWeight.w800,
          ),

          subtitle: TextStyle(
            fontSize: 32, fontWeight: FontWeight.w800
          ),

          body1: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal
          )

        )
      ),

      debugShowCheckedModeBanner: false,

    );
  }// Widget build(BuildContext context) { .. }

}