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
        child: Container(
      color: Colors.deepPurple,
      child: ListView(
        children: [
          DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.deepPurple,
                  ),
                  accountEmail: Text("Martin"),
                  accountName: Text("Kammo"),
                  currentAccountPicture: CircleAvatar(
                      minRadius: 10.0,
                      backgroundImage: AssetImage("assets/images/kammo.jpg")))),
          SizedBox(height: 30),
          ListTile(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              leading: Icon(Icons.home, color: Colors.white),
              title: Text("Home screen", style: TextStyle(color: Colors.white)),
              subtitle: Text("Refresh", style: TextStyle(color: Colors.white)),
              horizontalTitleGap: 0,
              trailing: Icon(Icons.arrow_forward, color: Colors.white)),
          SizedBox(height: 4),
          ListTile(
              trailing: Icon(Icons.arrow_forward, color: Colors.white),
              leading: Icon(Icons.settings, color: Colors.white),
              title: Text("Settings", style: TextStyle(color: Colors.white)),
              subtitle: Text("privacy, help, profile",
                  style: TextStyle(color: Colors.white)),
              selectedTileColor: Colors.red,
              horizontalTitleGap: 0,
              onTap: () {}),
          SizedBox(height: 4),
          ListTile(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login()));
            },
            leading: Icon(Icons.running_with_errors, color: Colors.white),
            title: Text("Logout", style: TextStyle(color: Colors.white)),
            horizontalTitleGap: 0,
            trailing: Icon(Icons.arrow_forward, color: Colors.white),
          )
        ],
      ),
    ));
  }
}
