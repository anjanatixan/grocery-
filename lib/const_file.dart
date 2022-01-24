

import 'package:flutter/material.dart';

// const Color col1 = Color(#F37A20);
// const Color col2 = Color(#4FC2BA);



Widget mainButton({
  required String buttonText,
  required BuildContext context,
  required VoidCallback onpress,
}){
  return GestureDetector(
    child:Container(
      margin: const EdgeInsets.only(left:10,right:10),
      decoration:const BoxDecoration(
       borderRadius: BorderRadius.all(Radius.circular(5)),
       boxShadow: [
         BoxShadow(
           blurRadius: 8,
           offset: Offset(0, 5),
           spreadRadius: 1,
         )
       ]
      ),
      child:Material(
         color: Colors.transparent,
         child: InkWell(
           borderRadius: const BorderRadius.all(Radius.circular(5)),
           onTap: onpress,
           child: Container(
             alignment: Alignment.center,
             padding: const EdgeInsets.only(left: 10,right:10,top: 15,bottom: 15),
             width: MediaQuery.of(context).size.width -20,
             child: Text("Next",style: TextStyle(
               letterSpacing: 1,fontSize: 16,fontFamily: "Poppins",color: Colors.white)
             ),),
           ),
         ),
      ) ,
    );
  



}