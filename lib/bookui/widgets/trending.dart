import 'package:book/bookui/models/book_details.dart';
import 'package:book/bookui/screens/details.dart';
import 'package:flutter/material.dart';

class TrendingBooks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/2,
      //color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment:MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
                          child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                Text('Popular Books',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20
                ),),
                Text('View All',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20
                ),),
              ],),
            ),
            
            Container(
              height:MediaQuery.of(context).size.height/2-40,
              child:ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: books.length,
              itemBuilder: (_,int index){
                Book book=books[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (_)=>DetailsScreen(book:book)));
                  },
                                  child: Container(
                    margin:EdgeInsets.all(10),
                    decoration:BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            height:220,
                            width: 220,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0,2),
                                  blurRadius: 3
                                )
                              ]
                              //color: Colors.red,
                            ),
                            child: Stack(
                              children: <Widget>[
                                ClipRRect(borderRadius: BorderRadius.circular(10),
                                child: Image(height: 220,width: 220,
                                image: AssetImage(book.imageUrl),
                                fit: BoxFit.cover,),)
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 30,
                            right: 30,
                            
                                                    child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('${book.name}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.0,
                                ),),
                                
                                Text('\$123',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.0,
                                ),),
                                
                                
                              ],
                            ),
                            ),
                          )
                        ],
                      ),
                    ),
                    ),
                );
              },
            )
            )
          ],
        )
      ),
    );
  }
}