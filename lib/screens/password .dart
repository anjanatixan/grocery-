import 'package:flutter/material.dart';

class Password extends StatefulWidget {
  const Password({ Key? key }) : super(key: key);

  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  final _passwordController=TextEditingController();
  final _confirmController=TextEditingController();
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
                margin:const EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    const Text("For the security & safety please choose a password",style: TextStyle(fontSize:15,fontFamily: "Poppins")),
                     const SizedBox(height: 20,),
                      Padding(
                        padding:const EdgeInsets.all(30),
                        child: Image.asset("assets/images/Mobile login.png"),
                      ),
                    const SizedBox(height: 5,),
                      TextFormField(
                          controller: _passwordController,
                        obscureText: true,
                         decoration: InputDecoration(
                          border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none
                          ),
                          filled: true,
                          fillColor:const Color(0xFFe7edeb),
                          suffixIcon:const Icon(Icons.visibility),
                          prefixIcon:const Icon(Icons.lock_outline),
                          hintText: "Password",hintStyle:const TextStyle(fontFamily: 'Poppins',),
                           ),
                       ),
                      const SizedBox(height: 10,),
                      TextFormField(
                        controller: _confirmController,
                        obscureText: true,
                         decoration: InputDecoration(
                          border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none
                          ),
                          filled: true,
                          fillColor:const Color(0xFFe7edeb),
                          suffixIcon:const Icon(Icons.visibility),
                          prefixIcon:const Icon(Icons.lock_outline),
                          hintText: "Confirm Password",hintStyle:const TextStyle(fontFamily: 'Poppins',),
                           ),
                       ),
                      const SizedBox(height: 10,),
                            
                       SizedBox(
                            height: 50,
                            width: 400,
                            child: ElevatedButton(onPressed: (){
                                 checkLoggin();
                            }, child:const Text("Finish, Good to go",style:TextStyle(fontFamily: 'Poppins',)),
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
void checkLoggin(){
    final _password= _passwordController.text;
    final _confirm=_confirmController.text;
    if(_password==_confirm){
        
        Navigator.pushNamed(context, '/bottomNavBar');
    }else{
       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(20),backgroundColor: Colors.white,
        content: Text('password doesnot match',style: TextStyle(color: Colors.black),)));
      
    }
 
}
}
