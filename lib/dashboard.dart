import 'package:flutter/material.dart';



  class Dashboard extends StatefulWidget {
    @override
    _DashboardState createState() => _DashboardState();
  }
  
  class _DashboardState extends State<Dashboard> {
      static const String _kSmallLogoImage = 'logos/pesto/logo_small.png';
  static const String _kGalleryAssetsPackage = 'flutter_gallery_assets';
  static const double _kAppBarHeight = 128.0;  
  static const double _kFabHalfSize = 28.0; // TODO(mpcomplete): needs to adapt to screen size
  static const double _kRecipePageMaxWidth = 500.0;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;
  final backgroundColor=Colors.green;
    @override
    Widget build(BuildContext context) {
      return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.4 * screenWidth,
      right: isCollapsed ? 0 : -0.2 * screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          animationDuration: duration,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          elevation: 8,
          color: backgroundColor,
          //child: Container(
            //height: screenHeight,
            //width: screenWidth,
            child:PageView(
              physics: BouncingScrollPhysics(),
              pageSnapping: false,
              children: <Widget>[Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        child: Icon(Icons.menu, color: Colors.white),
                        onTap: () {
                          setState(() {
                            if (isCollapsed)
                              _controller.forward();
                            else
                              _controller.reverse();

                            isCollapsed = !isCollapsed;
                          });
                        },
                      ),
                      Text("Book Reselling App", style: TextStyle(fontSize: 24, color: Colors.white)),
                      //Spacer(),
                      InkWell(child: Icon(Icons.search, color: Colors.white),onTap: (){
                        //scaffoldKey.currentState.showSnackBar(const SnackBar(content: Text('Not supported.'),));
                      },),
                      //Icon(Icons.settings, color: Colors.white),
                    ],
                  ),
                  SizedBox(height: 1),
                  // Container(
                  //   height: screenHeight/4-10,
                  //   child: PageView(
                  //     physics: BouncingScrollPhysics(),
                  //     controller: PageController(viewportFraction: 0.8),
                  //     scrollDirection: Axis.vertical,
                  //     //pageSnapping: true,
                  //     children: <Widget>[
                  //       Container(
                  //          margin: const EdgeInsets.symmetric(vertical: 8),
                  //         color: Colors.redAccent,
                  //       ),
                  //       Container(
                  //         margin: const EdgeInsets.symmetric(horizontal: 8),
                  //         color: Colors.blueAccent,
                  //       ),
                  //       Container(
                  //         margin: const EdgeInsets.symmetric(horizontal: 8),
                  //         color: Colors.greenAccent,
                  //       ),
                  //     ],
                  //   ),
                    
                  // ),
                  // Expanded(
                  //   child: Text(''),
                  // ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    //color: Colors.white,
                    height: screenHeight-100,
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                    children: <Widget>[
                      Container(
                        height: screenWidth/3+100,
                        width: screenWidth,
                        decoration: BoxDecoration(
                          boxShadow: [BoxShadow(
            color: Colors.grey,
            blurRadius: 5.0,
          ),],
                        //color: Colors.white38,
                        borderRadius: BorderRadius.all( Radius.circular(10)),
                        image: DecorationImage(image: AssetImage('assets/images/book1.jpg'),fit:BoxFit.fill,
                        )
                        
            ),
            //child: Image.asset('assets/images/book1.jpg',fit: BoxFit.cover,),
            child: Container(child: Column(mainAxisAlignment: MainAxisAlignment.start,children: <Widget>[Text('Welcome this Portal \Now Sell your book at better price\nIntroducing Book\n Selling Portal',style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),)],),),
            ),
            SizedBox(height: 20,),
            Container(
            height:  screenHeight/2-50,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Container(
            height: screenHeight/10,
            width: screenWidth-35,
            decoration: BoxDecoration(color: Colors.red[50],borderRadius: BorderRadius.circular(10),boxShadow: [BoxShadow(
            color: Colors.grey,
            blurRadius: 5.0,
          )],),
            
            child: Column(
              children: <Widget>[
                Text('Engineering Books',style: TextStyle(fontSize: 20),),
              ],
            ),

          ),
          SizedBox(height:10),
          Container(
            height: screenHeight/10,
            width: screenWidth-35,
            decoration: BoxDecoration(color: Colors.red[50],borderRadius: BorderRadius.circular(10),boxShadow: [BoxShadow(
            color: Colors.grey,
            blurRadius: 5.0,
          )],),
            
            child: Column(
              children: <Widget>[
                Text('Engineering Books',style: TextStyle(fontSize: 20),),
              ],
            ),

          ),
          SizedBox(height: 10,),
          Container(
            height: screenHeight/10,
            width: screenWidth-35,
            decoration: BoxDecoration(color: Colors.red[50],borderRadius: BorderRadius.circular(10)),
            
            child: Column(
              children: <Widget>[
                Text('Engineering Books',style: TextStyle(fontSize: 20),),
              ],
            ),

          ),
          
        ],
      ),
    
    )

                    ],),
                  ),
                  Container(
                    
                  )
                  // SizedBox(height: 20),
                  // Text("Transactions", style: TextStyle(color: Colors.white, fontSize: 20),),
                  // ListView.separated(
                  //   shrinkWrap: true,
                  //     itemBuilder: (context, index) {
                  //   return ListTile(
                  //     title: Text("Macbook"),
                  //     subtitle: Text("Apple"),
                  //     trailing: Text("-2900"),
                  //   );
                  // }, separatorBuilder: (context, index) {
                  //   return Divider(height: 16);
                  // }, itemCount: 1)
                ],
              ),
            ),]
          ),
          )
        ),
      //),
    );
  }
 }