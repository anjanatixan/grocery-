
import 'package:flutter/material.dart';
import 'package:grocery/screens/card_screen.dart';
import 'package:grocery/screens/category_screen.dart';
import 'package:grocery/screens/home.dart';
import 'package:grocery/screens/menu_screen.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({ Key? key }) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
   int _selectedIndex = 0;
     static const List<Widget> screens = [
       Home(),
       CategoryScreen(),
       CardScreen(),
       MenuScreen(),
      
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
 @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar:  AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.grey[200],
        title: const Text(
          "Grocery Go",
          style: TextStyle(color: Colors.black, fontSize: 20,fontFamily: "Poppins"),
        ),
        actions: <Widget>[
        IconButton(
        icon:const Icon(
        Icons.notifications_outlined,
        color: Colors.black,
      ),
      onPressed: (){}, )
    ],
      ),
       
bottomNavigationBar: SizedBox(height: 75,
  child:   Container(
    decoration: BoxDecoration(
      color: Colors.grey[100],
      borderRadius:const BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
      ),
      boxShadow:const [
        BoxShadow(
          offset: Offset(0,0),
          blurRadius: 3,
          color: Colors.grey
        )
      ]
    ),
    child: BottomNavigationBar(
    
              items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                    icon: Icon(Icons.home,),
                    title: Text('Home'),
                    backgroundColor: Colors.white38
                    ),
                      BottomNavigationBarItem(
                     icon: Icon(Icons.category_outlined),
                     title: Text('Category'),
                     backgroundColor: Colors.white38
                     ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.shopping_bag_outlined),
                        title: Text('Card'),
                        backgroundColor: Colors.white38
                        ),
                      BottomNavigationBarItem(
                      icon: Icon(Icons.menu),
                      title: Text('Menu'),
                      backgroundColor: Colors.white38,
                        ),
                        ],
    
              type: BottomNavigationBarType.shifting,
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.grey,iconSize:25,
              onTap: _onItemTapped,
              elevation: 50),
  ),
),
       body: Container(
            color: Colors.grey[300],
            child: Center(
              child: screens.elementAt(_selectedIndex),
            ),
          ),
     
    );
  }
}

