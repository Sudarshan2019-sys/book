import 'package:flutter/material.dart';

class Orient extends StatefulWidget {
  @override
  _OrientState createState() => _OrientState();
}

class _OrientState extends State<Orient> {
  Widget potrait(){
    return Center(
      child: Text('Potrait'),
    );
  }
  Widget landscape(){
    return Center(
      child: Text('Landscape'),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder:(context,orientation){
        if(orientation==Orientation.portrait){
          return potrait();
        }
        else{
          return landscape();
        }
      }),
    );
  }
}