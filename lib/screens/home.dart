import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
   List<Map<String,String>> imageList = [
     { "img":"assets/images/Fruits-veg.png",
      "name":"Fruits& Vegetables",},
      {"img":"assets/images/breakfast.png",
      "name":"Breakfast" },
     {"img":"assets/images/beverages.png",
      "name":"Beverages"},
      { "img":"assets/images/meat-fish.png",
      "name":"Meat & Fish",},
      { "img":"assets/images/diary.png",
      "name":"Dairy",},
      { "img":"assets/images/snacks.png",
      "name":"Snacks",}
      ];



  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      decoration: BoxDecoration(
                      shape:BoxShape.circle ,color: Colors.blue,),
                      child: IconButton(onPressed: (){}, icon: Icon(Icons.location_on_outlined,color: Colors.white,),
                     iconSize: 20.0,),
                    ),
                 SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:const [
                Text("Your Location",style: TextStyle(fontFamily: 'Poppins'),),
                Text("3rd Street, MG Road,Kochi,Kerala",style: TextStyle(fontFamily: 'Poppins'))
              ],)
                ],
               ),
            ),
            Container(
              margin: EdgeInsets.all(12),
              child: TextField(
                decoration: InputDecoration(
                          border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none
                          ),
                          filled: true,
                          fillColor: Colors.white70,
                          prefixIcon: Icon(Icons.search,color: Colors.black),
                          hintText: "Search Anything",hintStyle: TextStyle(fontFamily: 'Poppins',),
                           ),
              ),
            ),

            Expanded(child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 0,
              crossAxisSpacing: 1), 
              itemCount: imageList.length,
              
              itemBuilder:(context,index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    
                    onTap: (){},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                           
                         //padding: EdgeInsets.all(5),
                          alignment: Alignment.bottomCenter,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white,
                              )
                            ],
                          borderRadius: BorderRadius.circular(10),
                          image:DecorationImage(
                          image:AssetImage(imageList[index]['img'].toString()),
                         // fit: BoxFit.cover,
                          ),
                          ),
                          
                          child:Text(imageList[index]["name"].toString()),
                           ),
                      ),
                    ),
                  ),
                );
              })
           
             ) ],
        ),
      )
    );
  }
}