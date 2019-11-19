import 'package:flutter/material.dart';

class layout extends StatefulWidget {
  @override
  _layoutState createState() => _layoutState();
}

class _layoutState extends State<layout> {
  gridviewForPhone(){
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: GridView.count(
        crossAxisCount: 6,
        childAspectRatio: 1,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: List.generate(100, (index){
          return Card(
            child:Container(
              alignment:Alignment.center,
              color:Colors.green[100*(index%9)],
              child:Text('$index'),
            )
          );
        }),
      ),
    );
  }
  gridviewForTablet(){
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: GridView.count(
        crossAxisCount: 6,
        childAspectRatio: 1,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: List.generate(100, (index){
          return Card(
            child:Container(
              alignment:Alignment.center,
              color:Colors.red[100*(index%9)],
              child:Text('$index'),
            )
          );
        }),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    final Orientation orientation=MediaQuery.of(context).orientation;
    return Scaffold(
      body: SafeArea(
              child: LayoutBuilder(
          builder: (BuildContext context,BoxConstraints constraints){
            if(constraints.maxWidth<600)
            return gridviewForPhone();
            else gridviewForTablet();
          }
        ),
      ),
    );
  }
}