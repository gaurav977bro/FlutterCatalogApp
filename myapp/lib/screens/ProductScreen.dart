import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/models/catalog.dart';
import 'package:myapp/widgets/BarTheme.dart';

import 'CartPage.dart';

class Preview extends StatelessWidget {
  final Products contents;

  const Preview({Key? key, required this.contents}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        
        child:Container(
          color:Colors.white,
          child: ButtonBar(
            
            alignment: MainAxisAlignment.center,
            buttonPadding: EdgeInsets.only(right:20),
            children:[
            Text("\$${contents.price}",style:TextStyle(fontWeight:FontWeight.bold,fontSize:25)),
            SizedBox(width:180),
            ElevatedButton(child:Text("Buy",style:TextStyle(fontSize:15)),onPressed:(){},style:ElevatedButton.styleFrom(minimumSize:Size(80,40))),]
               
          ),
        )),
      backgroundColor:MyTheme.creamColor,
        appBar: AppBar(title:Text(contents.name)),
        body: SafeArea(
          
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(tag:Key(contents.name) ,
                  child: Image.network(contents.image,filterQuality: FilterQuality.high,fit:BoxFit.fill,)),
                  Divider(thickness: 2,color:Colors.pink,),
                  SizedBox(height: 30),
                  Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(contents.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30)),
                          Text(contents.desc,
                              style:
                                  TextStyle(fontSize: 20, color: MyTheme.bluish)),
                          SizedBox(height: 50),
                          Row(
                            children: [
                  
                              Text("Add to Cart",style:TextStyle(fontWeight:FontWeight.bold,fontSize:25)),
                              SizedBox(width: 20),
                              FloatingActionButton(
                                  onPressed: 
                                  ()=>Navigator.push(
                                    context,MaterialPageRoute(
                                      builder:(context)=>Cart())), 
                                      child: Icon(CupertinoIcons.cart))
                            ],
                          )
                        ],
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}
