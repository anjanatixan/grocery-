import 'package:flutter/material.dart';

class Password extends StatefulWidget {
  const Password({ Key? key }) : super(key: key);

  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar:  AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: const Text(
          "Choose a Password",
          style: TextStyle(color: Colors.black, fontSize: 20,fontFamily: "Poppins"),
        ),
      ),
      body: Center(
        child: SafeArea(child:
        Center(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("For the security & safety please choose a password",style: TextStyle(fontSize:15,fontFamily: "Poppins")),
                      SizedBox(height: 20,),
                      Padding(
                        padding: EdgeInsets.all(30),
                        child: Image.asset("assets/images/Mobile login.png"),
                      ),
                      SizedBox(height: 5,),
                      TextFormField(
                        obscureText: true,
                         decoration: InputDecoration(
                          border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none
                          ),
                          filled: true,
                          fillColor: Color(0xFFe7edeb),
                          suffixIcon: Icon(Icons.visibility),
                          prefixIcon: Icon(Icons.lock_outline),
                          hintText: "Password",hintStyle: TextStyle(fontFamily: 'Poppins',),
                           ),
                       ),
                       SizedBox(height: 10,),
                      TextFormField(
                        obscureText: true,
                         decoration: InputDecoration(
                          border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none
                          ),
                          filled: true,
                          fillColor: Color(0xFFe7edeb),
                          suffixIcon: Icon(Icons.visibility),
                          prefixIcon: Icon(Icons.lock_outline),
                          hintText: "Confirm Password",hintStyle: TextStyle(fontFamily: 'Poppins',),
                           ),
                       ),
                       SizedBox(height: 10,),
            
                       SizedBox(
                            height: 50,
                            width: 400,
                            child: ElevatedButton(onPressed: (){
                              Navigator.pushNamed(context, '/bottomNavBar');
                            }, child: Text("Finish, Good to go"),
                            style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),),
                          ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )),
      ),

      
    );
  }
}