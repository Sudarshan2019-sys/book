import 'package:book/bookui/screens/chatscreen.dart';
import 'package:book/bookui/screens/upload.dart';
import 'package:book/bookui/widgets/category.dart';
import 'package:book/bookui/widgets/recent_uploads.dart';
import 'package:book/bookui/widgets/sllider.dart';
import 'package:book/bookui/widgets/trending.dart';
import 'package:flutter/material.dart';

import '../../appbarsearch.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab=1;
  final List<Widget> _children=[
    Nav(),
    Settings(),
    Book(),
    Chatscreen(),Upload(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon:CircleAvatar(backgroundImage: AssetImage('assets/images/book3.jpg'),),
          color: Theme.of(context).accentColor,
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: Text('BookApp'),
      elevation: 0.0,
      backgroundColor: Theme.of(context).primaryColor,
      actions: <Widget>[
        IconButton(
          icon:Icon(Icons.search),
          onPressed: () async{
                        final int selected=await showSearch(
                          context: context, delegate: SearchDemoSearchDelegate()
            );
            Object query;
                        if(selected!=null && selected!=query){
              setState(() {
               query=selected; 
              });
            }

          },
        ),
        IconButton(
          icon:Icon(Icons.settings),
          onPressed: (){

          },
        ),
        IconButton(
          icon:Icon(Icons.search),
          onPressed: (){

          },
        )
      ],),
      body: _children[_currentTab],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        onTap: (int value){
          setState(() {
            _currentTab=value;
          });
        },
        currentIndex: _currentTab,
        backgroundColor: Colors.white,
        selectedItemColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,size:20),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book,size:20),
            title: SizedBox.shrink()
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage('assets/images/book1.jpg',),
            ),
            title: SizedBox.shrink()
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message,size:20),
            title: SizedBox.shrink()
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_upload,size:20),
            title: SizedBox.shrink()
          ),
          
        ],
      ),
    );
  }
}


class Nav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            BuildSlider(),
            SizedBox(height: 10,),
            CategorySelect(),
            SizedBox(height: 10,),
            TrendingBooks(),
            SizedBox(height: 10,),
            RecentUploads(),
        ],),
      );
  }
}

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Text list'),
    );
  }
}

class Book extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Provides list'),
    );
  }
}


