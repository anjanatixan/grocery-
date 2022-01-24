import 'package:flutter/material.dart';
import 'package:grocery/screens/phone_number.dart';

 class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    gotoLogin();
    super.initState();
  }

Future<void>gotoLogin()async{
  await Future.delayed(const Duration(seconds: 3));
  Navigator.of(context).push( MaterialPageRoute(builder: (context)=>PhoneNumber()));
}





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration:const BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/logo.png"),
                fit: BoxFit.fill)
              ),
            )
          ],
        ),
      ),
    );
  }
}