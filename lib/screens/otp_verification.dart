import 'package:flutter/material.dart';
import 'package:grocery/const_file.dart';
import 'package:pinput/pin_put/pin_put.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({ Key? key }) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final FocusNode _pinOTPCodeFocus=FocusNode();

  final BoxDecoration pinOtpDecoration =BoxDecoration(
    color:Colors.grey[100],
    borderRadius:BorderRadius.circular(10.0),
    boxShadow:[
      const BoxShadow(
        color: Colors.grey,
        blurRadius: 2.0,
      )
    ]
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 30,bottom: 30),
                  child: Image.asset("assets/images/phone.png")),
                  const Text ("Enter Verification Code",style: TextStyle(fontSize: 20,fontFamily: "Poppins",fontWeight: FontWeight.bold),),
                  const SizedBox(height: 10,),
                  const Text("We have sent SMS to:",style: TextStyle(fontSize: 14,fontFamily: "Poppins"),),
                  //const SizedBox(height:2),
                  Text("73XXXXXX55",style: const TextStyle(fontSize:18,fontFamily: "Poppins",fontWeight: FontWeight.bold),),
                  const SizedBox(height: 40,),
                Padding(padding: new EdgeInsets.only(left: 30,right: 30),
                child: PinPut(
                  fieldsCount:5,
                  textStyle:const TextStyle(fontSize: 20,color: Colors.black),
                  eachFieldWidth: 40.0,
                  eachFieldHeight: 55.0,
                  focusNode: _pinOTPCodeFocus,
                  submittedFieldDecoration: pinOtpDecoration,
                  selectedFieldDecoration: pinOtpDecoration,
                  followingFieldDecoration: pinOtpDecoration,
                  pinAnimationType: PinAnimationType.rotation,
                  onSubmit: (Pin) async {
        
                  Navigator.pushNamed(context, '/registration');
        
                  },
        
                ),
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Resend OTP",style: TextStyle(color: Colors.red),),

                    Text("Change Phone Number")
                  ],
                ),
                 SizedBox(height: 50,),

                 SizedBox(
                height: 50,
                width: 400,
                child: ElevatedButton(onPressed: (){
                  Navigator.pushNamed(context, '/registration');
                }, child: Text("Next"),
                style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),),
              ),
                // mainButton(buttonText: "Next", context: context, onpress: (){
                // Navigator.pushNamed(context, '/registration');
                // })
              ],
              
            ),
          ),
        ),
      ),
    );
  }
}