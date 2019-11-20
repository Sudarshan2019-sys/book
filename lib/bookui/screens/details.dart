import 'package:book/bookui/models/book_activity.dart';
import 'package:book/bookui/models/book_details.dart';
import 'package:book/bookui/models/book_details.dart';
import 'package:book/bookui/models/book_details.dart';
import 'package:book/travelui/models/activity_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailsScreen extends StatefulWidget {
  final Book book;

  DetailsScreen({this.book});
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  _buildRatingStar(int rating){
    String stars='';
    for(int i=0;i<rating;i++){
      stars+='⭐';
    }
    stars.trim();
    return Text(stars);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height*.4,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0,2),
                      blurRadius: 6
                    )
                  ]
                ),
                child: Hero(
                  tag:widget.book.imageUrl,
                                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(19),
                                    child: Image(
                      image: AssetImage(widget.book.imageUrl,),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back,size: 30,color: Colors.white,),
                    onPressed: ()=>Navigator.pop(context),
                  ),
                  Spacer(),
                  Row(children: <Widget>[
                    IconButton(
                    icon: Icon(Icons.search,size: 30,color: Colors.white,),
                    onPressed: ()=>Navigator.pop(context),
                  ),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.sortAlphaDown,size: 30,color: Colors.white,),
                    onPressed: ()=>Navigator.pop(context),
                  ),
                  ],)
                ],),
              ),
               Positioned(
                 left: 20,
                 bottom: 20,
                                child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(widget.book.name,
                                        style: TextStyle(
                                          fontSize: 35,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1,
                                        ),),
                                        Row(
                                          children: <Widget>[
                                            Icon(FontAwesomeIcons.locationArrow,size: 20,color: Colors.white70,),
                                            SizedBox(width: 5,),
                                            Text(widget.book.name,
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white70,
                                              fontStyle: FontStyle.normal,
                                              letterSpacing: 1,
                                            ),),
                                          ],
                                        )
                                      ],
                                    ),
               ),
               Positioned(
                 right: 20,
                 bottom: 20,
                 child: Icon(Icons.location_on,
                 color:Colors.white70,
                 size: 25,),
               )
            ],
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:10.0),
            child: Row(
              children: <Widget>[
              Text('Similar Books'), 
              ],
            ),
          ),
          Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.only(top: 10,bottom: 15),
              itemCount: widget.book.description.length,
              itemBuilder: (_,int index){
                var activity=widget.book.activities[index];
                return Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 5, 20, 5),
                      height: 170,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:BorderRadius.circular(20)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left:130,top:8.0,bottom: 10,right:10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                              Container(
                                width: 120,
                                child: Text(activity.name,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,

                                ),
                                overflow:TextOverflow.ellipsis,
                                maxLines: 2,),
                              ),
                              Column(
                                children: <Widget>[
                                  Text('\$ ${activity.price}',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                
                              ),),
                              Text('per piece',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                                
                              ),),
                                ],
                              )
                              
                            ],),
                            Text(activity.type,style: TextStyle(
                              color: Colors.grey,
                            ),),
                            _buildRatingStar(activity.rating),

                            SizedBox(height:10),
                            Row(children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(5),
                                width: 70,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).accentColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                alignment: Alignment.center,
                                child: Text(activity.startTimes[0]),
                              ),
                              SizedBox(width: 10,),
                              Container(
                                width: 70,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).accentColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                alignment: Alignment.center,
                                child: Text(activity.startTimes[1]),
                              )
                            ],)

                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      top: 15,
                      bottom: 15,
                        child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image(width: 110,image: AssetImage(activity.imageUrl),fit: BoxFit.cover,),
                        
                      ),
                    )
                  ],
                );
              },
            ),
          )
        ],
      ),
      
    );
  }
}