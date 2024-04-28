import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    const imageUrl =
        "https://i.pinimg.com/736x/8b/16/7a/8b167af653c2399dd93b952a48740620.jpg";

    return Drawer(
      child: Container(
        color: Color(0xff424240),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(color: Colors.white),
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text("User Name"),
                accountEmail: Text("user@gmail.com"),
                currentAccountPicture:
                CircleAvatar(backgroundImage:
                NetworkImage(imageUrl)),
              ),
            ),

            // SizedBox(
            //   height: 70,
            // ),
            // CircleAvatar(backgroundImage: NetworkImage(imageUrl)),
            // "Fuck off bitch".text.make(),

            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text("Home",
                  textScaleFactor: 1,
                  style:(
                      TextStyle(color: Colors.white))),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text("Profile",
                  textScaleFactor: 1,
                  style: (
                       TextStyle(color: Colors.white))),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text("Mail",
                  textScaleFactor: 1,
                  style: (
                      TextStyle(color: Colors.white))),
            ),

            ListTile(
              leading: Icon(
                Icons.contact_emergency,
                color: Colors.white,
              ),
              title: Text("Contact us",
                  textScaleFactor: 1,
                  style: (
                      TextStyle(color: Colors.white))

                // (TextStyle(color: Colors.white)),

              ),
            ),
            SizedBox(
              height: 180,
            ),
            ListTile(
              leading: Icon(
                Icons.question_mark_rounded,
                color: Colors.white,
              ),
              title: Text("About us",
                  textScaleFactor: 1,
                  style: TextStyle(color: Colors.white)),
            ),

            ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              title: Text("Log out",
                  textScaleFactor: 1,
                  style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}

