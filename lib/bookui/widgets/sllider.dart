import 'package:book/bookui/models/book_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
class BuildSlider extends StatefulWidget {
  @override
  _BuildSliderState createState() => _BuildSliderState();
}

class _BuildSliderState extends State<BuildSlider> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 300.0,
      //color: Colors.blue,
      child: Stack(
        children: <Widget>[
          // ClipPath(
          //   clipper: DiagonalPathClipperOne(),
          //   child: Container(
          //     height: 270,
          //     color: Colors.deepOrange,
          //   ),
          // ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Swiper(
              autoplay: true,
              itemBuilder: (BuildContext context,int index){
                Book book=books[index];
                return Container(
                  height: 210,
                  width: 300,
                  
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    //color: Theme.of(context).accentColor,
                    image: DecorationImage(
                      image: ExactAssetImage(book.imageUrl),
                      
                      fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child:Stack(children: <Widget>[
                      
                      Positioned(
                        bottom: 20,
                        left:MediaQuery.of(context).size.width/2-40,
                        
                        child: Text(book.name,
                        style:TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600
                          
                        ) ,),
                      )
                  ],),
                );
              },
              itemCount:books.length,
              pagination: new SwiperPagination(),
            ),
          ),
        ],
      ),
    );
  }
}