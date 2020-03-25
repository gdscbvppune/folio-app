import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {

  var content, details;

  fetchDetails() async{
    var ref = Firestore.instance.collection("details");
    var tempContent = await ref.document("content").get();
    var tempDetails = await ref.document("details").get();
    setState(() {
      content = tempContent;
      details = tempDetails;
    });
  }

  @override
  void initState() {
    fetchDetails();
    super.initState();
  }
  
  String formEmail(String text){
    return "mailto:" + text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: (){
            Scaffold.of(context).openDrawer();
          },
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: content != null && details != null ? SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height / 9,
              ),
              Text(
                "Contact Me",
                style: GoogleFonts.raleway(
                  fontSize: 28
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: 24
                ),
                child: Text(
                  content["contactContent"],
                  style: GoogleFonts.openSans(
                    fontSize: 18
                  ),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  details["email"].length > 0 ? InkWell(
                    onTap: () async{
                      if(await canLaunch(formEmail(details["email"]))){
                        launch(formEmail(details["email"]));
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(Icons.email),
                    ),
                  ) : null,
                  details["github"].length > 0 ? InkWell(
                    onTap: () async{
                      if(await canLaunch(details["github"])){
                        launch(details["github"]);
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(FontAwesomeIcons.github),
                    ),
                  ) : null,
                  details["facebook"].length > 0 ? InkWell(
                    onTap: () async{
                      if(await canLaunch(details["facebook"])){
                        launch(details["facebook"]);
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(FontAwesomeIcons.facebook),
                    ),
                  ) : null,
                  details["instagram"].length > 0 ? InkWell(
                    onTap: () async{
                      if(await canLaunch(details["instagram"])){
                        launch(details["instagram"]);
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(FontAwesomeIcons.instagram),
                    ),
                  ) : null,
                  details["linkedin"].length > 0 ? InkWell(
                    onTap: () async{
                      if(await canLaunch(details["linkedin"])){
                        launch(details["linkedin"]);
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(FontAwesomeIcons.linkedin),
                    ),
                  ) : null,
                  details["twitter"].length > 0 ? InkWell(
                    onTap: () async{
                      if(await canLaunch(details["twitter"])){
                        launch(details["twitter"]);
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(FontAwesomeIcons.twitter),
                    ),
                  ) : null,
                  details["medium"].length > 0 ? InkWell(
                    onTap: () async{
                      if( await canLaunch(details["medium"]) ){
                        launch(details["medium"]);
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(FontAwesomeIcons.medium),
                    ),
                  ) : null,
                  details["spotify"].length > 0 ? InkWell(
                    onTap: () async{
                      if(await canLaunch(details["spotify"])){
                        launch(details["spotify"]);
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(FontAwesomeIcons.spotify),
                    ),
                  ) : null,
                  details["fiveHundredPx"].length > 0 ? InkWell(
                    onTap: () async{
                      if(await canLaunch(details["fiveHundredPx"])){
                        launch(details["fiveHundredPx"]);
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(FontAwesomeIcons.fiveHundredPx),
                    ),
                  ) : null,
                ],
              ),
              SizedBox(
                height: 64,
              ),
              Text(
                content["footerText"] + " " + details["name"],
                style: GoogleFonts.raleway(
                  fontSize: 24
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 9,
              )
            ],
          ),
        ),
      ) : Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}