import 'package:flutter/material.dart';
import 'package:grocery/screens/home.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({ Key? key }) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
   int _selectedItem = 0;
  //    static const List<Widget> _widgetOptions = <Widget>[
  //      Home(),
  //     ];
  //    void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  //  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
  //     appBar:  AppBar(
  //       elevation: 0,
  //       iconTheme: const IconThemeData(color: Colors.black),
  //       backgroundColor: Colors.white,
  //       title: const Text(
  //         "Grocery Go",
  //         style: TextStyle(color: Colors.black, fontSize: 20,fontFamily: "Poppins"),
  //       ),
  //       actions: <Widget>[
  //       IconButton(
  //       icon: Icon(
  //       Icons.notifications_outlined,
  //       color: Colors.black,
  //     ),
  //     onPressed: (){}, )
  // ],
  //     ),
      
  //      body: SizedBox(),

//        bottomNavigationBar: BottomNavigationBar(
//           items: const <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.home,color: Colors.black),
//                 title: Text('Home'),
//                 backgroundColor: Colors.white),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.category_outlined,color: Colors.black),
//                title: Text('Category'),
//                 backgroundColor: Colors.white),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.shopping_bag_outlined,color: Colors.black),
//                title: Text('Cart'),
//                 backgroundColor: Colors.white),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.menu,color: Colors.black),
//              title: Text('Menu'),
//               backgroundColor: Colors.white,
//             ),
//           ],
//           type: BottomNavigationBarType.shifting,
//           currentIndex: _selectedIndex,
//           selectedItemColor: Colors.blue,
//           iconSize: 35,
//           onTap: _onItemTapped,
//           elevation: 5),
//     );
//   }
// }
bottomNavigationBar: CustomBottomNavigationBar(
        iconList: [
          Icons.home,
          Icons.category_outlined,
          Icons.shopping_bag_outlined,
          Icons.menu,
          
        ],
        onChange: (val) {
          setState(() {
            _selectedItem = val;
          });
        },
        defaultSelectedIndex: 1,
      ),
          appBar:  AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: const Text(
          "Grocery Go",
          style: TextStyle(color: Colors.black, fontSize: 20,fontFamily: "Poppins"),
        ),
        actions: <Widget>[
        IconButton(
        icon: Icon(
        Icons.notifications_outlined,
        color: Colors.black,
      ),
      onPressed: (){}, )
    ],
      ),
      // body: Center(
      //   child: Text(
      //     "Hello from Item $_selectedItem",
      //     style: TextStyle(fontSize: 26),
      //   ),
      // ),
    );
  }
}

class CustomBottomNavigationBar extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  final List<IconData> iconList;

  CustomBottomNavigationBar(
      {this.defaultSelectedIndex = 0,
      required this.iconList,
      required this.onChange});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;
  List<IconData> _iconList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _selectedIndex = widget.defaultSelectedIndex;
    _iconList = widget.iconList;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _navBarItemList = [];

    for (var i = 0; i < _iconList.length; i++) {
      _navBarItemList.add(buildNavBarItem(_iconList[i], i));
    }

    return Row(
      children: _navBarItemList,
    );
  }

  Widget buildNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        widget.onChange(index);
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width / _iconList.length,
        decoration: index == _selectedIndex
            ? BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 4, color: Colors.green),
                ),
                gradient: LinearGradient(colors: [
                  Colors.green.withOpacity(0.3),
                  Colors.green.withOpacity(0.015),
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter)
                // color: index == _selectedItemIndex ? Colors.green : Colors.white,
                )
            : BoxDecoration(),
        child: Icon(
          icon,
          color: index == _selectedIndex ? Colors.black : Colors.grey,
        ),
      ),
    );
  }
}