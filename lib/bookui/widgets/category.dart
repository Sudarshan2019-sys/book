import 'package:flutter/material.dart';

class CategorySelect extends StatefulWidget {
  @override
  _CategorySelectState createState() => _CategorySelectState();
}

class _CategorySelectState extends State<CategorySelect> {
  @override
  Widget build(BuildContext context) {
    return Container(
              height: 60,
              //color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      CircleAvatar(
                        child: Icon(Icons.book,
                        semanticLabel: 'hello',),
                      ),
                      Text('Engineering')
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      CircleAvatar(
                        child: Icon(Icons.mobile_screen_share,),
                      ),
                      Text('IT')
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      CircleAvatar(
                        child: Icon(Icons.business,
                        semanticLabel: 'hello',),
                      ),
                      Text('Commerce')
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      CircleAvatar(
                        child: Icon(Icons.directions_bus,),
                      ),
                      Text('Science')
                    ],
                  ),
                ],
              ),
              
              );
  }
}