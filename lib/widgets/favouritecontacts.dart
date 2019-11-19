import 'package:book/models/message_model.dart';
import 'package:book/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class FavouriteContacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Favourite Contacts',
          style: TextStyle(
            color: Colors.blueGrey,
            fontSize: 18,
            letterSpacing: 1.0,
          ),),
          IconButton(
            icon: Icon(
              Icons.more_horiz,
              color: Colors.blueGrey,),
              onPressed: (){},)
            ],
          ),
        ),
        Container(height: 120,
        //color: Colors.blue,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 10,),
          scrollDirection: Axis.horizontal,
          itemCount: favorites.length,
          itemBuilder: (_,int index){
            return GestureDetector(
              onTap: (){Navigator.push(context,MaterialPageRoute(builder: (_)=>Chatscreen(user:favorites[index])));},
                          child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:30),
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage(favorites[index].imageUrl),
                    ),
                    SizedBox(height: 6,),
                    Text(favorites[index].name,
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                    ),),
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