import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  gridviewForPhone(Orientation orientation){
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: GridView.count(
        crossAxisCount: orientation==Orientation.portrait?4:6,
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
  gridviewForTablet(Orientation orientation){
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: GridView.count(
        crossAxisCount: orientation==Orientation.portrait?4:6,
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
    final double shortestSlide =MediaQuery.of(context).size.shortestSide;
    final bool useMobileLayout=shortestSlide<600.0;
    final Orientation orientation=MediaQuery.of(context).orientation;
    return Container(
      alignment: Alignment.center,
      child: useMobileLayout?gridviewForPhone(orientation):gridviewForTablet(orientation),
    );
  }
}