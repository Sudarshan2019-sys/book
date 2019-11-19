import 'package:book/travelui/widgets/destinationcarousel.dart';
import 'package:book/travelui/widgets/hotelcarousel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex=0;
  int _currentTab=0;
  List<IconData> _icons=[
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
  ];
  Widget _buildIcon(int index){
    return GestureDetector(
      onTap: (){
        setState(() {

        _selectedIndex=index; 
        });
      },
          child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: _selectedIndex==index?Theme.of(context).accentColor:Color(0xFFE7BEE),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Icon(_icons[index],size:25,color:_selectedIndex==index? Theme.of(context).primaryColor:Color(0xFFB4C1C4),),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 120,
              ),
              child: Text('What yould you like to find?',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _icons
            .asMap()
            .entries
            .map(
              (MapEntry map)=>_buildIcon(map.key)
            )
            .toList(),
            ),
          GestureDetector(
            onTap: ()=>print('seall'),
            child: DestinatonCarousel()),
            HotelCarousel(),

          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (int value){
            setState(() {
             _currentTab=value; 
            });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search,size:20),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_pizza,size:20),
            title: SizedBox.shrink()
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage('assets/images/book1.jpg',),
            ),
            title: SizedBox.shrink()
          ),
        ],
      ),
      
    );
  }
}