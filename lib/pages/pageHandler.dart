import 'package:flutter/material.dart';
import 'homeScreen.dart';
import 'experiencePage.dart';
import 'blogScreen.dart';
import 'portfolioScreen.dart';

class PageHandler extends StatefulWidget{

  final String name, email, profileImage;
  PageHandler({this.name, this.email, this.profileImage});

  @override
  PageHandlerState createState() => PageHandlerState();
}

class PageHandlerState extends State<PageHandler> {

  var currentPage;
  
  @override
  void initState() {
    this.currentPage = HomeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage(widget.profileImage),
              ),
              accountName: Text(
                widget.name
              ),
              accountEmail: Text(
                widget.email
              )
            ),
            ListTile(
              title: Text(
                "Home"
              ),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  currentPage = HomeScreen();
                });
              },
            ),
            ListTile(
              title: Text(
                "About"
              ),
              onTap: () {
              },
            ),
            ListTile(
              title: Text(
                "Experience"
              ),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  currentPage = ExperiencePage();
                });
              },
            ),
            ListTile(
              title: Text(
                "Portfolio"
              ),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  currentPage = Portfolio();
                });
              },
            ),
            ListTile(
              title: Text(
                "Blogs"
              ),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  this.currentPage = BlogScreen();
                });
              },
            ),
            ListTile(
              title: Text(
                "Contact"
              ),
              onTap: () {
              },
            ),
            Divider(),
            ListTile(
              title: Text(
                "About the app"
              ),
              onTap: (){
                print("hello world");
              },
            )
          ],
        ),
      ),
      body: currentPage,
    );
  }
}