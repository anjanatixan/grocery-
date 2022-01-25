import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  const Registration({ Key? key }) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: const Text(
          "Your Information",
          style: TextStyle(color: Colors.black, fontSize: 20,fontFamily: "Poppins"),
        ),
      ),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("it looks like you don't have account in,this number.Please let us know some information for a secure service"),
               SizedBox(height: 30),
                Center(
                  child: CircleAvatar(
                    child: MaterialButton(onPressed: (){},child: Icon(Icons.camera_alt_outlined,size: 40,),
                    shape: CircleBorder(),
                    ),
                    backgroundColor: Color(0xFFe7edeb),
                    radius: 60,

                  
                  ),
                ),
                SizedBox(height: 100,),
                TextFormField(
                  decoration: InputDecoration(
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none
                        ),
                        filled: true,
                        fillColor: Color(0xFFe7edeb),
                        prefixIcon: Icon(Icons.account_circle,color: Colors.black),
                        hintText: "Full Name",hintStyle: TextStyle(fontFamily: 'Poppins',),
                         ),
                     ),
              SizedBox(height: 210,),
                    SizedBox(
                    height: 50,
                    width: 400,
                    child: ElevatedButton(onPressed: (){
                      Navigator.pushNamed(context, '/password');
                    }, child: Text("Next"),
                    style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),),
                  ),
              ],
            ),
          ),
        ),
      ))
    );
  }
}