import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grocery/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:grocery/screens/home.dart';
import 'package:grocery/screens/otp_verification.dart';
import 'package:grocery/screens/phone_number.dart';
import 'package:grocery/screens/registration.dart';
import 'package:grocery/screens/splash_screen.dart';

import 'screens/password .dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
       '/otpscreen':(context)=>const OtpScreen(phoneNumber: "123",),
       '/registration':(context)=>const Registration(),
       '/password':(context)=>const Password(),
       '/home':(context)=>const Home(),
       '/bottomNavBar':(context)=>const BottomNavBar(),
     },
    );
  }
}

