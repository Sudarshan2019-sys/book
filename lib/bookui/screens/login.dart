import 'package:book/bookui/models/user.dart';
import 'package:book/bookui/screens/homescreen.dart';
import 'package:book/bookui/screens/signup.dart';
import 'package:flutter/material.dart';

import 'data/database_helper.dart';

List _users;

class LoginPage extends StatelessWidget {
  final String background = 'assets/images/book4.jpg';
  final TextEditingController _usernameController = TextEditingController();
  String username;
  String password;
  final TextEditingController _passwordController = TextEditingController();
  var db=new DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(background),
                  fit: BoxFit.cover
                )
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              color: Colors.black.withOpacity(0.7),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.all(20.0),
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      SizedBox(height: 100.0,),
                      Text("Welcome to Book \nShopping Portal", style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0
                      ),),
                      Text("Sign in to continue", style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0
                      ),),
                      SizedBox(height: 30.0,),
                      TextField(
                        style: TextStyle(color: Colors.white),
                        controller: _usernameController,
                        decoration: InputDecoration(
                          hintText: "Username",
                          hintStyle: TextStyle(color: Colors.white70),
                          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white54))
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      TextField(
                        obscureText: true,
                        style: TextStyle(color: Colors.white),
                        controller: _passwordController,
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.white70),
                          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white54))
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      GestureDetector(
                        onTap: (){},
                        child: Text("Forgot your password?", style: TextStyle(
                          color: Colors.white
                        ),),
                      ),

                      SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                          child: Text("Sigi In".toUpperCase()+"to continue"),
                          onPressed: () async{
                            _users=await db.getAllUsers();


                        for(int i=0;i<_users.length;i++){
                        User user=User.map(_users[i]);
                        print("Username:${user.username},User Id:${user.password}");
                        if(_usernameController.text==user.username && _passwordController.text==user.password)
                        {Navigator.of(context).push(MaterialPageRoute(builder: (_)=>HomeScreen()));}
                        else
                        {}
                          }
                        },
                        
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Dont have an account?", style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0
                          ),),
                          SizedBox(width: 10.0,),
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>SignupPage()));
                            },
                            child: Text("SIGN UP",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0
                            ),),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Login as Guest", style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0
                          ),),
                          SizedBox(width: 10.0,),
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>HomeScreen()));
                            },
                            child: Text("Guest Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0
                            ),),
                          ),
                        ],
                      ),
                    ],
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}