

import 'package:flutter/material.dart';
import 'package:grocery/screens/otp_verification.dart';
import 'package:grocery/screens/phone_number.dart';
import 'package:grocery/screens/registration.dart';
import 'package:grocery/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
     home: const SplashScreen(),
    // initialRoute: '/splash',
     routes: {
       '/splash':(context)=>const SplashScreen(),
       '/phoneNumber':(context)=>const PhoneNumber(),
       '/otpscreen':(context)=>const OtpScreen(),
       '/registration':(context)=>const Registration(),
     },
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

 

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
     
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
   
//     return Scaffold(
//       appBar: AppBar(
      
//         title: Text(widget.title),
//       ),
//       body: Center(
       
//         child: Column(
          
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
