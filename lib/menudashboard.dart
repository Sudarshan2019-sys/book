import 'package:book/dashboard.dart';
import 'package:book/menu.dart';
import 'package:book/profile.dart';
import 'package:flutter/material.dart';

class SizeConfig {
 static MediaQueryData _mediaQueryData;
 static double screenWidth;
 static double screenHeight;
 static double blockSizeHorizontal;
 static double blockSizeVertical;
 
 static double _safeAreaHorizontal;
 static double _safeAreaVertical;
 static double safeBlockHorizontal;
 static double safeBlockVertical;
 
 void init(BuildContext context) {
 _mediaQueryData = MediaQuery.of(context);
 screenWidth = _mediaQueryData.size.width;
 screenHeight = _mediaQueryData.size.height;
 blockSizeHorizontal = screenWidth / 100;
 blockSizeVertical = screenHeight / 100;
 
 _safeAreaHorizontal = _mediaQueryData.padding.left + 
 _mediaQueryData.padding.right;
 _safeAreaVertical = _mediaQueryData.padding.top +
 _mediaQueryData.padding.bottom;
 safeBlockHorizontal = (screenWidth -
 _safeAreaHorizontal) / 100;
 safeBlockVertical = (screenHeight -
 _safeAreaVertical) / 100;
 }
}

final Color backgroundColor = Color(0xFF4A4A58);

class MenuDashboardPage extends StatefulWidget {
  @override
  _MenuDashboardPageState createState() => _MenuDashboardPageState();
}

class _MenuDashboardPageState extends State<MenuDashboardPage> with SingleTickerProviderStateMixin {
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

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0)).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    final List<String> entries = <String>['A', 'B', 'C','B', 'C','B', 'C','B', 'C','B', 'C','B', 'C','B', 'C','B', 'C','B', 'C','B', 'C','B', 'C','B', 'C','B', 'C','B', 'C','B', 'C','B', 'C','B', 'C','B', 'C','B', 'C','B', 'C','B', 'C','B', 'C','B', 'C','B', 'C','B', 'C','B', 'C','B', 'C','B', 'C','B', 'C','B', 'C','B', 'C','B', 'C','B', 'C','B', 'C','B', 'C','B', 'C','B', 'C','B', 'C','B', 'C','B', 'C','B', 'C','B', 'C','B', 'C','B', 'C','B', 'C','B', 'C','B', 'C','B', 'C','B', 'C','B', 'C','B', 'C',];
final List<int> colorCodes = <int>[600, 500, 100, 500, 100, 500, 100, 500, 100, 500, 100, 500, 100, 500, 100, 500, 100, 500, 100, 500, 100, 500, 100, 500, 100, 500, 100, 500, 100, 500, 100, 500, 100, 500, 100, 500, 100, 500, 100, 500, 100, 500, 100, 500, 100, 500, 100, 500, 100, 500, 100, 500, 100, 500, 100, 500, 100, 500, 100, 500, 100, 500, 100, 500, 100, 500, 100, 500, 100, 500, 100, 500, 100, 500, 100, 500, 100, 500, 100, 500, 100, 500, 100, 500, 100, 500, 100, 500, 100, 500, 100, 500, 100, 500, 100, 500, 100,10, 500, 100, 500, 100,500, 100, 500, 100];

    return Scaffold(
      backgroundColor: backgroundColor,
      // appBar: AppBar(
      //   title: Text('BookResellingApp'),
      //   backgroundColor: Colors.black,
      //   elevation: 0.0,
      // ),
      body: Stack(
        children: <Widget>[
          menu(context,_slideAnimation,_menuScaleAnimation),
          dashboard(context),
          //_buildbody(entries,colorCodes),
        ],
      ),
    );
  }



  Widget dashboard(context) {
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
                        print('Search icon tapped');
                        
                      },),
                  
                    ],
                  ),
                  // Dashboard(),
                  
                  //Dashboard(),
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
            ),
            ]
          ),
          )
        ),
      //),
    );
  }

  Widget _buildbody(entries,colorCodes){
    return ListView.separated(
      physics: BouncingScrollPhysics(),
  padding: const EdgeInsets.all(100),
  itemCount: entries.length,
  itemBuilder: (BuildContext context, int index) {
    return Container(
      height: 90,
      color: Colors.amber[colorCodes[index]],
      child: Center(child: Text('Entry ${entries[index]}')),
    );
  },
  separatorBuilder: (BuildContext context, int index) => const Divider(),
);
  }
}