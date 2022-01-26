import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery/screens/registration.dart';
import 'package:pinput/pin_put/pin_put.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNumber;
  const OtpScreen({ Key? key ,required this.phoneNumber}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey =GlobalKey<ScaffoldState>();
  final TextEditingController _pinOTPCodeController =TextEditingController();
  final FocusNode _pinOTPCodeFocus=FocusNode();

  String? verificationCode;

  final BoxDecoration pinOtpDecoration =BoxDecoration(
    color:Colors.grey[100],
    borderRadius:BorderRadius.circular(10.0),
    boxShadow:const [
       BoxShadow(
        color: Colors.grey,
        blurRadius: 2.0,
      )
    ]
  );

  @override
  void initstate(){
    super.initState();
    verifyphoneNumber();
  }
    
   verifyphoneNumber() async{
     await FirebaseAuth.instance.verifyPhoneNumber(
    phoneNumber: "+91 ${widget.phoneNumber}", 
    verificationCompleted: (PhoneAuthCredential credential) async{
      await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
        if(value.user ==null){
           Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>Registration()),
           (route)=>false);
          
        }
      });
    } ,
    verificationFailed:(FirebaseAuthException e){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Invalid OTP"),
      duration: Duration(seconds: 3),));
    }, codeSent: (String vID, int? resendToken){
      setState(() {
        verificationCode =vID;
      });
    }, codeAutoRetrievalTimeout: (String vID){
      setState(() {
        verificationCode=vID;
      });
    },
    timeout: const Duration(seconds: 60),);
   }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(25),
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
                  Text("+91 ${widget.phoneNumber}",
                  style: const TextStyle(fontSize:18,fontFamily: "Poppins",fontWeight: FontWeight.bold),),
                  const SizedBox(height: 40,),
                Padding(padding: const EdgeInsets.only(left: 30,right: 30),
                child: PinPut(
                  fieldsCount:6,
                  textStyle:const TextStyle(fontSize: 20,color: Colors.black),
                  eachFieldWidth: 40.0,
                  eachFieldHeight: 55.0,
                  focusNode: _pinOTPCodeFocus,
                  submittedFieldDecoration: pinOtpDecoration,
                  selectedFieldDecoration: pinOtpDecoration,
                  followingFieldDecoration: pinOtpDecoration,
                  pinAnimationType: PinAnimationType.rotation,
                  onSubmit: (pin) async {
                  try{
                    await FirebaseAuth.instance.signInWithCredential(PhoneAuthProvider.credential(
                    verificationId: verificationCode!, smsCode: pin)).then((value) {
                      if(value.user! ==null){
                         Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>Registration()),
                        (route)=>false);
                      }
                    });
                  }catch (e) {
                     FocusScope.of(context).unfocus();
                     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Invalid OTP"),
                     duration: Duration(seconds: 3),));
                  }
                 },
                 ),
                ),
              const  SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:const [
                    Text("Resend OTP",style: TextStyle(color: Colors.red),),
                    Text("Change Phone Number")
                  ],
                ),
                const SizedBox(height: 50,),

                 SizedBox(
                height: 50,
                width: 400,
                child: ElevatedButton(onPressed: (){
                  Navigator.pushNamed(context, '/registration');
                }, child:const Text("Next",style:TextStyle(fontFamily: 'Poppins',)),
                style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),),
              ),
                
              ],
              
            ),
          ),
        ),
      ),
    );

    
  }
}