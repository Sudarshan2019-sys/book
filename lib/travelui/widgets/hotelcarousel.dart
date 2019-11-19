import 'package:book/travelui/models/hotel_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HotelCarousel extends StatefulWidget {
  @override
  _HotelCarouselState createState() => _HotelCarouselState();
}

class _HotelCarouselState extends State<HotelCarousel> {
  @override
  Widget build(BuildContext context) {
    return  Column(
            mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                
                children: <Widget>[
                Text('Exclusive Hotels',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0
                )),
                Text('See All',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).primaryColor,
                  letterSpacing: 1.0
                ),)
              ],),
            ),
            Container(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: hotels.length,
                itemBuilder: (_,int index){
                  Hotel hotel=hotels[index];
                  return Container(
                    margin: EdgeInsets.all(10),
                    width: 200,
                    
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        Positioned(
                          bottom: 15,
                            child: Container(
                            height: 120,
                            width: 240,
                            
                            decoration: BoxDecoration(
                      color:Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('${hotel.name}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.0,
                            ),),
                            SizedBox(height: 2,),
                            Text(hotel.address,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.0,
                            ),),
                            Text('\$${hotel.price} /night',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.0,
                            ),),
                          ],
                      ),
                    ),

                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow:[
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0,2),
                                blurRadius: 6
                              ),
                            ] 
                          ),
                          child: Stack(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                  child: Image(height: 180,width: 220,
                                image: AssetImage(hotel.imageUrl),fit: BoxFit.cover,),
                              ),
                              
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },

              ),
            )
          ],);
  }
}