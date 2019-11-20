import 'package:book/bookui/models/book_details.dart';
import 'package:book/bookui/models/recent_uploads.dart';
import 'package:flutter/material.dart';

class BookList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return  
                      ListView.builder(
                        padding: EdgeInsets.only(top: 10,bottom: 15),
              itemCount: uploads.length,
              itemBuilder: (_,int index){
                RecentUploads book=uploads[index];
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
                                child: Column(
                                  children: <Widget>[
                                    Text('Science',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                  fontStyle: FontStyle.italic

                                ),
                                overflow:TextOverflow.ellipsis,
                                maxLines: 2,),
                                Text('${book.description}')
                                  ],
                                )
                              ),
                              Column(
                                children: <Widget>[
                                  Text('\$${book.price}',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                
                              ),),
                              Text('1 piece',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                                
                              ),),
                                ],
                              )
                              
                            ],),
                            // Text('activity.type',style: TextStyle(
                            //   color: Colors.grey,
                            // ),),
                            //_buildRatingStar(activity.rating),

                            // SizedBox(height:10),
                            // Row(children: <Widget>[
                            //   Container(
                            //     padding: EdgeInsets.all(5),
                            //     width: 70,
                            //     decoration: BoxDecoration(
                            //       color: Theme.of(context).accentColor,
                            //       borderRadius: BorderRadius.circular(10),
                            //     ),
                            //     alignment: Alignment.center,
                            //     child: Text('activity.startTimes[0]'),
                            //   ),
                            //   SizedBox(width: 10,),
                            //   Container(
                            //     width: 70,
                            //     decoration: BoxDecoration(
                            //       color: Theme.of(context).accentColor,
                            //       borderRadius: BorderRadius.circular(10),
                            //     ),
                            //     alignment: Alignment.center,
                            //     child: Text('activity.startTimes[1]'),
                            //   )
                            // ],)

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
                        child: Image(width: 110,image: AssetImage('assets/images/book3.jpg'),fit: BoxFit.cover,),
                        
                      ),
                    )
                  ],
                );
              },
            );
  }
}