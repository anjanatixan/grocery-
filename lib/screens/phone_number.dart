
import 'package:flutter/material.dart';

class PhoneNumber extends StatefulWidget {
  const PhoneNumber({ Key? key }) : super(key: key);

  @override
  _PhoneNumberState createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
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
                Image.asset("assets/images/phone.png"),
                const SizedBox(
                  height: 20,
                ),
                const Text("Enter your mobile Number",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,
                fontFamily: 'Poppins'),),
                const SizedBox(height: 12,),
                const Text("We need to verify you.We will send you a one time verifiction code.",style: TextStyle(
                  fontSize: 12,fontFamily: 'Poppins',
                ),),
                const SizedBox(height: 20,),
                 TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none
                    ),
                    filled: true,
                    fillColor: Color(0xFFe7edeb),
                    prefixIcon: Icon(Icons.phone,color: Colors.black),
                    prefixText: '+91  ',prefixStyle:TextStyle(color: Colors.black,fontFamily: 'Poppins',fontSize: 15),
                    hintText: "Phone Number",hintStyle: TextStyle(fontFamily: 'Poppins',),
                  
                  ),
                 validator:(value){
                   if(value!.isEmpty||!RegExp(r'^[1-9]\d{10}$').hasMatch(value)){
                     return 'Enter correct Phone number';
                   }
                 }, 
                ),
                SizedBox(height: 80,),
                SizedBox(
                height: 50,
                width: 400,
                child: ElevatedButton(onPressed: (){
                  Navigator.pushNamed(context, '/otpscreen');
                }, child: Text("Next"),
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