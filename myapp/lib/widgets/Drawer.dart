import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:myapp/screens/HomePage.dart';
import 'package:myapp/screens/LoginPage.dart';

void main() {
  runApp(MyDrawer());
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.deepPurple,
                ),
                accountEmail: Text("martin"),
                accountName: Text("pappu"),
                currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/kammo.jpg")))),
        SizedBox(height: 30),
        ListTile(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
                  
            },
            leading: Icon(Icons.home, color: Colors.purple),
            title: Text("Home screen"),
            horizontalTitleGap: 10,
            trailing: Icon(Icons.arrow_forward)),
        SizedBox(height: 4),
        ListTile(
            trailing: Icon(Icons.arrow_forward),
            leading: Icon(Icons.settings, color: Colors.purple),
            title: Text("Settings"),
            selectedTileColor: Colors.red,
            horizontalTitleGap: 7,
            onTap: () {}),
        SizedBox(height: 4),
        ListTile(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => login()));
          },
          leading: Icon(Icons.exit_to_app, color: Colors.purple),
          title: Text("Logout"),
          horizontalTitleGap: 10,
          trailing: Icon(Icons.arrow_forward_ios),
        )
      ], 
    ));
  }
}
