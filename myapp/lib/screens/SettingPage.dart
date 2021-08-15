import "package:flutter/material.dart";
import 'package:myapp/widgets/BarTheme.dart';

void main() {
  runApp(Setting());
}

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar:AppBar(),
      body:SafeArea(
        child: Container(
          child:Column(
            children: [
              
                 Card(
                   color:Colors.blue[200],
                   margin:EdgeInsets.only(top:10,left:10,right:10),
                   shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

                  child:Container(
                    height: 132,
                    child:Row(
                      children:[
                        SizedBox(width:5),
                        CircleAvatar(
                          
                          minRadius:50,
                          backgroundImage:AssetImage("assets/images/landing.png"),
                  ),SizedBox(width: 100,),
                  
                  Text("User Profile"),
                  ],),
                  )
                  ),
                  SizedBox(height:40),
                  Card(
                    
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    margin:EdgeInsets.only(left:10,right:10),
                    child:Column(
                      children: [
                        ListTile(
                          horizontalTitleGap: 50,
                          contentPadding: EdgeInsets.all(15),
                          onTap:(){
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content:Text("NOT SUPPORTED FOR NOW"),backgroundColor: Colors.green,)
                            );},
                          leading:Icon(Icons.help,color:Colors.pink),
                          title:Text("Help",style:TextStyle(color:Colors.pink,fontSize:20)),
                          trailing:Icon(Icons.arrow_forward,color:Colors.pink) ,),
                          SizedBox(height:5),
                          ListTile(
                            horizontalTitleGap: 50,
                          contentPadding: EdgeInsets.all(15),
                          minVerticalPadding: 20,
                          onTap:(){
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content:Text("NOT SUPPORTED FOR NOW"),backgroundColor: Colors.green,)
                            );},
                          leading:Icon(Icons.exit_to_app  ,color:Colors.pink),
                          title:Text("Exit",style:TextStyle(color:Colors.pink,fontSize:20)),
                          trailing:Icon(Icons.arrow_forward,color:Colors.pink) ,),
                          ]))
              ])),
      ));
  }
}
