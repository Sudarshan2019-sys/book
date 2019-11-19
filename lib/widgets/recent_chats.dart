import 'package:book/models/message_model.dart';
import 'package:book/screens/chat_screen.dart';
import 'package:flutter/material.dart';
class RecentChats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
            child: Container(
            decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius:BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            ) ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),


                          child: ListView.builder(
                itemCount: chats.length,
                itemBuilder: (_,int index){
                  final Message chat=chats[index];
                  return GestureDetector(
                    onTap: (){Navigator.push(context,MaterialPageRoute(builder: (_)=>Chatscreen(user:chat.sender)));},
                    child: Container(
                           margin: EdgeInsets.only(top: 5,bottom: 5,right:20),
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical:10),
                      decoration: BoxDecoration(
                        color: chat.unread?Colors.red[100]:Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20)
                        )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              CircleAvatar(radius: 35,backgroundImage: AssetImage(chat.sender.imageUrl),),
                              SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  
                                  Text(chat.sender.name,
                                  style: TextStyle(color: Colors.grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),),
                                  SizedBox(width: 5),
                                  Container(
                                    width: MediaQuery.of(context).size.width*.45,
                                    child: Text(chat.text,
                                    style: TextStyle(color: Colors.grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                                    overflow: TextOverflow.ellipsis,),
                                  )
                                  ,
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(chat.time,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                              ),),
                              SizedBox(height: 10,),
                              chat.unread?Container(
                                width:40,height:20,
                                decoration:BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Theme.of(context).primaryColor,
                                ),
                                alignment: Alignment.center,
                                child: Text('new',
                                style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold
                              ),)):Text(''),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
  }
}