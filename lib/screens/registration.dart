import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
 const Registration({ Key? key }) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
 String? name;

 final GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
      body: SafeArea(child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Container(
              margin:const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 const Text("it looks like you don't have account in,this number.Please let us know some information for a secure service"),
                const SizedBox(height: 30),
                  Center(
                    child: CircleAvatar(
                      child: MaterialButton(onPressed: (){},child: Icon(Icons.camera_alt_outlined,size: 40,),
                      shape:const CircleBorder(),
                      ),
                      backgroundColor:const Color(0xFFe7edeb),
                      radius: 60,
      
                    
                    ),
                  ),
                 const SizedBox(height: 100,),
                  TextFormField(
                    
                    decoration: InputDecoration(
                          border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none
                          ),
                          filled: true,
                          fillColor:const Color(0xFFe7edeb),
                          prefixIcon:const Icon(Icons.account_circle,color: Colors.black),
                          hintText: "Full Name",hintStyle:const TextStyle(fontFamily: 'Poppins',),
                           ),
                            validator: (value) {
                           if (value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                           return 'Enter correct name';
                           } else if (value.length < 4) {
                           return "Name should be atleast 4 character";
                           } else {
                          return null;
                           }
                            },
                           onSaved: (value) {
                           name = value;
                         },
                       ),
                const SizedBox(height: 210,),
                      SizedBox(
                      height: 50,
                      width: 400,
                      child: ElevatedButton(onPressed: (){
                        if (formKey.currentState!.validate()){
                            Navigator.pushNamed(context, '/password');
                        }else{
                          return;
                        }
                       
                      }, child:const Text("Next",style:TextStyle(fontFamily: 'Poppins',)),
                      style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),),
                    ),
                ],
              ),
            ),
          ),
        ),
      ))
    );
  }
}