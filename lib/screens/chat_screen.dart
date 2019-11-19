import 'package:book/models/message_model.dart';
import 'package:book/models/user_model.dart';
import 'package:flutter/material.dart';
class Chatscreen extends StatefulWidget {
  final User user;

  Chatscreen({this.user});
  @override
  _ChatscreenState createState() => _ChatscreenState();
}

class _ChatscreenState extends State<Chatscreen> {
  _buildMessage(Message message, bool isMe){
    final Container msg=Container(
          margin: isMe?EdgeInsets.only(top: 8,bottom: 8,left: 60):EdgeInsets.only(top:8,bottom: 8,right: 80),

          
          padding: EdgeInsets.symmetric(horizontal: 25,vertical: 15),
          width: MediaQuery.of(context).size.width*.70,
          decoration: BoxDecoration(
            color:isMe?Theme.of(context).primaryColor:Colors.red[100],
            borderRadius:isMe? BorderRadius.only(
            topLeft: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          ):BorderRadius.only(
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(15),)),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(message.time,
              style: TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.w100,
                fontSize: 13
              ),),
              SizedBox(height: 8,),
              Text(message.text,
              style: TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.w100,
                fontSize: 13
              ),),
            ],
          )
        );
        if(isMe){
          return msg;
        }
    return Row(
      children: <Widget>[
        msg,
        IconButton(
          icon: message.isLiked?Icon(Icons.favorite):Icon(Icons.favorite_border),
          iconSize: 30,
          color: message.isLiked?Colors.red:Colors.blueGrey,
          onPressed: (){},
        )
      ],
    );
  }
  _buildMessageComposer(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 70,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
            icon:Icon(Icons.photo),
            iconSize: 25,
            color: Theme.of(context).primaryColor,
            onPressed: (){},
          ),
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value){
                setState(() {
                  
                });
              },
              decoration: InputDecoration.collapsed(
                hintText: 'Send a message'
              ),
            ),
          ),
          IconButton(
            icon:Icon(Icons.send),
            iconSize: 25,
            color: Theme.of(context).primaryColor,
            onPressed: (){},
          )
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(widget.user.name,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),),
        actions: <Widget>[
          IconButton(
          icon: Icon(Icons.more_horiz,color: Colors.white,),
          iconSize: 30,
          onPressed: (){},
          
        ),
        ],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: GestureDetector(
        onTap: ()=>FocusScope.of(context).unfocus(),
              child: Column(
          children: <Widget>[
            Expanded(
                        child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                                child: ListView.builder(
                                  reverse: true,
                                  padding: EdgeInsets.only(top:15),
                    itemCount: messages.length,
                    itemBuilder: (_,int index){
                      final Message message=messages[index];
                      final bool isMe =message.sender.id==currentUser.id;
                      return _buildMessage(message, isMe);
                    },
                  ),
                ),
              ),
            ),
            _buildMessageComposer(),
          ],
        ),
      ),
      
    );
  }
}