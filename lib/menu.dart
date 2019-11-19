 import 'package:flutter/material.dart';

Widget menu(context,_slideAnimation,_menuScaleAnimation) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: SafeArea(
                      child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Material(
  elevation: 4.0,
  shape: CircleBorder(),
  clipBehavior: Clip.hardEdge,
  color: Colors.transparent,
  child: Ink.image(
    image: AssetImage('assets/images/book1.jpg'),
    fit: BoxFit.cover,
    width: 130.0,
    height: 125.0,
    child: InkWell(
      child: Column(
        children: <Widget>[
            SizedBox(height: 80,),
            Icon(Icons.edit,size: 20,),
            Text('Edit',style:TextStyle(fontSize: 20)),
            
        ],
      ),
      onTap: () {},
    ),
  ),
),
                  SizedBox(height: 10,),
                  Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(children: <Widget>[
                  InkWell(child: Text("Home", style: TextStyle(color: Colors.white, fontSize: 22)),onTap: (){print('dashboard tapped');},),
                  SizedBox(height: 10),
                  InkWell(child: Text("Profile", style: TextStyle(color: Colors.white, fontSize: 22)),onTap: (){print('dashboard tapped');},),
                  SizedBox(height: 10),
                  InkWell(child: Text("Messages", style: TextStyle(color: Colors.white, fontSize: 22)),onTap: (){print('dashboard tapped');},),
                  SizedBox(height: 10),
                  InkWell(child: Text("Chat", style: TextStyle(color: Colors.white, fontSize: 22)),onTap: (){print('dashboard tapped');},),
                  SizedBox(height: 10),
                  InkWell(child: Text("About Us", style: TextStyle(color: Colors.white, fontSize: 22)),onTap: (){print('dashboard tapped');},),
                    ],),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }