
import 'package:book/bookui/screens/login.dart';
import 'package:book/bookui/widgets/booklist.dart';
import 'package:book/bookui/widgets/category.dart';
import 'package:book/bookui/widgets/recent_uploads.dart';
import 'package:book/bookui/widgets/sllider.dart';
import 'package:book/bookui/widgets/trending.dart';
import 'package:book/learning/appbarsearch.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab=0;
  final List<Widget> _children=[
    Nav(),
    Book(),
    Upload(),
    //Upload()
    //Chatscreen(),
    //Upload(),

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
        // IconButton(
        //   icon:Icon(Icons.settings),
        //   onPressed: (){

        //   },
        // ),
        // IconButton(
        //   icon:Icon(Icons.search),
        //   onPressed: (){

        //   },
       // )
      ],),
      body: _children[_currentTab],
      
      bottomNavigationBar: BottomNavigationBar(
        //backgroundColor: Colors.deepPurple,
        elevation: 0,
        type: BottomNavigationBarType.shifting,
        onTap: (int value){
          setState(() {
            _currentTab=value;
          });
        },
        currentIndex: _currentTab,
        backgroundColor: Colors.greenAccent.withOpacity(.1),
        selectedItemColor: Colors.amber[900],
        //selectedIconTheme:IconThemeData(size: 18, color: Color(0x00000001)),
        //unselectedIconTheme:IconThemeData(size: 18, color: Color(0x00000002)),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,size:20,),
            title: Text('Home'),
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.book,size:0),
          //   title: SizedBox.shrink()
          // ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/book1.jpg',),
            ),
            title: SizedBox.shrink()
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.upload,size:20),
            title: SizedBox.shrink()
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.file_upload,size:0),
          //   title: SizedBox.shrink()
          // ),
          
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

class Book extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  BookList();
                      
  }
}

class Upload extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: LoginPage(),
    );
  }
}


