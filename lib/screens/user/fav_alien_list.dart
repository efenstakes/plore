import 'package:flutter/material.dart';

import 'package:plore/models/user.dart';
import 'package:plore/screens/user/user_details.dart';


// FamousAlienList widget
class FamousAlienList extends StatelessWidget {
  final List<User> aliens;

  FamousAlienList({this.aliens});

  @override 
  Widget build(BuildContext context) {
    final double windowHeight = MediaQuery.of(context).size.height;
    double windowWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      height: windowHeight*0.3,

      child: ListView(
        scrollDirection: Axis.horizontal,
      

        children: makeCards(width: windowWidth, context: context)


      ),

      

    );
  }// Widget build(BuildContext context) { .. }

  List<Widget> makeCards({ width, BuildContext context }) {
    List<Widget> alienCards = aliens.map((alien) {
            return InkWell(
              
              child: Container(
                width: width*0.6,
                child: Card(
                  child: Center(
                    child: Text(alien.name),
                  ),
                ),
              ),

              onTap: () {
                _goSeeAlien(alien: alien, context: context);
              },

            );
          }).toList();
    
    Widget addCard = Container(
      width: width*0.6,
      child: Card(
        child: Center( 
          child: IconButton(
            icon: Icon(Icons.add),
            onPressed: (){},
          ),
        ),
      ),
    );

    List<Widget> cards = alienCards;//.add(addCard);
    return cards;
  }// List<Widget> makeCards() { .. }

  void _goSeeAlien({User alien, BuildContext context}) async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context)=> UserDetails(user: alien)
      )
    );
  }// _goSeeAlien({User alien, BuildContext context}) async { .. }


}
