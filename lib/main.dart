import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.black,
    systemNavigationBarIconBrightness: Brightness.light,
    systemNavigationBarDividerColor: Colors.transparent,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bottom Navigation Example',
      theme: ThemeData.dark(),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final tabs = [
    Center(
        child: Text('Home',
            style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: Colors.amberAccent))),
    Center(
        child: Text('Explore',
            style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: Colors.amberAccent))),
    Center(
        child: Text('Subscriptions',
            style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: Colors.amberAccent))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Bottombar navigation'),
      ),
      body: SafeArea(child: tabs[_currentIndex]), //TBD
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Icon(
                    Icons.home,
                    size: 30.0,
                  ),
                  Positioned(
                      top: -8.0,
                      right: -4.0,
                      child: Material(
                        type: MaterialType.circle,
                        elevation: 2.0,
                        color: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text('',
                              style: TextStyle(
                                fontSize: 11.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ))
                ],
              ),
              title: Text('Home',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 11.0)),
              backgroundColor: Colors.grey),
          BottomNavigationBarItem(
              icon: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Icon(
                    Icons.explore,
                    size: 30.0,
                  ),
                  Positioned(
                      top: -3.0,
                      right: -8.0,
                      child: Material(
                        type: MaterialType.circle,
                        elevation: 2.0,
                        color: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('99',
                              style: TextStyle(
                                fontSize: 11.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ))
                ],
              ),
              title: Text('Explore',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 11.0)),
              backgroundColor: Colors.grey),
          BottomNavigationBarItem(
              icon: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Icon(
                    Icons.subscriptions,
                    size: 30.0,
                  ),
                  Positioned(
                      top: -3.0,
                      left: 15.0,
                      child: Material(
                        type: MaterialType.card,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8.0))),
                        color: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text('999+',
                              style: TextStyle(
                                fontSize: 11.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ))
                ],
              ),
              title: Text('Subscriptions',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 11.0)),
              backgroundColor: Colors.grey),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
