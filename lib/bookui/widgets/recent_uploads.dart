import 'package:book/bookui/models/recent_uploads.dart';
import 'package:flutter/material.dart';

class RecentUploads extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
            mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                
                children: <Widget>[
                Text('Recent Uploads',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0
                )),
                Spacer(),
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
                itemCount: uploads.length,
                itemBuilder: (_,int index){
                  var upload=uploads[index];
                  return Container(
                    margin: EdgeInsets.all(10),
                    width: 200,
                    
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        Positioned(
                          bottom: 15,
                            child: Container(
                            height: 200,
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
                            Text('${upload.name}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.0,
                            ),),
                            SizedBox(height: 2,),
                            Text(upload.description,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.0,
                            ),),
                            Text('\$${upload.price}',
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
                                image: AssetImage(upload.imageUrl),fit: BoxFit.cover,),
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