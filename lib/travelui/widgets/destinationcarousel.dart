import 'package:book/travelui/models/destination_model.dart';
import 'package:book/travelui/screens/destinationscreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DestinatonCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
            mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                
                children: <Widget>[
                Text('Top Destination',
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
                itemCount: destinations.length,
                itemBuilder: (_,int index){
                  Destination destination=destinations[index];
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_)=>DestinationScreen(destination:destination)));
                    },
                                      child: Container(
                      margin: EdgeInsets.all(10),
                      width: 200,
                      
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: <Widget>[
                          Positioned(
                            bottom: 15,
                              child: Container(
                              height: 120,
                              width: 200,
                              
                              decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('${destination.activities.length} activities',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.0,
                              ),),
                              Text(destination.description,
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
                                Hero(
                                  tag: destination.imageUrl,
                                                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                      child: Image(height: 180,width: 180,
                                    image: AssetImage(destination.imageUrl),fit: BoxFit.cover,),
                                  ),
                                ),
                                Positioned(
                                  left: 10,
                                  bottom: 10,
                                                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(destination.city,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1,
                                      ),),
                                      Row(
                                        children: <Widget>[
                                          Icon(FontAwesomeIcons.locationArrow,size: 10,color: Colors.white,),
                                          SizedBox(width: 5,),
                                          Text(destination.country,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontStyle: FontStyle.normal,
                                            letterSpacing: 1,
                                          ),),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },

              ),
            )
          ],);
  }
}