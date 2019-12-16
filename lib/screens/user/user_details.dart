import 'package:flutter/material.dart';
import 'package:plore/models/user.dart';

class UserDetails extends StatelessWidget {
  final User user;

  UserDetails({this.user});

  // top image container
  topImgContainer(BuildContext context, String imgUrl) => Container(
      alignment: Alignment.bottomLeft,
      height: MediaQuery.of(context).size.height*0.3,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 3.0),
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          image:
              DecorationImage(fit: BoxFit.cover, image: NetworkImage(imgUrl))),
      child: Center(
          child: Text(user.name, style: Theme.of(context).textTheme.title)));

  //vertical spacing
  vertSpacing({double height = 15}) => SizedBox(height: height);

  //Cirular avatars
  circleAvatar({@required String name, @required String imgUrl}) => Container(
          child: Column(children: <Widget>[
        Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 3.0),
                borderRadius: BorderRadius.all(Radius.circular(300.0)),
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(imgUrl)))),
        Text(name)
      ]));

  //comment listTile
  usrComment(
          {@required String user,
          @required String comment,
          @required String avatarUrl}) =>
      ListTile(
          leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 3.0),
                  borderRadius: BorderRadius.all(Radius.circular(300.0)),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(avatarUrl)))),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(user),
              Text('time')
            ],
          ),
          subtitle: Wrap(children: <Widget>[Text(comment)])
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(user.name)),
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
            child: ListView(children: <Widget>[
              topImgContainer(context,
                  'https://media.geeksforgeeks.org/wp-content/uploads/20190719161521/core.jpg'),
              vertSpacing(),
              Text(user.name),
              Text(user.email),
              vertSpacing(height: 20),

              Text('Performers'),
              vertSpacing(height: 8),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: <Widget>[
                    circleAvatar(
                        name: 'Jay Z',
                        imgUrl:
                            'https://media.geeksforgeeks.org/wp-content/uploads/20190719161521/core.jpg'),
                    circleAvatar(
                        name: 'Jay Z',
                        imgUrl:
                            'https://media.geeksforgeeks.org/wp-content/uploads/20190719161521/core.jpg'),
                    circleAvatar(
                        name: 'Jay Z',
                        imgUrl:
                            'https://media.geeksforgeeks.org/wp-content/uploads/20190719161521/core.jpg'),
                    circleAvatar(
                        name: 'Jay Z',
                        imgUrl:
                            'https://media.geeksforgeeks.org/wp-content/uploads/20190719161521/core.jpg'),
                    circleAvatar(
                        name: 'Jay Z',
                        imgUrl:
                            'https://media.geeksforgeeks.org/wp-content/uploads/20190719161521/core.jpg'),
                    circleAvatar(
                        name: 'Jay Z',
                        imgUrl:
                            'https://media.geeksforgeeks.org/wp-content/uploads/20190719161521/core.jpg')
                  ]
                )
              ),

              vertSpacing(),
             
              Text('Comments'),
              vertSpacing(height: 8),
              usrComment(
                  user: 'User',
                  comment: 'Comment',
                  avatarUrl:
                      'https://media.geeksforgeeks.org/wp-content/uploads/20190719161521/core.jpg'),
              usrComment(
                  user: 'User',
                  comment: 'Comment',
                  avatarUrl:
                      'https://media.geeksforgeeks.org/wp-content/uploads/20190719161521/core.jpg'),
              usrComment(
                  user: 'User',
                  comment: 'Comment',
                  avatarUrl:
                      'https://media.geeksforgeeks.org/wp-content/uploads/20190719161521/core.jpg')
            ])));
  } // Widget build(BuildContext context) { .. }

}

/*I generated the widgets statically for you... now if you want to nest listviews.. use a combination of builder widget
and either columns or rows depending on what you want to do. Listview.builder will not work
unless you try using slivers.. either that or nest the listview inside a container and set
a height to the container.. that might be problematic.. especially when you
don't know the size of the listview but yeah.. expanded could come in handy at that point.. I'll check when you push next.. You'll
definitely need a model for performers*/
