import 'package:flutter/material.dart';

class MediaQuer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width*.3,
            height: MediaQuery.of(context).size.height*.5,
            decoration: BoxDecoration(color: Colors.red),
          ),
          Container(
            width: MediaQuery.of(context).size.width*.3,
            decoration: BoxDecoration(color: Colors.blue),),
        ],
      ),
    );
  }
}