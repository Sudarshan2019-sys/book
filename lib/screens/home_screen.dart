import 'package:book/widgets/categoryselector.dart';
import 'package:book/widgets/favouritecontacts.dart';
import 'package:book/widgets/recent_chats.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu,color: Colors.white,),
          iconSize: 30,
          onPressed: (){},
        ),
        title: Text('Chats',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),),
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
          icon: Icon(Icons.search,color: Colors.white,),
          iconSize: 30,
          onPressed: (){},
        ),
        ],
      ),
      body: Column(
        children: <Widget>[
          CategorySelector(),
          
          Expanded(
                      child: Container(
              height:500,
              decoration: BoxDecoration(color: Theme.of(context).accentColor,
              borderRadius:BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30)
              ) ),
              child: Column(
                children: <Widget>[
                  FavouriteContacts(),
                  RecentChats(),
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}
